return {
    {
        'lervag/vimtex',
        ft = 'tex',
        keys = { { '<leader>v', '<cmd>VimtexCompile<cr>' } },
    },
    { 'tpope/vim-abolish', event = 'VeryLazy' },
    { 'tpope/vim-dadbod', event = 'VeryLazy' },
    { 'tpope/vim-repeat', event = 'VeryLazy' },
    'tpope/vim-sleuth',
    { 'tpope/vim-surround', event = 'VeryLazy' },
    { 'Vimjas/vim-python-pep8-indent', ft = { 'python' } },
}
