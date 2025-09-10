return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        { 'romgrk/fzy-lua-native',       build = 'make' },
        {
            'nvim-telescope/telescope-fzy-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            -- build = 'make',

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            --[[ cond = function()
              return vim.fn.executable 'make' == 1
            end, --]]
        }
    },
    config = function()
        -- Enable Telescope extensions if they are installed
        require('telescope').load_extension('fzy_native')
        require('telescope').setup({
            defaults = {
                path_display = { 'smart' },
                layout_strategy = 'vertical',
                layout_config = {
                    width = 0.9,
                    preview_height = 0.5
                }
            }
        })


        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [H]elp' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[f]ind [K]eymaps' })
        vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = '[f]ind [F]iles' })
        vim.keymap.set('n', '<leader>fff', builtin.git_files, { desc = '[f]ind [F]ull (all) [F]iles' })
        vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[f]ind [S]elect Telescope' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[f]ind current [W]ord' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind by [G]rep' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [D]iagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[f]ind [R]esume' })
        vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[f]ind Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    end
}
