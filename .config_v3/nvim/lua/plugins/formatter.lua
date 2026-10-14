return {
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require "formatter.util"

      require("formatter").setup {
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          python = {
            -- Ruff for linting
            function()
              return {
                exe = "ruff",
                args = {
                  "--fix",
                  "--stdin-filename",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "-",
                },
                stdin = true,
              }
            end,
            -- Black for formatting
            function()
              return {
                exe = "black",
                args = { "--quiet", "-" },
                stdin = true,
                timeout = 5000,
              }
            end,
            -- isort for sorting imports
            function()
              return {
                exe = "isort",
                args = { "--profile", "black", "-" },
                stdin = true,
              }
            end,
          },
          lua = {
            -- stylua for formatting
            function()
              return {
                exe = "stylua",
                args = {
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "-",
                },
                stdin = true,
              }
            end,
          },
        },
      }

      -- Keybinding for formatting
      vim.api.nvim_set_keymap("n", "<leader>F", ":Format<CR>", { noremap = true, silent = true })
    end,
  },
}
