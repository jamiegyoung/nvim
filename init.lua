-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.opt.list = true
vim.opt.listchars = {
  tab = "  ", -- Two spaces for tab
  nbsp = "␣", -- Unicode representation of non-breaking space
  trail = "•", -- Bullet for trailing whitespace
  extends = "⟩", -- Angle bracket for line that extends beyond the screen
  precedes = "⟨", -- Angle bracket for line that precedes the screen
}

function Trim_whitespace()
  local save = vim.fn.winsaveview()
  vim.cmd "%s/\\s\\+$//e"
  vim.fn.winrestview(save)
end

-- Define an autocommand to trigger trim_whitespace() function on BufWritePre event
vim.cmd [[autocmd BufWritePre * lua Trim_whitespace()]]

require "lazy_setup"
require "polish"
