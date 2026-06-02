return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      -- Basic configurations
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8080"
      vim.g.mkdp_browser = "" -- Use system default browser
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
      }

      -- Keybindings for preview
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Start Markdown Preview" })
      vim.keymap.set(
        "n",
        "<leader>mc",
        ":MarkdownPreviewStop<CR>",
        { desc = "Stop Markdown Preview" }
      )
      vim.keymap.set(
        "n",
        "<leader>mt",
        ":MarkdownPreviewToggle<CR>",
        { desc = "Toggle Markdown Preview" }
      )
    end,
  },
}
