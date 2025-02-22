local function opts(desc)
    return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
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

        require("nvim-tree").setup({})

        vim.keymap.set('n', '<leader>tt', api.tree.toggle, opts('[t]ree [t]oggle'));
        vim.keymap.set('n', '<leader>tf', api.tree.open, opts('[t]ree [f]ocus'));
    end,
}
