local lsp_installer = require("nvim-lsp-installer")

local custom_attach = function() print("LSP started."); end

local servers = {
    "ansiblels", "bashls", "dockerls", "golangci_lint_ls", --[[ "grammarly", ]]
    "graphql", "jsonls", "pyright", "yamlls", "cssls", "emmet_ls", "eslint",
    "gopls", "html", "intelephense", "prismals", "r_language_server",
    "sumneko_lua", "tsserver", "vimls"
}

lsp_installer.setup({ensure_installed = servers})

local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    custom_attach()

    -- server:setup{on_attach = custom_attach}
end

for _, lsp in pairs(servers) do lspconfig[lsp].setup {on_attach = on_attach} end
