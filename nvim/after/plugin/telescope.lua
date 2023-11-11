local builtin = require('telescope.builtin')

-- FILE PICKERS
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- VIM PICKERS
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

-- VIM TREESITTER
vim.keymap.set('n', '<leader>pt', builtin.treesitter, {})
