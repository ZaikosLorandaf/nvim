-- Set <leader> to spacebar
vim.g.mapleader = " "

vim.keymap.set("v", "<s-l>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<s-h>", ":m '<-2<cr>gv=gv")
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { desc = "Split Line", silent = true })

-- What should have been `Y`
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- Quickly compile and preview files
vim.keymap.set("n", "<leader>c", "<cmd>make<cr>")
vim.keymap.set("n", "S", "<nop>")
-- Stop hurting my pinky with <C-w>:
vim.keymap.set("n", "<leader>w", "<C-w>")
-- Quickly navigate between Tabs
vim.keymap.set("n", "<Tab>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>tabnew<cr>")

-- Clear search highlights
vim.keymap.set("n", "<leader><leader>l", "<cmd>nohlsearch<cr>")

-- Don't mess with pasted text
vim.keymap.set("i", "<C-r>", "<C-r><C-o>")

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {}) -- terminal mode Esc
