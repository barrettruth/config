require 'paq' {
    'savq/paq-nvim',

    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'jose-elias-alvarez/nvim-lsp-ts-utils',

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',

    'lewis6991/spellsitter.nvim',
    'nvim-lua/plenary.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd 'TSUpdate'
        end,
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',

    'kyazdani42/nvim-tree.lua',
    'RRethy/vim-hexokinase',
    'SmiteshP/nvim-navic',

    'Julian/vim-textobj-variable-segment',
    'kana/vim-textobj-user',
    'kana/vim-textobj-fold',
    'vimtaku/vim-textobj-keyvalue',
    'whatyouhide/vim-textobj-xmlattr',

    'tpope/vim-abolish',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',

    'andymass/vim-matchup',
    'ibhagwan/fzf-lua',
    'junegunn/vim-easy-align',
    'lewis6991/impatient.nvim',
    'lewis6991/gitsigns.nvim',
    'numToStr/Comment.nvim',
    'ojroques/nvim-bufdel',
    'wellle/targets.vim',

    'ThePrimeagen/harpoon',
    'ThePrimeagen/git-worktree.nvim',
}

local utils = require 'utils'
local map, mapstr = utils.map, utils.mapstr

map { 'n', '<leader>Pc', mapstr 'PaqClean' }
map { 'n', '<leader>Pi', mapstr 'PaqInstall' }
map { 'n', '<leader>Pu', mapstr 'PaqUpdate' }
map { 'n', '<leader>Pl', mapstr 'PaqLogOpen' }
map { 'n', '<leader>PL', mapstr 'PaqList' }
