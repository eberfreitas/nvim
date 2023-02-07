return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = { theme = "gruvbox" },
		tabline = {
			lualine_a = { "buffers" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "diagnostics" },
			lualine_z = { "tabs" },
		},
	},
}
