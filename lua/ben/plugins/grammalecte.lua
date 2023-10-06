return {
	"dpelle/vim-Grammalecte",
	build = function()
		local grammalecte_url = "https://grammalecte.net/zip/Grammalecte-fr-v2.1.1.zip"
		Grammalecte_path = vim.fn.expand("~/.local/share/nvim/grammalecte")
		-- Download the latest version of Grammalecte ~/.local/share/nvim/grammalecte:
		vim.fn.mkdir(Grammalecte_path, "p")
		vim.fn.system({ "curl", "-L", grammalecte_url, "-o", Grammalecte_path .. "/grammalecte.zip" })
		-- Unzip the file
		vim.fn.system({ "unzip", Grammalecte_path .. "/grammalecte.zip", "-d", Grammalecte_path })
		-- Then set g:grammalecte_cli_py to the unzipped python script
	end,
	config = function()
		vim.g.grammalecte_cli_py = vim.fn.expand("~/.local/share/nvim/grammalecte/grammalecte-cli.py")
	end,
	cmd = { "GrammalecteCheck", "GrammalecteClear" },
	keys = {
		{ "<leader>cg", "<cmd>GrammalecteCheck<cr>" }, -- C.heck G.rammar
		{ "<leader>cs", "<cmd>GrammalecteClear<cr>" }, -- C.heck S.top
	},
}
