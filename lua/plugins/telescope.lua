return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [f]iles" },
		{ "<leader>fg", "<cmd>Telescope find_files<cr>", desc = "[F]ind [g]it files" },
		{ "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Find git files - alternative" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [b]uffers" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>;", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
	},
}
