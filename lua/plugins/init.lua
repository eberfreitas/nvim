return {
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "raimondi/delimitmate",
  "ggandor/lightspeed.nvim",
  {
    "mattn/emmet-vim",
    init = function ()
      vim.g.user_emmet_leader_key = "<C-z>"
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end
  },
}
