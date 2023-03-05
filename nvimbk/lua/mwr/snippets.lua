local ls = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = 'TextChanged,TextChangedI',

  -- Autosnippets:
  -- enable_autosnippets = false,
}

ls.filetype_extend('javascriptreact', { 'html' })
ls.filetype_extend('typescriptreact', { 'html' })
ls.filetype_extend('svelte', { 'html' })
ls.filetype_extend('astro', { 'html' })

vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {
  silent = true,
})

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {
  silent = true,
})
