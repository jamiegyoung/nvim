-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { auto_trigger = true, debounce = 150 },
			filetypes = { ["*"] = true },
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"crnvl96/lazydocker.nvim",
		event = "VeryLazy",
		opts = {}, -- automatically calls `require("lazydocker").setup()`
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>ld", "<cmd>LazyDocker<cr>", desc = "LazyGit" },
		},
	},
	{
		"tris203/hawtkeys.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = {
			customMaps = {
				["lazy"] = {
					method = "lazy",
				},
			},
		},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")
			leap.add_default_mappings()

			-- Unmap the default 't' keybinding
			vim.api.nvim_set_keymap("", "s", "", { noremap = true })
			-- Map 't' to leap forward
			vim.api.nvim_set_keymap("n", "s", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("x", "s", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("o", "s", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
		end,
	},
}
