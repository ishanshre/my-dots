return {
    -- Debugging plugin
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Go debugger
        'leoluz/nvim-dap-go',

        -- Python debugger
        'mfussenegger/nvim-dap-python',
    },
    keys = function(_, keys)
        local dap = require 'dap'
        local dapui = require 'dapui'
        return {
            -- Basic debugging keymaps
            { '<F5>',      dap.continue,          desc = 'Debug: Start/Continue' },
            { '<F1>',      dap.step_into,         desc = 'Debug: Step Into' },
            { '<F2>',      dap.step_over,         desc = 'Debug: Step Over' },
            { '<F3>',      dap.step_out,          desc = 'Debug: Step Out' },
            { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
            {
                '<leader>B',
                function()
                    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
                end,
                desc = 'Debug: Set Breakpoint',
            },
            { '<F7>', dapui.toggle, desc = 'Debug: Toggle DAP UI' },
            unpack(keys),
        }
    end,
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        -- Mason DAP setup
        require('mason-nvim-dap').setup {
            automatic_installation = true,
            ensure_installed = {
                'delve', -- Go debugger
                'debugpy', -- Python debugger
            },
        }

        -- Dap UI setup
        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- DAP listeners for opening and closing the UI
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Golang specific configuration
        require('dap-go').setup {
            delve = {
                detached = vim.fn.has 'win32' == 0, -- On Windows, run attached
            },
        }

        -- Python specific configuration
        require('dap-python').setup('python') -- Specify the path to your Python interpreter
        dap.listeners.after.event_initialized['dap-python'] = function()
            dapui.open()
        end
    end,
}
