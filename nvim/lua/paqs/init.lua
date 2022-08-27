local files = {
    'cmp',
    'dirbuf',
    'hop',
    'paq',
    'luasnippets',
    'fzf',
    'gitsigns',
    'harpoon',
    'navic',
    'treesitter',
}

for _, v in ipairs(files) do
    require('paqs.' .. v)
end

require('run').setup()
require('bufdel').setup { next = 'alternate' }
require('Comment').setup { mappings = { extra = true } }
require('spellsitter').setup()
