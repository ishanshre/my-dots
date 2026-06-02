return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = { ".DS_Store", "node_modules" },
      },
      async_directory_scan = "auto",
      table = false,
      hijack_netrw_behavior = "disabled",
    },
    git_status = {
      enabled = false,
    },
    default_component_configs = {
      name = {
        highlight_opened_files = false,
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
    },
    window = {
      width = 30,
      border = "solid",
    },
  },
}

