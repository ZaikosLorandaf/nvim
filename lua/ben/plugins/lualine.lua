return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "terafox",
				icons_enabled = true,
				-- section_separators = { left = "", right = "" },
				section_separators = { left = "▓", right = "▓" },
				-- component_separators = { left = "", right = "" },
				component_separators = { left = "░", right = "░" },
				globalstatus = false,
				ignore_focus = {},
				always_divide_middle = true,
				refresh = {
					statusline = 500,
					tabline = 500,
					winbar = 500,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			extensions = {},
		})
	end,
}
