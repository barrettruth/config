local o, opt = vim.o, vim.opt

o.autowrite = true

o.breakindent = true

opt.diffopt:append('linematch:60')

o.expandtab = true

opt.fillchars = {
    fold = ' ',
    foldopen = 'v',
    foldclose = '>',
    foldsep = ' ',
    eob = ' ',
    vert = '│',
    diff = '╱',
}

opt.iskeyword:append('-')

o.laststatus = 3

o.list = true
o.listchars = 'trail:·,tab:··'

opt.matchpairs:append('<:>')

o.modeline = false

o.number = true
o.relativenumber = true

opt.path:append('**')

o.pumheight = 10

o.shiftwidth = 4

opt.shortmess:append('acCIs')

o.showmode = false

o.showtabline = 0

o.spellfile = vim.env.XDG_DATA_HOME .. '/nvim/spell/spell.encoding.add'

o.splitkeep = 'screen'

o.splitbelow = true
o.splitright = true

o.swapfile = false

o.termguicolors = true

o.undodir = vim.env.XDG_DATA_HOME .. '/nvim/undo'
o.undofile = true

o.updatetime = 50
o.wrap = false
