return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#131313',
				base01 = '#131313',
				base02 = '#8c8c8f',
				base03 = '#8c8c8f',
				base04 = '#2d2d2f',
				base05 = '#f8f8fd',
				base06 = '#f8f8fd',
				base07 = '#f8f8fd',
				base08 = '#ca647d',
				base09 = '#ca647d',
				base0A = '#6363ce',
				base0B = '#53b965',
				base0C = '#a4a5db',
				base0D = '#6363ce',
				base0E = '#d5d6ff',
				base0F = '#d5d6ff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#8c8c8f',
				fg = '#f8f8fd',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#6363ce',
				fg = '#131313',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#8c8c8f' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#a4a5db', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#d5d6ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#6363ce',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#6363ce',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#a4a5db',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#53b965',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#2d2d2f' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#2d2d2f' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#8c8c8f',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
