return {
    cmd = { "clangd-lsp" },
    filetype = { "c", "cpp" },
    root_markers = { ".git" },
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}
