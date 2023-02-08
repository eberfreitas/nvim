return {
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-sleuth",
	"raimondi/delimitmate",
	"ggandor/lightspeed.nvim",
	{
		"mattn/emmet-vim",
		init = function()
			vim.g.user_emmet_leader_key = "<C-z>"
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
}
