return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        -- Register Prettier (prefers local node_modules/.bin)
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    prefer_local = "node_modules/.bin",
                }),
            },
        })
    end
}
