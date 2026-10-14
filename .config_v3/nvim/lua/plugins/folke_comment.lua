return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has "nvim-0.10.0" == 1, -- Only loads if you're on Nvim 0.10+
  config = function(_, opts)
    require("ts-comments").setup(opts)

    -- Mapping Ctrl + / to the native comment operator
    -- Note: Terminals send <C-_> for <C-/>
    local map = vim.keymap.set
    map("n", "<C-_>", "gcc", { remap = true, desc = "Toggle Comment" })
    map("n", "<C-/>", "gcc", { remap = true, desc = "Toggle Comment" })
    map("v", "<C-_>", "gc", { remap = true, desc = "Toggle Comment" })
    map("v", "<C-/>", "gc", { remap = true, desc = "Toggle Comment" })
  end,
}
