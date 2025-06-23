local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'rust_analyzer',
  'gopls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})



lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Global Defaults
-- ---------------
-- [n] grn    - rename
-- [n,v] gra  - code action
-- [n] grr    - references
-- [n] gri    - implementation
-- [n] gO     - document_symbol
-- [i] CTRL-S - signature_help
-- [v] an     - outer selection_range
-- [v] in     - inner selection_range
-- [n] [D     - jump to the first diagnostic in the current buffer
-- [n] [d     - jump to the previous diagnostic in the current buffer
-- [n] ]d     - jump to the next diagnostic in the current buffer
-- [n] ]D     - jump to the last diagnostic in the current buffer
--
--
-- lsp.on_attach(function(client, bufnr)
--   vim.keymap.set("n", "gd",          vim.lsp.buf.definition,       { buffer = bufnr, remap = false, desc = "LSP: [G]o to [D]efinition" })
--   vim.keymap.set("n", "K",           vim.lsp.buf.hover,            { buffer = bufnr, remap = false, desc = "LSP: Display symbol informations in floating window" })
--   vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { buffer = bufnr, remap = false, desc = "LSP: [V]iew [W]orkspace [S]ymbol" })
--   vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float,    { buffer = bufnr, remap = false, desc = "LSP: [V]iew [D]etails" })
--   vim.keymap.set("n", "[d",          vim.diagnostic.goto_next,     { buffer = bufnr, remap = false, desc = "LSP: Next diagnostic" })
--   vim.keymap.set("n", "]d",          vim.diagnostic.goto_prev,     { buffer = bufnr, remap = false, desc = "LSP: Previous diagnostic" })
--   vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,      { buffer = bufnr, remap = false, desc = "LSP: [V]iew [C]ode [A]ction(s)" })
--   vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,           { buffer = bufnr, remap = false, desc = "LSP: [R]e[N]ame" })
--   vim.keymap.set("n", "<leader>vci", vim.lsp.buf.implementation,   { buffer = bufnr, remap = false, desc = "LSP: [V]iew [C]ode [I]mplementation(s)" })
--   vim.keymap.set("n", "<leader>vcr", vim.lsp.buf.references,       { buffer = bufnr, remap = false, desc = "LSP: [V]iew [C]ode [R]eferences" })
--   vim.keymap.set("i", "<C-h>",       vim.lsp.buf.signature_help,   { buffer = bufnr, remap = false, desc = "LSP: Signature Help" })
-- end)

lsp.setup()
