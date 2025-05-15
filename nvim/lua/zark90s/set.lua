vim.o.guicursor = ""
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.kitty_fast_forwarded_modifiers = "super"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Default value for tabstop
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Enable mouse mode
vim.o.mouse = "a"
vim.o.foldmethod = "manual"
vim.o.autochdir = true

-- Sync clipboard between OS and Neovim
vim.o.clipboard = "unnamedplus"
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
-- Set timeout for key sequences
vim.o.timeout = true
vim.o.timeoutlen = 250

-- Improve default seach behavior 
vim.o.incsearch = true

-- Set the scolloff
vim.o.scrolloff = 10
-- No highlight current line as cursor
vim.o.cursorline = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- set termguicolors to enable highlight groups
vim.o.termguicolors = true

-- Renders spaces as "·"
vim.opt.list = false
vim.opt.listchars = vim.opt.listchars + "space:·"

-- Do not create swap files as this config autosaving everything on disk
vim.opt.swapfile = false
vim.opt.title = true
function GetCurrentIconFile()
    local filename = vim.fn.expand "%:t"
    local icon = require("nvim-web-devicons").get_icon(filename)
    return icon or ""
end
vim.o.titlestring = '%{fnamemodify(getcwd(), ":t")} %{v:lua.GetCurrentIconFile()} %{expand("%:t")}'
