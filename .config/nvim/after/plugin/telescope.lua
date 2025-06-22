local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ no_ignore = true }) end, {}, { desc = 'Telescope [P]roject [F]iles' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope [F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope [F]ind live [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Telescope [F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope [F]ind [H]elp tags' })

vim.keymap.set('n', '<C-p>', builtin.git_files, { })
