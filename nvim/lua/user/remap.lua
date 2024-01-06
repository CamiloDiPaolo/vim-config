-- nvim
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<C-c>")

vim.keymap.set("n", "<A-J>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==")

vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>w", ':w<CR>')
vim.keymap.set("n", "<leader>q", ':q<CR>')

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
