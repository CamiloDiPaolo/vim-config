-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope for search files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- themes
    use { "ellisonleao/gruvbox.nvim" }
    use { "lunarvim/horizon.nvim" }


    -- treesitter for highligthing
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use { 'nvim-treesitter/playground' }

    -- harpoon for pin files
    use { 'theprimeagen/harpoon' }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- git diff
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- prettier for formating
    use('MunifTanjim/prettier.nvim')

    -- nerdtree for files navigation
    use { 'preservim/nerdtree' }
    -- nerdtree plug for git
    use { 'Xuyuanp/nerdtree-git-plugin' }
    -- nerdtree plug for icons
    use { 'ryanoasis/vim-devicons' }
    -- nerdtree plug for colors
    use { 'tiagofumo/vim-nerdtree-syntax-highlight' }

    -- nvim-web-icons for icons
    use { 'nvim-tree/nvim-web-devicons' }

    -- lualine for status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- tmux for using tmux
    use({
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    })
end)
