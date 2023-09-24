-- My Personal Configurations:

-- Superior leader key
vim.g.mapleader = ";" 

-- Space is quicker than Shift+Semicolon
vim.keymap.set('n', '<space>', ":")

-- fm -> File Manager
vim.keymap.set('n', '<leader>fm', "<cmd>Exp<cr>")

-- Tree View for the netrw File Manager
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 3
