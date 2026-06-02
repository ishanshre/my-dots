-- return {
--     {
--         "linux-cultist/venv-selector.nvim",
--         lazy = false,
--         branch = "regexp", -- This is the regexp branch, use this for the new version
--         config = function()
--             require("venv-selector").setup()
--         end,
--         keys = {
--             { ",v", "<cmd>VenvSelect<cr>" },
--         },
--     },
-- }
--
--
--

return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", lazy = true }, -- Load Telescope lazily
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("venv-selector").setup {
        -- Your configuration options
      }
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
  -- Add Telescope but restrict its usage
  {
    "nvim-telescope/telescope.nvim",
    lazy = true, -- Ensure Telescope is loaded only when needed
    config = function()
      require("telescope").setup {
        defaults = {
          -- Minimal configuration for venv-selector
          mappings = {
            i = { ["<Esc>"] = require("telescope.actions").close },
          },
        },
      }
    end,
  },
}

-- return {
--     {
--         "nvim-telescope/telescope.nvim", -- Add Telescope as a dependency
--         dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Telescope
--         config = function()
--             require("telescope").setup({
--                 defaults = {
--                     file_ignore_patterns = { "node_modules", ".git/" },
--                     layout_config = { prompt_position = "top" },
--                     sorting_strategy = "ascending",
--                 },
--             })
--         end,
--     },
--     {
--         "linux-cultist/venv-selector.nvim",
--         lazy = false,
--         branch = "regexp", -- Use the 'regexp' branch for the latest features
--         config = function()
--             require("venv-selector").setup({
--                 search = {
--                     venv_managers = { "venv", "virtualenv", "conda" }, -- Supported virtual environment types
--                     parents = 2, -- Search up to N levels above the current file
--                 },
--                 auto_refresh = true, -- Refresh the list automatically
--             })
--         end,
--         keys = {
--             { ",v", "<cmd>VenvSelect<CR>", desc = "Select Virtual Environment" },
--         },
--     },
-- }
