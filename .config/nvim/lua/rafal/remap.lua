vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>y", '"+y') -- copy to system clipboard
vim.keymap.set("n", "<leader>p", '"+p') -- paste from system clipboard

-- CTRL-L
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights when <ESC> in normal mode

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80,120"

-- whitechars
-- :set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
vim.opt.listchars = {
    eol = '⏎',   -- U+21B5
    tab = '├─>',  -- U+BB
--    tab = '» ',  -- U+BB
    trail = '·', -- U+B7
    nbsp = '⎵'   -- U+23B5
}
-- vim.opt.list = true
-- :set list
