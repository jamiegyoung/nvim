-- Go error handling
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set('n', '<leader>pr', function()
  local current_word = vim.fn.expand("<cword>")
  local number = tonumber(current_word)

  if number then
    local result = number / 16
    local result_str = string.format("%.3f", result) -- Format to 3 decimal places

    -- Get the start and end column of the word under the cursor
    local start_col = vim.fn.col('.') - vim.fn.strlen(current_word) + 1
    local end_col = vim.fn.col('.')

    -- Replace the word with the result
    vim.api.nvim_buf_set_text(0, vim.fn.line('.') - 1, start_col - 1, vim.fn.line('.') - 1, end_col - 1, {result_str})
  else
    vim.notify("Not a number under cursor", vim.log.levels.WARN) -- Optional: Notify if not a number
  end
end, { desc = "Divide number by 16 (float)" })
