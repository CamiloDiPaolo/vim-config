-- bufferline
vim.keymap.set("n", "<leader>bQ", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<leader>bn", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<leader>bb", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>bq", ":BufferLinePickClose<CR>")

-- diffview
vim.keymap.set("n", "<leader>diff", ":DiffviewOpen<CR>")

--harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

-- lsp - diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist)

-- nvim-tree
vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pt', builtin.treesitter, {})
