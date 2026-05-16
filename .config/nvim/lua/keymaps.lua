-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set(
  "n",
  "<leader>dq",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set(
  "n",
  "<leader>rr",
  ":%s/<C-r><C-w>//g<Left><Left>",
  { desc = "rename all the matching selection" }
)

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", ".", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", ",", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set(
  "n",
  "<leader>sv",
  ":vsplit<CR>",
  { noremap = true, silent = true, desc = "Vertical Split" }
)

-- Horizontal Split
vim.keymap.set(
  "n",
  "<leader>sh",
  ":split<CR>",
  { noremap = true, silent = true, desc = "Horizontal Split" }
)

-- Close the current split
vim.keymap.set("n", "<leader>sc", ":q<CR>", { noremap = true, silent = true, desc = "Close Split" })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.keymap.set("n", "<leader>rp", function()
  local path = vim.fn.expand "%:~:." -- Get path relative to cwd
  path = path:gsub("%.py$", "") -- Remove .py extension
  path = path:gsub("/", ".") -- Replace / with .
  vim.fn.setreg("+", path) -- Yank to system clipboard (optional)
end, { desc = "Yank relative dot-path for python", noremap = true, silent = true })

-- Yank `import <module>`
vim.keymap.set("n", "<leader>ri", function()
  local path = vim.fn.expand "%:~:."
  path = path:gsub("%.py$", "")
  path = path:gsub("/", ".")
  local import_stmt = "import " .. path
  vim.fn.setreg("+", import_stmt)
  print("Copied: " .. import_stmt)
end, { desc = "Yank import <module>", noremap = true, silent = true })

-- Yank `from <module> import *`
vim.keymap.set("n", "<leader>ra", function()
  local path = vim.fn.expand "%:~:."
  path = path:gsub("%.py$", "")
  path = path:gsub("/", ".")
  local import_stmt = "from " .. path .. " import *"
  vim.fn.setreg("+", import_stmt)
  print("Copied: " .. import_stmt)
end, { desc = "Yank from <module> import *", noremap = true, silent = true })

-- Yank `from <parent> import <child>`
vim.keymap.set("n", "<leader>rf", function()
  local path = vim.fn.expand "%:~:."
  path = path:gsub("%.py$", "")
  path = path:gsub("/", ".")
  local parent, child = path:match "(.+)%.([^.]+)$"
  local import_stmt = parent and ("from " .. parent .. " import " .. child) or ("import " .. path)
  vim.fn.setreg("+", import_stmt)
  print("Copied: " .. import_stmt)
end, { desc = "Yank from <parent> import <child>", noremap = true, silent = true })

-- Absolute path
vim.keymap.set("n", "<leader>pa", function()
  local p = vim.fn.expand "%:p"
  vim.fn.setreg("+", p)
  print("Abs path copied: " .. p)
end, { desc = "Copy absolute file path" })

-- Relative path
vim.keymap.set("n", "<leader>pr", function()
  local p = vim.fn.expand "%"
  vim.fn.setreg("+", p)
  print("Rel path copied: " .. p)
end, { desc = "Copy relative file path" })

-- Filename only (no extension)
vim.keymap.set("n", "<leader>pn", function()
  local p = vim.fn.expand "%:t:r"
  vim.fn.setreg("+", p)
  print("Filename copied: " .. p)
end, { desc = "Copy filename (no ext)" })
