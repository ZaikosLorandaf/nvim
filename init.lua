--  _
-- | |    __ _ _____   _
-- | |   / _` |_  / | | |
-- | |__| (_| |/ /| |_| |
-- |_____\__,_/___|\__, |
--                 |___/
--
require("core")
require("core.langmap")

-- Bootstrap lazy.nvim {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- -- Bootstrap tree-sitter-cli if cargo is available
-- if vim.fn.executable("tree-sitter") == 0 and vim.fn.executable("cargo") == 1 then
--   vim.notify("Installing tree-sitter-cli via cargo...", vim.log.levels.INFO)
--   vim.fn.jobstart({ "cargo", "install", "--locked", "tree-sitter-cli" }, {
--     on_exit = function(_, code)
--       if code == 0 then
--         vim.notify("tree-sitter-cli installed successfully!", vim.log.levels.INFO)
--       else
--         vim.notify("Failed to install tree-sitter-cli", vim.log.levels.WARN)
--       end
--     end,
--   })
-- end

require("lazy").setup({ import = "plugins" }, {
	install = {
		missing = true,
		colorscheme = { "rose-pine" }
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = "rounded"
	},
	-- performance = {
	-- 	rtp = {
	-- 		disabled_plugins = {
	-- 			"gzip",
	-- 			"tarPlugin",
	-- 			"tohtml",
	-- 			"tutor",
	-- 			"zipPlugin",
	-- 		},
	-- 	},
	-- },
})
vim.cmd.colorscheme("rose-pine-moon")
