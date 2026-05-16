local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
    vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins.whichkey" },
    { import = "plugins.nvim_lspconfig" },
    { import = "plugins.snacks" },
    { import = "plugins.confirm" },
    { import = "plugins.blink_cmp" },
    { import = "plugins.catppuccin" },
    { import = "plugins.rose_pine" },
    -- { import = "plugins.comments" },
    { import = "plugins.folke_comment" },
    { import = "plugins.mini" },
    { import = "plugins.treesetter" },
    { import = "plugins.debug" },
    { import = "plugins.autopairs" },
    { import = "plugins.lazygit" },
    { import = "plugins.lualine" },
    { import = "plugins.misc" },
    { import = "plugins.venv_selector" },
    { import = "plugins.vim_visual_mini" },
    { import = "plugins.terminal" },
    { import = "plugins.fzf_lua" },
    { import = "plugins.yazi" },
    { import = "plugins.noice" },
    { import = "plugins.gitsigns" },
    { import = "plugins.markdown_render" },
    { import = "plugins.codeium" },
    { import = "plugins.cursorline" },
    { import = "plugins.smear_cursor" },
    { import = "plugins.kanagawa" },
    { import = "plugins.incline" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
