
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

vim.g.mapleader = " "

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
