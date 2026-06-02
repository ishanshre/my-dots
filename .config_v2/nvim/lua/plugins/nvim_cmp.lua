return {
  {
    "onsails/lspkind.nvim",
    event = "VeryLazy", -- Load when needed
  },
  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- Build Step for regex support in snippets
          if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then return end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- Premade snippets (optional, uncomment to use)
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "hrsh7th/cmp-path", -- Path completion source
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"

      luasnip.config.setup {} -- Default configuration for LuaSnip

      cmp.setup {
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        mapping = cmp.mapping.preset.insert {
          ["<C-n>"] = cmp.mapping.select_next_item(), -- Next item
          ["<C-p>"] = cmp.mapping.select_prev_item(), -- Previous item
          ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
          ["<C-y>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
          ["<C-f>"] = cmp.mapping.confirm { select = true }, -- Confirm selection
          ["<C-Space>"] = cmp.mapping.complete {}, -- Manually trigger completion
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "codeium" },
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Codeium = "" },
          },
        },
      }
    end,
  },
}
