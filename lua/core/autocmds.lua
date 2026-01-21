-- Remove trailing whitespace (except current line to avoid moving cursor)
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function()
            vim.cmd([[%s/\s\+$//e]])
        end)
        vim.fn.setpos(".", save_cursor)
    end,
})


local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local opts = { buffer = args.buf, silent = true }

		vim.keymap.set('n', "gd", function() vim.lsp.buf.definition({}) end, opts)
		vim.keymap.set('n', "K", vim.lsp.buf.hover, opts)
		vim.keymap.set('n', "<c-s-K>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', "gi", function() vim.lsp.buf.implementation({}) end, opts)
		vim.keymap.set('n', "gt", function() vim.lsp.buf.type_definition({}) end, opts)
		vim.keymap.set('n', "gr", function() vim.lsp.buf.references() end, opts)

		vim.keymap.set('n', "<c-]>", function() vim.lsp.buf.declaration({}) end, opts)

		vim.keymap.set('n', "<Leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set('n', "<Leader>fa", vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', "<Leader>ih", function() -- toggles inlay hints
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)

		-- diagnostics
		vim.keymap.set('n', "S", vim.diagnostic.open_float, opts)
		vim.keymap.set('n', "<Leader>k", function()
			vim.diagnostic.jump({
                float = true,
                count = 1
            })
		end, opts)
		vim.keymap.set('n', "<Leader>j", function()
			vim.diagnostic.jump({
                float = true,
                count = -1
            })
		end, opts)
	end,
})
