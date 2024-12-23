-- vim.cmd('source ~/.config/nvim/init.vim')

local fn = vim.fn
require('helper_funcs')
require('vimscript_funcs')
require('settings')
require('maps')
-- require('plugins')
-- require('lazy')
-- require('lsp')


local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--single-branch', 'https://github.com/folke/lazy.nvim.git', lazypath, })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup(
  {
    {
      'EdenEast/nightfox.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd [[
          if !exists("g:set_theme")
            colorscheme carbonfox
          end
          let g:set_theme = "1"
        ]]
      end,
    },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-speeddating' },
    { 'blueyed/vim-diminactive' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-eunuch' },
    --  'wbthomason/packer.nvim'

    -- -- VIMSCRIPT
    { 'qpkorr/vim-bufkill',
      cond = not vim.g.vscode,
      init = function() vim.cmd [[ 
        source $HOME/.config/nvim/config/bufkill.vim
      ]]
    end },
    { 'mhinz/vim-startify',
      cond = not vim.g.vscode,
      config = function() vim.cmd [[ 
        source $HOME/.config/nvim/config/startify.vim
      ]]
    end },
    { 'mbbill/undotree',
      cond = not vim.g.vscode,
      init = function() vim.cmd [[ 
      source $HOME/.config/nvim/config/undotree.vim
      ]]
    end },
    { 'svermeulen/vim-yoink',
      init = function() vim.cmd [[ 
        source $HOME/.config/nvim/config/yoink.vim
      ]]
    end },
    { 'svermeulen/vim-subversive',
      init = function() vim.cmd [[ 
        source $HOME/.config/nvim/config/subversive.vim
      ]]
    end },
    -- { 'unblevable/quick-scope',
      -- config = function() vim.cmd [[ 
      -- source $HOME/.config/nvim/config/quickscope.vim
      -- ]]
    -- end },
    { 'TeaWhyDee/vimwiki', branch = "master",
      cond = not vim.g.vscode,
      init = function() vim.cmd [[
        source $HOME/.config/nvim/config/vimwiki.vim
      ]]
    end },
    { 'SirVer/ultisnips',
      cond = not vim.g.vscode,
      init = function() vim.cmd [[
        source $HOME/.config/nvim/config/ultisnips.vim
      ]]
    end },
    { 'godlygeek/tabular' },
    { 'vimwiki/utils' },
    { 'tools-life/taskwiki' ,
      cond = not vim.g.vscode,
    },
    { 'preservim/vimux',
      cond = not vim.g.vscode,
      init = function() vim.cmd [[
        source $HOME/.config/nvim/config/vimux.vim
      ]]
    end },
    { 'blindFS/vim-taskwarrior',
      cond = not vim.g.vscode,
      init = function() vim.cmd [[
          source $HOME/.config/nvim/lua/plugins/taskwarrior.vim
          ]]
      end },
    { 'jamessan/vim-gnupg' ,
      cond = not vim.g.vscode,
      init = function() vim.cmd [[ 
          source $HOME/.config/nvim/config/gnupg.vim
          ]]
      end },
    { 'TeaWhyDee/vim-surround',
      init = function() vim.cmd [[ 
          source $HOME/.config/nvim/config/surround.vim
          ]]
      end },
    { 'jiangmiao/auto-pairs',
      cond = not vim.g.vscode,
       init = function() vim.cmd [[
           source $HOME/.config/nvim/config/autopairs.vim
           ]]
       end },
    { 'preservim/tagbar',
      cond = not vim.g.vscode,
       init = function() vim.cmd [[
           source $HOME/.config/nvim/config/tagbar.vim
           ]]
       end },


    { 'nvim-lualine/lualine.nvim',
      cond = not vim.g.vscode,
       config = function() vim.cmd [[
           source $HOME/.config/nvim/config/lualine.vim
           ]]
       end },
    { 'akinsho/bufferline.nvim',
      cond = not vim.g.vscode,
       config = function() vim.cmd [[
          source $HOME/.config/nvim/config/bufferline.vim
        ]]
       end },
    --
    --
    -- -- OTHER
    --
    { 'rcarriga/nvim-notify' },
    { 'ahmedkhalf/project.nvim',
      cond = not vim.g.vscode,
      config = function() require('plugins.project') end },
    --  { 'folke/which-key.nvim',
    --     config = function() require('plugins.which-key') end}
    --  { 'dstein64/vim-startuptime' }
    { 'nvim-neo-tree/neo-tree.nvim', branch = "v2.x",
      cond = not vim.g.vscode,
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", },
        config = function() require('plugins.neotree') end },
    { "iamcco/markdown-preview.nvim",
      cond = not vim.g.vscode,
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function() require('plugins.markdown-preview') end },

    -- NAVIGATION
    { "ziontee113/syntax-tree-surfer",
        config = function() require('plugins.syntaxtreesurfer') end },


    -- -- COMPLETION
    { 'hrsh7th/nvim-cmp',
        config = function() require('plugins.cmp') end,
        cond = not vim.g.vscode,
    },
    {'hrsh7th/cmp-buffer',
        cond = not vim.g.vscode,
    },
    {'quangnguyen30192/cmp-nvim-ultisnips',
        cond = not vim.g.vscode,
    },
    {'hrsh7th/cmp-path',
        cond = not vim.g.vscode,
    },
    {'hrsh7th/cmp-cmdline',
        cond = not vim.g.vscode,
    },
    {'hrsh7th/cmp-nvim-lsp',
        cond = not vim.g.vscode,
    },
    {'hrsh7th/cmp-nvim-lua',
        cond = not vim.g.vscode,
    },
    {'kdheepak/cmp-latex-symbols',
        cond = not vim.g.vscode,
    },
    {'saadparwaiz1/cmp_luasnip',
        -- cond = not vim.g.vscode,
    },
    {'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function() require('plugins.luasnip') end,
        -- cond = not vim.g.vscode,
    },
    {'rafamadriz/friendly-snippets',
        -- cond = not vim.g.vscode,
    },


    -- ====== LSP ======
    {
      'VonHeikemen/lsp-zero.nvim',
      cond = not vim.g.vscode,
      branch = 'v3.x',
      config = function() require("plugins.lsp-zero") end,
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      },
    },
    { "MunifTanjim/eslint.nvim",
        cond = not vim.g.vscode,
    },
    -- { "mhartington/formatter.nvim",
    --     cond = not vim.g.vscode,
    --     config = function() require("plugins.formatter") end,
    -- },
    { "stevearc/conform.nvim", -- Formatter
        cond = not vim.g.vscode,
        config = function() require("plugins.conform") end,
    },
    { "mfussenegger/nvim-lint",
        cond = not vim.g.vscode,
        config = function() require("plugins.nvim-lint") end,
    },
    --  "williamboman/nvim-lsp-installer"
    
    { "nvim-treesitter/nvim-treesitter",
        cond = not vim.g.vscode,
        config = function() require("plugins.treesitter") end,
        build = ":TSUpdate", },
    {"nvim-treesitter/playground",
        cond = not vim.g.vscode,
    },
    { "nvim-treesitter/nvim-treesitter-context", -- Top thing?
        cond = not vim.g.vscode,
        config = function() require('plugins.treecontext') end },
    { "nvim-treesitter/nvim-treesitter-textobjects",
        cond = not vim.g.vscode,
        after = "nvim-treesitter",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function() require('plugins.treesitter-textobjects') end },

    --  { "folke/trouble.nvim",
    --     dependencies = "kyazdani42/nvim-web-devicons",
    --     config = function() require("plugins.trouble") end }
    { "lukas-reineke/indent-blankline.nvim",
        cond = not vim.g.vscode,
        config = function() require("ibl").setup() end,
        main = "ibl", opts = {}
    },
    
    { "nvim-telescope/telescope.nvim",
      cond = not vim.g.vscode,
      config = function() require("plugins.telescope") end, },
    { "nvim-telescope/telescope-media-files.nvim",
      cond = not vim.g.vscode,
    },
    { "AckslD/nvim-neoclip.lua",
      cond = not vim.g.vscode,
      config = function() require('neoclip').setup() end },
    --  { "habamax/vim-godot",
    --     config = function() require("plugins.godot") end }
    --  "windwp/nvim-ts-autotag"
    { "numToStr/Comment.nvim",
        cond = not vim.g.vscode,
      -- Plugin below allows to comment embedded language things
      -- dependencies={"JoosepAlviste/nvim-ts-context-commentstring"},
    config = function() require("plugins.comment") end },
    -- { 'lewis6991/gitsigns.nvim', tag = 'release',
    --    config = function() require("plugins.gitsigns") end },

    -- VISUAL
    {
      "kevinhwang91/nvim-ufo",
      cond = not vim.g.vscode,
      dependencies = "kevinhwang91/promise-async",
      config = function() require("plugins.ufo") end },
    { 'Pocco81/true-zen.nvim',
      cond = not vim.g.vscode,
      config = function() require('plugins.truezen') end },

    -- -- REQUIREMENTS
     'nvim-lua/popup.nvim',
     'nvim-lua/plenary.nvim',
    -- Post-install/update hook with neovim command
    
  },
  {
  defaults = {
    lazy = false,
  },
  ui = { border = 'none' },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})


