return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                -- Default terminal settings
                size = 20,                -- Default size of the terminal
                open_mapping = [[<c-\>]], -- Keymap to toggle the terminal
                hide_numbers = true,      -- Hide line numbers in the terminal
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,     -- Darken the terminal background
                start_in_insert = true,
                insert_mappings = true, -- Allow mappings in insert mode
                persist_size = true,
                direction = "float",    -- Make the terminal float by default
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved", -- Border style for the floating terminal
                    winblend = 3,      -- Transparency for the floating window
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })

            -- Custom keymaps for terminal
            local Terminal = require("toggleterm.terminal").Terminal

            -- Create a floating terminal instance
            local float_term = Terminal:new({
                direction = "float",
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Esc>", "<cmd>close<CR>",
                        { noremap = true, silent = true })
                    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<cmd>close<CR>",
                        { noremap = true, silent = true })
                end,
            })

            -- Keymap to toggle the floating terminal
            vim.keymap.set("n", "<leader>tf", function()
                float_term:toggle()
            end, { desc = "Toggle floating terminal" })

            -- Keymap to open a horizontal terminal
            vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>",
                { desc = "Open horizontal terminal" })

            -- Keymap to open a vertical terminal
            vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Open vertical terminal" })
        end,
    },
}
