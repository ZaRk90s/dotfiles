vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Default value for tabstop
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Sync clipboard between OS and Neovim
vim.o.clipboard = "unnamedplus"
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- vim.o.colorcolumn = "80"
vim.o.ruler = true

vim.o.termguicolors = true

vim.opt.scrolloff = 8
vim.wo.signcolumn = "yes"

vim.wo.wrap = true

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true

vim.o.list = false

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

vim.o.lazyredraw = true
vim.o.timeout = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500

vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = false

vim.api.nvim_create_user_command("Hola", function()
    print("¡Hola desde Neovim!")
end, {})
