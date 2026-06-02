vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.background = "dark"

-- vim.opt.cmdheight = 0
--
-- vim.diagnostic.config {
--   virtual_text = {
--     prefix = "●", -- Choose what symbol appears in ghost text
--     spacing = 2,
--   },
--   signs = true,
--   underline = true,
--   update_in_insert = false, -- disable inline error messages while typing
--   severity_sort = true,
-- }
--

-- Neovide specific configurations
if vim.g.neovide then
  -- Font configuration
  vim.opt.guifont = "ComicShannsMono Nerd Font:h11" -- Adjust font and size as needed

  -- Scaling
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.10)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.10)
  end)

  -- Copy/paste from system clipboard specifically for Neovide GUI
  vim.keymap.set({'n', 'v'}, '<C-S-c>', '"+y', { noremap = true, silent = true })
  vim.keymap.set({'n', 'v'}, '<C-S-v>', '"+p', { noremap = true, silent = true })
  vim.keymap.set('i', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
  vim.keymap.set('c', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
  vim.keymap.set('t', '<C-S-v>', '<C-\\><C-n>"+pi', { noremap = true, silent = true })

  -- Allow normal <C-v> to still be block visual mode, but if user wants GUI standard:
  vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
  vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
  vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
  vim.keymap.set('c', '<C-v>', '<C-r>+', { noremap = true, silent = true })
  vim.keymap.set('t', '<C-v>', '<C-\\><C-n>"+pi', { noremap = true, silent = true })


  -- Window settings
  -- vim.g.neovide_opacity = 0.95
  vim.g.neovide_hide_mouse_when_typing = true

  -- Cursor settings
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8

  -- Fix terminal colors for apps like yazi running inside Neovide terminal
  vim.env.COLORTERM = "truecolor"
end
