return {
	"dpelle/vim-Grammalecte",
	cmd = { "GrammalecteCheck", "GrammalecteClear" },
	config = function()
		vim.g.grammalecte_cli_py = "/usr/bin/grammalecte-cli"
	end,
}
