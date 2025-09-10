return {
    { 'lewis6991/gitsigns.nvim', },
    {
        'tpope/vim-fugitive',
        config = function()
            local gs = require('gitsigns')
            local map = function(key, command, comment)
                vim.keymap.set("n", "<leader>g" .. key, command, { desc = "[G]it " .. comment })
            end

            -- Fugitive keybindings
            map("s", ":Git<CR>a", "[S]tatus")
            map("c", ":Git add -A | Git commit --verbose<CR>", "[C]ommit")
            map("f", ":Git fetch --prune", "[F]etch")
            map("p", ":Git push<CR>", "[P]ush")
            map("d", ":Gdiffsplit<CR>", "[D]iff")
            map("D", ":Gdiffsplit!<CR>", "[D]iff 3-way")
            map("b", ":Git blame<CR>", "[B]lame")

            -- Gitsigns keybindings
            map("hn", function() gs.next_hunk() end, "[H]unk [N]ext")
            map("hp", function() gs.prev_hunk() end, "[H]unk [P]rev")
            map("hr", function() gs.reset_hunk() end, "[H]unk [R]eset")
            map("hv", function() gs.preview_hunk() end, "[H]unk [V]iew")
            map("hb", function() gs.blame_line({ full = true }) end, "[H]unk [B]lame")
        end
    }
}
