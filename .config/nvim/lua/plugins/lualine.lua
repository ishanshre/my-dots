return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        theme = "auto",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        always_divide_middle = true,
        globalstatus = true, -- Show a single statusline for all windows
      },
      sections = {
        lualine_a = { "mode" }, -- Displays current mode (e.g., NORMAL, INSERT)
        lualine_b = { "branch", "diff" }, -- Git branch and changes
        lualine_c = {
          {
            "filename",
            path = 1, -- Show relative path
            shorting_target = 100, -- Shorten path if it exceeds this length
            symbols = {
              modified = "[+]", -- File is modified
              readonly = "[-]", -- File is readonly
              unnamed = "[No Name]", -- No file name
            },
          },
          { "buffers", mode = 1 },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            colored = true, -- Color diagnostic symbols
            update_in_insert = false,
          },
        },
        lualine_y = { "filetype", "encoding", "fileformat" }, -- File details
        lualine_z = { "location", "progress" }, -- Cursor position
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree", "quickfix", "fugitive" }, -- Add extensions for specific plugins
    }
  end,
}
