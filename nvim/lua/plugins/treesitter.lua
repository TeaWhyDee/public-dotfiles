local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  autotag = { -- HTML tags
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml", "phpdoc", "python" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  textobjects = {
    -- ==============================
    -- SELECT
    -- ==============================
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- any textobject is extended to include preceding or succeeding whitespace.
      -- Succeeding whitespace has priority in order to act similarly to eg the built-in `ap`.
      include_surrounding_whitespace = true,
    },

    -- ==============================
    -- SWAP
    -- ==============================
    swap = {
      enable = true,
      swap_next = {
        ["<a-l>"] = "@parameter.inner",
      },
      swap_previous = {
        ["<a-h>"] = "@parameter.inner",
      },
    },

    -- ==============================
    -- MOVE
    -- ==============================
    move = {
      enable = true,
      set_jumps = true, -- jumplist
      -- ["]m"] = "@function.outer",
      -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
      -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
      -- ["]o"] = "@loop.*",
      -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
      --
      -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
      -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
      -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      -- goto_next_end = {
        -- ["]M"] = "@function.outer",
        -- ["]["] = "@class.outer",
      -- ["[m"] = "@function.outer",
      -- ["[["] = "@class.outer",
      -- },
      --
      -- GOOD
      -- goto_next_start = {
      --   ["+"] = { query = {"@scope", "@block"}, query_group = "locals", desc = "Next scope" },
      -- },
      -- goto_previous_start = {
      --   ["_"] = { query = {"@scope", "@block"}, query_group = "locals", desc = "Next scope" },
      -- },
      -- goto_next = {
      --   ["="] = { query = {"@scope", "@block"}, query_group = "locals", desc = "Next scope" },
      --   -- ["]d"] = "@conditional.outer",
      -- },
      -- goto_previous = {
      --   ["-"] = { query = {"@scope", "@block"}, query_group = "locals", desc = "Next scope" },
      --   -- ["[d"] = "@conditional.outer",
      -- }
      --
      --
      --
      -- goto_previous_end = {
        -- ["[M"] = "@function.outer",
        -- ["[]"] = "@class.outer",
      -- },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
    },
  },
}
