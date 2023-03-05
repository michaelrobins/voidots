require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'astro',
    'bash',
    'c',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'make',
    'python',
    'pug',
    'regex',
    'rust',
    'css',
    'scss',
    'svelte',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
    'zig',
  },
  markid = {
    enable = false,
  },
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlighting = false,
  indent = {
    enable = false,
  },
}