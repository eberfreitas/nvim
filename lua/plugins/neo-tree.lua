return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle=true<cr>", desc = "N[e]o-tree" },
	},
	opts = {
		window = {
			filesystem = {
				hijack_netrw_behavior = "open_current",
			},
		},
	},
}
