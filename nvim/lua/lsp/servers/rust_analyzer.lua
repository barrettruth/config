return {
    standalone = false,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                overrideCommand = {
                    'cargo',
                    'clippy',
                    '--message-format=json',
                    '--',
                    '-W', 'clippy::expect_used',
                    '-W', 'clippy::pedantic',
                    '-W', 'clippy::unwrap_used',
                },
            },
        },
    },
    on_attach = function(client, _)
        require('lsp.utils').on_attach(client, _)

        bmap { 'n', '\\Rc', '<cmd>RustCodeAction<cr>' }
        bmap { 'n', '\\Rm', '<cmd>RustExpandMacro<cr>' }
    end,
}
