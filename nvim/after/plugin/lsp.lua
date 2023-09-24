------------------------
-- CONFIG LSP
------------------------
local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
"tsserver",
"eslint",
"lua-language-server",
"custom-elements-languageserver"
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- ENABLE FORMAT ON SAVE
lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
    formatting_options = {
        tabSize = 2,
    }
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript', 'javascriptreact', 'typescriptreact'},
    ['lua-language-server'] = {'lua'}
  }
})

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
    ['L'] = cmp.mapping.confirm({select = false}),
    ['J'] = cmp.mapping.select_next_item(cmp_select),
    ['K'] = cmp.mapping.select_prev_item(cmp_select)
  },
  -- preselect first item
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})

