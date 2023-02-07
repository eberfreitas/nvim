return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "help",
      "elm",
      "javascript",
      "typescript",
      "html",
      "css",
      "scss"
    },
    highlight = {
      enable = true
    }
  }
}
