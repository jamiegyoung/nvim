-- Clear trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Set the color columns to 80 and 120
vim.cmd("set colorcolumn=80,120")
