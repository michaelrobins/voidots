local ls = require 'luasnip'

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

ls.filetype_extend('javascriptreact', { 'html' })
ls.filetype_extend('typescriptreact', { 'html' })
ls.filetype_extend('svelte', { 'html' })
ls.filetype_extend('astro', { 'html' })
