local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup('plugins')

vim.cmd.set("hidden")
vim.cmd.set("number")
vim.cmd.set("relativenumber")
vim.cmd.set("list")
vim.cmd.set("listchars=tab:→\\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»")
vim.cmd.set("ruler")
vim.cmd.set("nosmd")
vim.cmd.set("cursorline")
vim.cmd.set("cc=120")
vim.cmd.set("t_Co=256")
vim.cmd.set("bg=dark")
vim.cmd.set("tabstop=4")
vim.cmd.set("softtabstop=0")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("expandtab")

vim.keymap.set("n", "<C-k>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>bp<cr>")
vim.keymap.set("n", "<C-x>", "<cmd>bd<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")
