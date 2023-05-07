require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.eslint,
        require("null-ls").builtins.formatting.gofmt,
        require("null-ls").builtins.formatting.csharpier,
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})


