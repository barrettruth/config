local git_ignored = setmetatable({}, {
    __index = function(self, key)
        local proc = vim.system({
            'git',
            'ls-files',
            '--ignored',
            '--exclude-standard',
            '--others',
            '--directory',
        }, {
            cwd = key,
            text = true,
        })
        local result = proc:wait()
        local ret = {}
        if result.code == 0 then
            for line in
                vim.gsplit(
                    result.stdout,
                    '\n',
                    { plain = true, trimempty = true }
                )
            do
                line = line:gsub('/$', '')
                table.insert(ret, line)
            end
        end

        rawset(self, key, ret)
        return ret
    end,
})

return {
    {
        'barrett-ruth/http-codes.nvim',
        config = true,
        dependencies = 'nvim-telescope/telescope.nvim',
        keys = { { '<leader>H', '<cmd>HTTPCodes<cr>' } },
    },
    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStart' },
        config = true,
        keys = { { '<leader>L', '<cmd>LiveServerToggle<cr>' } },
    },
    {
        'dhruvasagar/vim-zoom',
        key = '<c-w>m',
    },
    {
        'echasnovski/mini.pairs',
        config = true,
        event = 'InsertEnter',
    },
    {
        'folke/ts-comments.nvim',
        config = true,
        event = 'VeryLazy',
    },
    {
        'iamcco/markdown-preview.nvim',
        build = 'pnpm up && cd app && pnpm install',
        ft = { 'markdown' },
        config = function()
            vim.cmd([[
                function OpenMarkdownPreview(url)
                    exec "silent !$BROWSER -n --args " . a:url
                endfunction
            ]])
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
        end,
        keys = { { '<leader>m', vim.cmd.MarkdownPreviewToggle } },
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function(_, opts)
            local gitsigns = require('gitsigns')
            gitsigns.setup(opts)

            map({ 'n', '<leader>gb', gitsigns.toggle_current_line_blame })
            map({ 'n', '<leader>gp', gitsigns.preview_hunk })
            map({ 'n', '<leader>gs', gitsigns.stage_hunk })
            map({ 'n', '<leader>gS', gitsigns.undo_stage_hunk })
            map({ 'n', '[g', gitsigns.prev_hunk })
            map({ 'n', ']g', gitsigns.next_hunk })
        end,
        event = 'VeryLazy',
        opts = {
            on_attach = function()
                vim.wo.signcolumn = 'yes'
            end,
            current_line_blame_formatter_nc = function()
                return {}
            end,
            attach_to_untracked = false,
            signs = {
                delete = { text = '＿' },
            },
            current_line_blame = true,
        },
    },
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        config = function()
            local ls = require('luasnip')

            ls.setup({
                region_check_events = 'InsertEnter',
                delete_check_events = {
                    'TextChanged',
                    'TextChangedI',
                    'InsertLeave',
                },
                ext_opts = {
                    [require('luasnip.util.types').choiceNode] = {
                        active = {
                            virt_text = {
                                {
                                    ' <- ',
                                    vim.wo.cursorline and 'CursorLine'
                                        or 'Normal',
                                },
                            },
                        },
                    },
                },
            })

            ls.filetype_extend('htmldjango', { 'html' })
            ls.filetype_extend('markdown', { 'html' })
            ls.filetype_extend('javascriptreact', { 'javascript', 'html' })
            ls.filetype_extend('typescript', { 'javascript' })
            ls.filetype_extend(
                'typescriptreact',
                { 'javascriptreact', 'javascript', 'html' }
            )

            require('luasnip.loaders.from_lua').lazy_load({
                paths = { '~/.config/nvim/lua/snippets' },
            })
        end,
        keys = {
            -- restore digraph mapping
            { '<c-d>', '<c-k>', mode = 'i' },
            {
                '<c-s>',
                '<cmd>lua require("luasnip").expand()<cr>',
                mode = 'i',
            },
            {
                '<c-h>',
                '<cmd>lua if require("luasnip").jumpable(-1) then require("luasnip").jump(-1) end<cr>',
                mode = { 'i', 's' },
            },
            {
                '<c-l>',
                '<cmd>lua if require("luasnip").jumpable(1) then require("luasnip").jump(1) end<cr>',
                mode = { 'i', 's' },
            },
            {
                '<c-j>',
                '<cmd>lua if require("luasnip").choice_active() then require("luasnip").change_choice(-1) end<cr>',
                mode = 'i',
            },
            {
                '<c-k>',
                '<cmd>lua if require("luasnip").choice_active() then require("luasnip").change_choice(1) end<cr>',
                mode = 'i',
            },
        },
    },
    {
        'laytan/cloak.nvim',
        config = true,
        event = 'BufRead .env*',
        keys = { { '<leader>c', '<cmd>CloakToggle<cr>' } },
    },
    {
        'maxmellon/vim-jsx-pretty',
        ft = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
        },
    },
    {
        'nvimdev/hlsearch.nvim',
        config = true,
        keys = { '/', '?' },
    },
    {
        'NvChad/nvim-colorizer.lua',
        opts = {
            filetypes = {
                'conf',
                'sh',
                'tmux',
                'zsh',
                unpack(vim.g.markdown_fenced_languages),
            },
            user_default_options = {
                RRGGBBAA = true,
                AARRGGBB = true,
                css = true,
                rgb_fun = true,
                hsl_fn = true,
                tailwind = true,
            },
        },
        event = 'VeryLazy',
        ft = {
            'conf',
            'sh',
            'tmux',
            'zsh',
            unpack(vim.g.markdown_fenced_languages),
        },
    },
    {
        'phaazon/hop.nvim',
        config = function()
            require('hop').setup()
            local hi = require('colors').hi
            hi('HopUnmatched', { none = true })
            hi('HopNextKey', { reverse = true })
        end,
        keys = { { '<c-space>', vim.cmd.HopChar2 } },
    },
    {
        'stevearc/oil.nvim',
        init = function()
            local oilaug = vim.api.nvim_create_augroup('AOil', {})
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'oil',
                callback = function()
                    bmap({
                        'n',
                        'q',
                        function()
                            local ok, bufremove =
                                pcall(require, 'mini.bufremove')
                            if ok and not vim.fn.buflisted(0) then
                                bufremove.delete()
                            else
                                vim.cmd.bw()
                            end
                        end,
                    })
                end,
                group = oilaug,
            })
        end,
        keys = {
            { '-', '<cmd>e .<cr>' },
            { '_', vim.cmd.Oil },
        },
        dependencies = {
            'echasnovski/mini.bufremove',
            config = true,
            keys = {
                {
                    '<leader>bd',
                    '<cmd>lua require("mini.bufremove").delete()<cr>',
                },
                {
                    '<leader>bw',
                    '<cmd>lua require("mini.bufremove").wipeout()<cr>',
                },
            },
        },
        event = function()
            if vim.fn.isdirectory(vim.fn.expand('%:p')) == 1 then
                return 'VimEnter'
            end
        end,
        opts = {
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
            float = { border = 'single' },
            view_options = {
                is_hidden_file = function(name, _)
                    if vim.startswith(name, '.') then
                        return true
                    end
                    local dir = require('oil').get_current_dir()
                    return not dir and false
                        or vim.list_contains(git_ignored[dir], name)
                end,
            },
            keymaps = {
                ['<c-h>'] = false,
                ['<c-v>'] = 'actions.select_vsplit',
                ['<c-x>'] = 'actions.select_split',
            },
        },
    },
    { 'tpope/vim-abolish', event = 'VeryLazy' },
    { 'tpope/vim-fugitive', cmd = 'Git', ft = 'gitcommit' },
    { 'tpope/vim-repeat', keys = { '.' } },
    { 'tpope/vim-sleuth', event = 'BufReadPost' },
    { 'tpope/vim-surround', keys = { 'c', 'd', 'v', 'V', 'y' } },
    {
        'tzachar/highlight-undo.nvim',
        config = true,
        keys = { 'u', 'U' },
    },
    {
        'ThePrimeagen/harpoon',
        keys = {
            { '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>' },
            { '<leader>hd', '<cmd>lua require("harpoon.mark").rm_file()<cr>' },
            {
                '<leader>hq',
                '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>',
            },
            { ']h', '<cmd>lua require("harpoon.ui").nav_next()<cr>' },
            { '[h', '<cmd>lua require("harpoon.ui").nav_prev()<cr>' },
            { '<c-h>', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>' },
            { '<c-j>', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>' },
            { '<c-k>', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>' },
            { '<c-l>', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>' },
        },
    },
    { 'Vimjas/vim-python-pep8-indent', ft = { 'python' } },
    {
        'kana/vim-textobj-user',
        dependencies = {
            'kana/vim-textobj-entire',
            'kana/vim-textobj-indent',
            'kana/vim-textobj-line',
            'preservim/vim-textobj-sentence',
            'whatyouhide/vim-textobj-xmlattr',
        },
        keys = { 'c', 'd', 'v', 'V', 'y', '<', '>' },
    },
}
