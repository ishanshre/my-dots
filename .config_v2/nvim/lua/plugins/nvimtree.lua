return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, for file icons
  },
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  keys = {
    { '\\', ':NvimTreeToggle<CR>', desc = 'Toggle NvimTree', silent = true },
  },
  -- opts = {
  --   disable_netrw = true, -- Disable netrw for better performance
  --   hijack_netrw = true,
  --   hijack_cursor = true, -- Keep cursor in the tree
  --   update_cwd = true, -- Update the current working directory
  --   diagnostics = {
  --     enable = false, -- Disable diagnostics for better speed
  --   },
  --   git = {
  --     enable = false, -- Disable Git integration for faster rendering
  --   },
  --   renderer = {
  --     highlight_git = false, -- Do not highlight Git changes
  --     highlight_opened_files = "none", -- Avoid highlighting opened files
  --     icons = {
  --       show = {
  --         git = false, -- Disable Git icons
  --         folder = true,
  --         file = true,
  --         folder_arrow = true,
  --       },
  --     },
  --   },
  --   filters = {
  --     dotfiles = false, -- Hide dotfiles
  --     custom = { 'node_modules', '.git', '.DS_Store', '.venv', 'venv' }, -- Exclude unnecessary folders
  --   },
  --   view = {
  --     width = 30, -- Set a reasonable width
  --     side = 'left',
  --     adaptive_size = false,
  --   },
  --   actions = {
  --     open_file = {
  --       resize_window = false, -- Do not resize the tree window
  --       quit_on_open = true, -- Close the tree after opening a file
  --     },
  --   },
  --   filesystem_watchers = {
  --     enable = false, -- Disable watchers for improved performance in large projects
  --   },
  --   log = {
  --     enable = false, -- Disable logging
  --   },
  -- },
  config = function()
    require("nvim-tree").setup({
	filters = {
		dotfiles = true,
		custom = { "node_modules", "\\.cache", ".git", "dist" },
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	log = {
		enable = true,
		truncate = true,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = true,
			git = false,
			profile = false,
			watcher = true,
		},
	},
	view = {
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local w_h = 70
				local s_h = 42
				local center_x = (screen_w - w_h) / 2
				local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = w_h,
					height = s_h,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * 5)
		end,
	},

	diagnostics = {
		enable = false,
		show_on_dirs = false,
		show_on_open_dirs = false,
		debounce_delay = 500,

		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	git = {
		enable = true,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
		remove_file = {
			close_window = true,
		},
		change_dir = {
			enable = true,
			global = true,
			restrict_above_cwd = false,
		},
	},
	renderer = {
		root_folder_label = true,
		highlight_git = true,
		highlight_opened_files = "none",
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "LICENSE", "Dockerfile" },

		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				none = "",
			},
		},

		icons = {
			git_placement = "after",
			modified_placement = "after",
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = true,
			},

			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "/",
					empty = "/",
					empty_open = "/",
					open = "/",
					symlink = "/",
					symlink_open = "/",
				},
				git = {
					unstaged = "[U]",
					staged = "[S]",
					unmerged = "[ ]",
					renamed = "[R]",
					untracked = "[?]",
					deleted = "[D]",
					ignored = "[I]",
				},
			},
		},
	},
})
  end,
}
