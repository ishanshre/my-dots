return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      messages = {
        view_search = false,
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      routes = {
        -- See :h ui-messages
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "^%d+ changes?; after #%d+" },
              { find = "^%d+ changes?; before #%d+" },
              { find = "^Hunk %d+ of %d+$" },
              { find = "^%d+ fewer lines;?" },
              { find = "^%d+ more lines?;?" },
              { find = "^%d+ line less;?" },
              { find = "^Already at newest change" },
              { kind = "wmsg" },
              { kind = "emsg", find = "E486" },
              { kind = "quickfix" },
            },
          },
          view = "notify",
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     require("noice").setup {
  --       lsp = {
  --         -- Configure LSP message overrides
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --       presets = {
  --         bottom_search = true, -- use a classic bottom command-line search
  --         command_palette = true, -- position the command palette at the top
  --         long_message_to_split = true, -- long messages go to a split
  --         inc_rename = false, -- enable for `inc-rename.nvim`
  --         lsp_doc_border = true, -- add borders to LSP hover/doc
  --       },
  --       views = {
  --         cmdline_popup = {
  --           position = {
  --             row = 5,
  --             col = "50%",
  --           },
  --           size = {
  --             width = 60,
  --             height = "auto",
  --           },
  --           border = {
  --             style = "rounded",
  --             padding = { 1, 2 },
  --           },
  --           win_options = {
  --             winblend = 0,
  --             winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  --           },
  --         },
  --       },
  --       notify = {
  --         -- Noice can be used as `vim.notify` so you can route any notification like other messages
  --         -- Notification messages have their level and other properties set.
  --         -- event is always "notify" and kind can be any log level as a string
  --         -- The default routes will forward notifications to nvim-notify
  --         -- Benefit of using Noice for this is the routing and consistent history view
  --         enabled = false,
  --         view = "notify",
  --       },
  --       messages = {
  --         enabled = false, -- enable message rendering
  --         view = "mini", -- default message view
  --       },
  --       commands = {
  --         history = {
  --           enabled = true, -- enable command history
  --           view = "popup",
  --         },
  --       },
  --     }
  --   end,
  -- },
}
