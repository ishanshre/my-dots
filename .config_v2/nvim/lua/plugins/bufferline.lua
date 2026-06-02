return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "moll/vim-bbye",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- vim.opt.linespace = 8
    require("bufferline").setup {
      options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = nil,
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 10,
        diagnostics = false,
        custom_filter = function(bufnr)
          -- if the result is false, this buffer will be shown, otherwise, this
          -- buffer will be hidden.

          -- filter out filetypes you don't want to see
          local exclude_ft = { "qf", "fugitive", "git" }
          local cur_ft = vim.bo[bufnr].filetype
          local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

          if should_filter then return false end

          return true
        end,
        show_buffer_icons = false,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "bar",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
      },
    }

    -- Keymaps
    local opts = { noremap = true, silent = true, desc = "Go to Buffer" }
    vim.keymap.set(
      "n",
      "<leader>cb",
      "<Cmd>Bdelete!<CR>",
      { noremap = true, silent = true, desc = "Close Buffer" }
    )
    -- vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
    vim.keymap.set(
      "n",
      ",",
      "<Cmd>BufferLineCyclePrev<CR>",
      { noremap = true, silent = true, desc = "Switch to Left Buffer" }
    )
    vim.keymap.set(
      "n",
      ".",
      "<Cmd>BufferLineCycleNext<CR>",
      { noremap = true, silent = true, desc = "Switch to Right Buffer" }
    )
    vim.keymap.set("n", "<leader><Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
    --        vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
    vim.keymap.set("n", "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1)<CR>", opts)
    vim.keymap.set("n", "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2)<CR>", opts)
    vim.keymap.set("n", "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3)<CR>", opts)
    vim.keymap.set("n", "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4)<CR>", opts)
    vim.keymap.set("n", "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5)<CR>", opts)
    vim.keymap.set("n", "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6)<CR>", opts)
    vim.keymap.set("n", "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7)<CR>", opts)
    vim.keymap.set("n", "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8)<CR>", opts)
    vim.keymap.set("n", "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9)<CR>", opts)
    -- Vertical Split
  end,
}
