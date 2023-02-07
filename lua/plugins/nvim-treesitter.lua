return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "help",
      "elm",
      "elixir",
      "javascript",
      "typescript",
      "html",
      "css",
      "scss",
      "ruby",
      "rust"
    },
  }
}
