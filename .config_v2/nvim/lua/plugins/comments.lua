return {
  "numToStr/Comment.nvim",
  -- We use the dependencies to fix the Treesitter context issue
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 1. Setup the context string plugin (required for Nvim 0.12+)
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }

    -- 2. Setup Comment.nvim with a safe check for the parser
    require("Comment").setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }

    -- 3. Fix: Neovim 0.12 sends <C-_> for <C-/> in most terminals
    local api = require "Comment.api"
    local opts = { noremap = true, silent = true }

    -- Normal Mode
    vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, opts)
    vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, opts)

    -- Visual Mode
    vim.keymap.set("v", "<C-_>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end, opts)
  end,
}
