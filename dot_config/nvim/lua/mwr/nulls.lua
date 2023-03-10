local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

require('null-ls').setup {
  sources = {
    require('null-ls').builtins.formatting.prettierd.with {
      filetypes = {
        'svelte',
        'astro',
        'css',
        'scss',
        'html',
        'yaml',
        'graphql',
        'markdown',
        'markdown.mdx',
        'yaml',
      },
    },
    require('null-ls').builtins.formatting.deno_fmt.with {
      filetypes = {
        'typescript',
        'typescriptreact',
        'graphql',
        'javascript',
        'javascriptreact',
        'json',
        'jsonc',
      },
    },
    require('null-ls').builtins.formatting.gofmt,
    require('null-ls').builtins.formatting.rustfmt,
    require('null-ls').builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
