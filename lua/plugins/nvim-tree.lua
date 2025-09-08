local function opts(desc, buf)
    return { desc = "nvim-tree: " .. desc, buffer = buf, noremap = true, silent = true, nowait = true }
end

local function on_attach(buf)
    local api = require('nvim-tree.api');

    -- default mappings
    api.config.mappings.default_on_attach(buf)

    -- custom mappings
    vim.keymap.set('n', '<leader>tv', api.node.open.vertical, opts('[t]ree open [v]ertical split', buf));
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require('nvim-tree.api');

        require("nvim-tree").setup({
            on_attach = on_attach
        })

        vim.keymap.set('n', '<leader>tt', api.tree.toggle, opts('[t]ree [t]oggle'));
        vim.keymap.set('n', '<leader>tf', api.tree.open, opts('[t]ree [f]ocus'));
        vim.keymap.set('n', '<leader>tff', function() api.tree.find_file({ focus = true }) end,
            opts('[t]ree [f]ocus [f]ile'));
    end,
}
