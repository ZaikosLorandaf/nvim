return {
	'mhinz/vim-startify',
	config = function()

-- Define your custom header as a Lua table
local header = {
    '    _   _                 _              ',
    '   | \\ | | ___  _____   _(_)_ __ ___     ',
    '   |  \\| |/ _ \\/ _ \\ \\ / / | \'_ ` _ \\    ',
    '   | |\\  |  __/ (_) \\ V /| | | | | | |   ',
    '   |_| \\_|\\___|\\___/ \\_/ |_|_| |_| |_|   ',
    '',
}


-- Set the g:startify_custom_header variable
local centered_header = vim.fn["startify#center"](header)
vim.g.startify_custom_header = centered_header
	end
}

--   _   _                 _              
--  | \ | | ___  _____   _(_)_ __ ___     
--  |  \| |/ _ \/ _ \ \ / / | '_ ` _ \    
--  | |\  |  __/ (_) \ V /| | | | | | |   
--  |_| \_|\___|\___/ \_/ |_|_| |_| |_|   
--                                        

