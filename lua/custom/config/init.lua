-- Clear trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Set the color columns to 80 and 120
vim.cmd("set colorcolumn=80,120")

vim.api.nvim_create_user_command('Jamtest', function()
    -- Get the UUID using uuidgen -t
    local uuid = 'jamtest-' .. vim.fn.system('uuidgen -t'):gsub('%s+', '')

    -- Get the current cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    local row = pos[1] - 1
    local col = pos[2]

    -- Insert the UUID at the cursor position
    vim.api.nvim_buf_set_text(0, row, col, row, col, {uuid})
end, {
    desc = "Insert a time-based UUID at cursor position"
})
