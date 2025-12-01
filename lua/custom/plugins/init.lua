-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	opts = {
	-- 		suggestion = {
	-- 			auto_trigger = false,
	-- 			debounce = 150,
	-- 			keymap = {
	-- 				accept = "<Tab>",      -- Tab for accept (common on macOS)
	-- 				accept_word = "<M-w>",
	-- 				next = "<M-]>",
	-- 				prev = "<M-[>",
	-- 				dismiss = "<C-]>",
	-- 			}
	-- 		},
	-- 		filetypes = { ["*"] = true },
	-- 	},
	-- },
	-- {
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	-- 	branch = "canary",
	-- 	dependencies = {
	-- 		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	-- 		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	-- 	},
	-- 	opts = {
	-- 		debug = true, -- Enable debugging
	-- 		-- See Configuration section for rest
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
	-- 	},
	-- },
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	config = function()
	-- 		require("codecompanion.adapters").extend("gemini", {
	-- 			env = {
	-- 				api_key = function()
	-- 					return os.getenv("GEMINI_API_KEY")
	-- 				end,
	-- 				model = "schema.model.default",
	-- 			}
	-- 		})
	-- 		require("codecompanion").setup({
	-- 			strategies = {
	-- 				chat = {
	-- 					adapter = "gemini",
	-- 				},
	-- 				inline = {
	-- 					adapter = "gemini",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	lazy = false,
	-- 	version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	-- 	opts = {
	-- 		-- add any opts here
	-- 		-- for example
	-- 		provider = "gemini",
	-- 		gemini = {
	-- 			model = "gemini-2.0-flash"
	-- 		}
	-- 	},
	-- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- 	build = "make",
	-- 	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		--- The below dependencies are optional,
	-- 		"echasnovski/mini.pick", -- for file_selector provider mini.pick
	-- 		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
	-- 		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
	-- 		"ibhagwan/fzf-lua", -- for file_selector provider fzf
	-- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	-- 		"zbirenbaum/copilot.lua", -- for providers='copilot'
	-- 		{
	-- 			-- support for image pasting
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				-- recommended settings
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 					-- required for Windows users
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			-- Make sure to set this up properly if you have lazy=true
	-- 			'MeanderingProgrammer/render-markdown.nvim',
	-- 			opts = {
	-- 				file_types = { "markdown", "Avante" },
	-- 			},
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- },
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
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", { desc = "Leap from window" })
		end,
	},
	{
		"kkoomen/vim-doge",
		lazy = false,
		keys = {
			{ "<leader>dg", "<cmd>DogeGenerate<cr>", desc = "Generate Doge" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"greggh/claude-code.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("claude-code").setup({
				command = "/Users/jamieyoung/.claude/local/claude",
				window = {
					split_ratio = 0.3,
					position = "botright",
					enter_insert = true
				},
				refresh = {
					enable = true,
					updatetime = 100
				}
			})
		end,
		keys = {
			{ "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Claude Code" },
		},
	},
}
