return {
    on_attach = function(client, _)
        -- Disable providers meant for pyright
        for _, provider in ipairs {
            'completion',
            'definition',
            'documentSymbol',
            'rename',
            'references',
            'typeDefinition',
            'workspaceSymbol',
        } do
            client.server_capabilities[provider .. 'Provider'] = false
        end
    end,
}
