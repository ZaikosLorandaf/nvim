return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local filepath = "%m %f"
		local mode_map = {
			["n"] = "",
			["v"] = "",
			["V"] = "",
			["i"] = "",
			["R"] = "",
			["c"] = "",
			["t"] = "",
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "powerline_dark",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},

			sections = {
				lualine_a = {
					function()
						return mode_map[vim.api.nvim_get_mode().mode] or "__"
					end,
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = { filepath },
				lualine_y = { "encoding", "fileformat", "filetype" },
				lualine_z = { "progress", "location" },
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
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
