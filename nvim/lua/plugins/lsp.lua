local prepare_lsp_settings = require('lsp.utils').prepare_lsp_settings

return {
    {
        'b0o/SchemaStore.nvim',
        ft = { 'json', 'jsonc' },
    },
    { 'folke/neodev.nvim', ft = 'lua' },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require 'lsp.null-ls'
        end,
    },
    {
        'jose-elias-alvarez/typescript.nvim',
        config = function()
            require('typescript').setup {
                server = prepare_lsp_settings(require 'lsp.servers.typescript'),
            }
        end,
        ft = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
        },
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'lsp.signs'

            local lspconfig = require 'lspconfig'

            for _, server in ipairs {
                'clangd',
                'cssmodules_ls',
                'cssls',
                'html',
                'emmet_ls',
                'jedi_language_server',
                'jsonls',
                'pyright',
                'sqls',
                'sumneko_lua',
                'tailwindcss',
            } do
                local status, settings =
                    pcall(require, 'lsp.servers.' .. server)

                if not status then
                    settings = {}
                end

                lspconfig[server].setup(prepare_lsp_settings(settings))
            end
        end,
        dependencies = {
            {
                'SmiteshP/nvim-navic',
                opts = {
                    icons = {
                        File = '',
                        Module = '',
                        Namespace = '',
                        Package = '',
                        Class = '',
                        Method = '',
                        Property = '',
                        Field = '',
                        Constructor = '',
                        Enum = '',
                        Interface = '',
                        Function = '',
                        Variable = '',
                        Constant = '',
                        String = '',
                        Number = '',
                        Boolean = '',
                        Array = '',
                        Object = '',
                        Key = '',
                        Null = '',
                        EnumMember = '',
                        Struct = '',
                        Event = '',
                        Operator = '',
                        TypeParameter = '',
                    },
                    highlight = true,
                    separator = ' > ',
                    safe_output = true,
                },
                lazy = true,
            },
        },
    },
}
