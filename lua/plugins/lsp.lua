local function enableCompletion(client, buf)
    if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end
end

local function formatOnSave(client, buf)
    if client:supports_method('textDocument/formatting') then
        -- Format the current buffer on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = buf, id = client.id })
            end,
        })
    end
end

local function onLspAttach(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufopts = function(desc)
        return { noremap = true, silent = true, buffer = args.buf, desc = desc }
    end


    -- enableCompletion(client, args.buf)
    formatOnSave(client, args.buf)

    -- LSP actions
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts("[g]o to [d]efinition"))         -- Go to definition
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts("[g]o to [D]eclaration"))       -- Go to declaration
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts("[g]o to [r]eferences"))         -- Find references
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts("[g]o to [i]mplementation")) -- Go to implementation
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts("Show hover info"))                    -- Show hover info
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts("[r]e[n]ame"))               -- Rename symbol
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts("[c]ode [a]ction"))     -- Code actions
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts("Previous diagnostic"))        -- Previous diagnostic
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts("Next diagnostic"))            -- Next diagnostic
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts("Show diagnostics"))   -- Show diagnostics
end

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        {
            "saghen/blink.cmp",
            version = '*',
            opts = {
                keymap = {
                    preset = 'default',
                },
                cmdline = {
                    keymap = {
                        preset = 'inherit',
                        ["<C-space>"] = { "show" },
                    }
                }
            }
        },
        {
            "folke/lazydev.nvim",
            ft = "lua", -- load only when editing Lua
            opts = {
                library = {
                    -- Add neovim runtime & plugins for Lua LSP
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.RUNTIME, '${3rd}/luv/library' },
                        },
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            },
        }
    },
    config = function(_, opts)
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_enable = false,
        })

        local lspconfig = require("lspconfig")

        print("LSP Setup")

        for server, config in pairs(opts.servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        vim.api.nvim_create_autocmd('LspAttach', { callback = onLspAttach })
    end
}
