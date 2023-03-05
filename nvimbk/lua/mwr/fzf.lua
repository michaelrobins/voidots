local actions = require 'fzf-lua.actions'
require('fzf-lua').setup {
  files = {
    prompt = ' ',
    cmd = 'fd --type f --hidden --exclude .git --exclude dist --exclude node_modules --exclude .svelte-kit --exclude build',
  },
}
