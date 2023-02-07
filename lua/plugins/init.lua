return {
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "raimondi/delimitmate",
  "mattn/emmet-vim",
  "ggandor/lightspeed.nvim",
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end
  },
}
