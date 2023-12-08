------------------------
-- CONFIG LSP
------------------------
local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua-language-server",
})


lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })


    -- CONFIG PRETTIER
    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"

    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
    })

    -- END CONFIG PRETTIER
end)

-- CONFIG ICONS FOR SHOW ERRORS/WARNS/INFO/ETC
lsp.set_sign_icons({
    error = '💥',
    warn = '🤨',
    hint = '🤓',
    info = '👽'
})


lsp.setup()

------------------------
-- CONFIG AUTOCOMPLETION
------------------------
local cmp = require('cmp')

-- MAP SELECT AUTOCOMPLETION WITH ENTER
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['J'] = cmp.mapping.select_next_item(cmp_select),
        ['K'] = cmp.mapping.select_prev_item(cmp_select)
    },
    -- preselect first item
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})
