-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "bash-language-server",
        "clangd",
        "docker-compose-language-service",
        "docker-language-server",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "markdown-oxide",
        "neocmakelsp",
        "rust-analyzer",
        "stylua",
        "tinymist",
        "ty",
        "yaml-language-server",
        "zls",

        -- install linter/formatters
        "hadolint",
        "stylua",
        "ruff",
        "clang-format",
        "gersemi",
        "jq",
        "typstyle",
        "yamlfmt",

        -- install debuggers
        "codelldb",
        "cpptools",
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
