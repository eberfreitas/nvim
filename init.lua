local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
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
  {
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
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [f]iles" },
      { "<leader>fg", "<cmd>Telescope find_files<cr>", desc = "[F]ind [g]it files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [b]uffers" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" }
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
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
      }
    }
  },
  {
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
      { "<leader>e", "<cmd>Neotree toggle=true<cr>", desc = "N[e]o-tree" }
    },
    opts = {
      window = {
        filesystem = {
          hijack_netrw_behavior = "open_current"
        }
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {},
    cmd = "Mason"
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "sumneko_lua",
        "elmls",
        "tsserver",
        "html",
        "cssls",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
      end

      local lsp_flags = {
        debounce_text_changes = 150,
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities
          })
        end,
        ["sumneko_lua"] = function()
          lspconfig.sumneko_lua.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end
      })
    end
  },
  -- Snipets & Autocomplete adapted from:
  -- https://github.com/LazyVim/LazyVim/blob/1aa9e26e84726240d834da3599f61569c136141f/lua/lazyvim/plugins/coding.lua
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end
  },
})

vim.cmd.set("hidden")
vim.cmd.set("number")
vim.cmd.set("relativenumber")
vim.cmd.set("list")
vim.cmd.set("listchars=tab:→\\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»")
vim.cmd.set("ruler")
vim.cmd.set("nosmd")
vim.cmd.set("cursorline")
vim.cmd.set("cc=120")
vim.cmd.set("t_Co=256")
vim.cmd.set("bg=dark")
vim.cmd.set("tabstop=4")
vim.cmd.set("softtabstop=0")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("expandtab")

vim.keymap.set("n", "<C-k>", "<cmd>bp<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-x>", "<cmd>bd<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
