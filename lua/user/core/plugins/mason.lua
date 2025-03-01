local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
}

function M.config()
    local servers = {
        "lua_ls",
        "jsonls",
        "clangd",
        "jdtls",
    }

    require("mason").setup({
        automatic_installation = false,
        ui = {
            border = "rounded",
        },
    })

    require("mason-lspconfig").setup({
        automatic_installation = false,
        ensure_installed = servers,
    })
end

return M
