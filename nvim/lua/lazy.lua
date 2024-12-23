local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
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
  },
  {
  defaults = {
    lazy = true,
  },
--install = {
  --colorscheme = { PREF.ui.colorscheme },
  --},
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



--[====[
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- 
-- if not vim.loop.fs_stat(lazypath) then
  -- vim.fn.system({
    -- "git",
    -- "clone",
    -- "--filter=blob:none",
    -- "https://github.com/folke/lazy.nvim.git",
    -- "--branch=stable", -- latest stable release
    -- lazypath,
  -- })
-- end
-- 
-- vim.opt.runtimepath:prepend(lazypath)
-- 
-- require("lazy").setup(
  -- {}, 
  -- {
    -- defaults = {
      -- lazy = true,
    -- },
    -- install = {
      -- colorscheme = { PREF.ui.colorscheme },
    -- },
    -- ui = { border = 'none' },
    -- performance = {
      -- rtp = {
        -- disabled_plugins = {
        -- },
      -- },
    -- },
  -- }
-- )
  --"folke/which-key.nvim",
  --{ "folke/neoconf.nvim", cmd = "Neoconf" },
  --"folke/neodev.nvim",


-- require("lazy").setup({ 
  -- { 
    -- 'EdenEast/nightfox.nvim',
    -- lazy = false,
    -- priority = 1000,
    -- config = vim.cmd [[
      -- if !exists("g:set_theme")
        -- colorscheme carbonfox
      -- end
      -- let g:set_theme = "1"
    -- ]] 
  -- }
-- }
-- )



    -- use { 'tpope/vim-fugitive' }
    -- use 'wbthomason/packer.nvim'
    --
    -- -- VISUAL
    -- use { 'EdenEast/nightfox.nvim',
    --     config = vim.cmd [[
    --     if !exists("g:set_theme")
    --         colorscheme carbonfox
    --     end
    --     let g:set_theme = "1"
    --     ]] }
    -- use { 'Pocco81/true-zen.nvim',
    --     config = function() require('plugins.truezen') end }
    --
    -- -- VIMSCRIPT
    --
    -- use { 'tpope/vim-speeddating' }
    -- use { 'blueyed/vim-diminactive' }
    -- use { 'tpope/vim-repeat' }
    -- use { 'tpope/vim-eunuch' }
    --
    -- use { 'qpkorr/vim-bufkill',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/bufkill.vim
    --         ]]
    --     end }
    -- use { 'mhinz/vim-startify',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/startify.vim
    --         ]]
    --     end }
    -- use { 'mbbill/undotree',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/undotree.vim
    --         ]]
    --     end }
    -- use { 'svermeulen/vim-yoink',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/yoink.vim
    --         ]]
    --     end }
    -- use { 'svermeulen/vim-subversive',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/subversive.vim
    --         ]]
    --     end }
    -- use { 'unblevable/quick-scope',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/quickscope.vim
    --         ]]
    --     end }
    -- use { 'vimwiki/vimwiki',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/vimwiki.vim
    --         ]]
    --     end }
    -- use { 'SirVer/ultisnips',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/ultisnips.vim
    --         ]]
    --     end }
    -- use { 'godlygeek/tabular' }
    -- use { 'vimwiki/utils' }
    -- use { 'tools-life/taskwiki' }
    -- use { 'preservim/vimux',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/vimux.vim
    --         ]]
    --     end }
    -- use { 'blindFS/vim-taskwarrior',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/lua/plugins/taskwarrior.vim
    --         ]]
    --     end }
    -- use { 'jamessan/vim-gnupg' ,
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/gnupg.vim
    --         ]]
    --     end }
    -- use { 'TeaWhyDee/vim-surround',
    --     config = function() vim.cmd [[ 
    --         source $HOME/.config/nvim/config/surround.vim
    --         ]]
    --     end }
    -- use { 'jiangmiao/auto-pairs',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/autopairs.vim
    --         ]]
    --     end }
    -- use { 'preservim/tagbar',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/tagbar.vim
    --         ]]
    --     end }
    -- use { 'nvim-lualine/lualine.nvim',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/lualine.vim
    --         ]]
    --     end }
    -- use { 'akinsho/bufferline.nvim',
    --     config = function() vim.cmd [[
    --         source $HOME/.config/nvim/config/bufferline.vim
    --         ]]
    --     end }
    --
    --
    -- -- OTHER
    --
    -- use { 'rcarriga/nvim-notify' }
    -- use { 'ahmedkhalf/project.nvim',
    --     config = function() require('plugins.project') end }
    -- use { 'folke/which-key.nvim',
    --     config = function() require('plugins.which-key') end}
    -- use { 'dstein64/vim-startuptime' }
    -- use { 'nvim-neo-tree/neo-tree.nvim', branch = "v2.x",
    --     dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", },
    --     config = function() require('plugins.neotree') end }
    -- use { "iamcco/markdown-preview.nvim",
    --     build = function() vim.fn["mkdp#util#install"]() end,
    --     config = function() require('plugins.markdown-preview') end }
    --
    --
    -- -- COMPLETION
    -- use { 'hrsh7th/nvim-cmp',
    --     config = function() require('plugins.cmp') end }
    -- use 'hrsh7th/cmp-buffer'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-nvim-lua'
    -- use 'kdheepak/cmp-latex-symbols'
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use 'L3MON4D3/LuaSnip'
    -- use 'rafamadriz/friendly-snippets'
    --
    --
    -- -- LSP
    --
    -- -- enable LSP
    -- use { "neovim/nvim-lspconfig", }
    -- use "williamboman/nvim-lsp-installer"
    -- use { "williamboman/mason.nvim",
    --         config = function () require("mason").setup() end, }
    -- use { "jose-elias-alvarez/null-ls.nvim",
    --         config = function () require("plugins.null-ls") end, }
    --
    -- use { "nvim-treesitter/nvim-treesitter",
    --         config = function() require("plugins.treesitter") end,
    --         build = ":TSUpdate", }
    -- use "nvim-treesitter/playground"
    -- use { "nvim-treesitter/nvim-treesitter-context", -- Top thing?
    --         config = function() require('plugins.treecontext') end }
    -- use { "nvim-treesitter/nvim-treesitter-textobjects",
    --         after = "nvim-treesitter",
    --         dependencies = "nvim-treesitter/nvim-treesitter",
    --         config = function() require('plugins.treesitter-textobjects') end }
    --
    -- use { "folke/trouble.nvim",
    --     dependencies = "kyazdani42/nvim-web-devicons",
    --     config = function() require("plugins.trouble") end }
    -- use { "lukas-reineke/indent-blankline.nvim",
    --     config = function() require("plugins.indentblankline") end }
    --
    -- use { "nvim-telescope/telescope.nvim",
    --     config = function() require("plugins.telescope") end, }
    -- use { "nvim-telescope/telescope-media-files.nvim", }
    -- use { "AckslD/nvim-neoclip.lua",
    --     config = function() require('neoclip').setup() end }
    -- use { "habamax/vim-godot",
    --     config = function() require("plugins.godot") end }
    -- use "windwp/nvim-ts-autotag"
    -- use { "numToStr/Comment.nvim",
    --     -- Plugin below allows to comment embedded language things
    --     -- dependencies={"JoosepAlviste/nvim-ts-context-commentstring"},
    --     config = function() require("plugins.comment") end }
    -- use { 'lewis6991/gitsigns.nvim', tag = 'release',
    --     config = function() require("plugins.gitsigns") end }
    --
    -- -- REQUIREMENTS
    -- use 'nvim-lua/popup.nvim'
    -- use 'nvim-lua/plenary.nvim'
    -- Post-install/update hook with neovim command
--]====]
