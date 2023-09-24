-- My Personal Configurations:

-- Superior leader key
vim.g.mapleader = ";"

-- Space is quicker than Shift+Semicolon
vim.keymap.set("n", "<space>", ":")

-- Set encoding to UTF-8
vim.opt.encoding = "utf-8"

-- Display all matching files when tab completing
vim.opt.wildmenu = true

-- Don't show the previously typed command
vim.opt.shortmess:append("c")

-- Set absolute and relative number hybrid
vim.opt.number = true
vim.opt.relativenumber = true

-- View column count
vim.opt.ruler = true

-- Disable the statusline
vim.opt.laststatus = 0

-- Sensible split directions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set tab width and shift width to 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Expanding tabs
vim.opt.expandtab = true

-- Set fold method to marker for Vim folding
vim.opt.foldmethod = "marker"

-- Spelling
vim.opt.complete:append("kspell") -- Better Spell Checking
vim.opt.spelllang = "fr" -- French prose

-- Tag Editing
vim.api.nvim_set_keymap("i", "<leader>t", "<++>", { noremap = true })
vim.api.nvim_set_keymap("i", "<leader>:", '<Esc>/<++><CR>"_c4l', { noremap = true })

-- Quickly save
vim.api.nvim_set_keymap("n", "<Leader>w", ":update<CR>", { silent = true })

-- Logical way to Yank
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- Easily escape terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- Split motion
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

-- Saving and quitting buffers
vim.api.nvim_set_keymap("n", "ZF", "ZQ", {})
vim.api.nvim_set_keymap("n", "<leader>w", ":update<CR>", { silent = true })

-- Remove trailing white spaces on BufWritePre
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Tree View for the netrw File Manager
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
-- If nvim is opened with no arguments, open the netrw file manager
local mygroup = vim.api.nvim_create_augroup("loading_netrwPlugin", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	callback = function()
		-- Getting the file name that you pass when you launch nvim,
		local current_file = vim.fn.expand("%")
		-- if we have already file_name, then, we edit it
		if current_file ~= "" then
			vim.cmd(":silent! edit " .. current_file)
		else
			-- We will check if the window (buffer) is the lazy nvim, as it conflict if the buffer (popup menu) is lazy
			local lazy_popup_buf_exists = false
			-- We will get list of all current opened buffers
			local buf_list = vim.api.nvim_list_bufs()
			for _, buf in ipairs(buf_list) do
				-- We will obtain from the table only the filetype
				local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
				if buf_ft == "lazy" then
					lazy_popup_buf_exists = true
				end
			end -- Check if vim-floaterm is loaded
			local has_floaterm, _ = pcall(require, "floaterm")
			if not lazy_popup_buf_exists and not has_floaterm then
				-- Then we can safely loading netrwPlugin at startup
				vim.cmd(":silent! Explore")
			end
		end
	end,
	group = mygroup,
})
