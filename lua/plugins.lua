--- HeliX plugins---
--
-- All plugins are called and configured here.
-- The file is loaded by init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.opt.rtp:prepend(lazypath)
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end



vim.opt.rtp:prepend(lazypath)

--require("lazy").setup(plugins, opts},

vim.g.mapleader = "<Space>" -- Make sure to set `mapleader` before lazy so your mappings are correct

-- PLUGGINS
--

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('lazy').setup {

    --- colorscheme ---
    {'betoissues/contrastneed-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
        vim.cmd([[colorscheme contrastneed]])
        end,
    },

    --- barbar.nvim ---
    --
    -- Files presented in tabs
    {'romgrk/barbar.nvim',
        dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.0.0',
    },

    --- lualine.nvim ---
    --
    -- Status line for nvim
    {'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        init = function() require('lualine').setup() end,
        ---options = { theme = 'challenger_deep' },
        opts = {
            options = {
                section_separators = {},
                component_separators = {},
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b ={'location'},
                lualine_c = {"' | '",'filename','filetype',"'󰍉 | '",'diagnostics',"' | '",'branch',"'󰕛 | '",'diff'},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {"os.date('%y-%m-%d %H:%M:%S')"}
            }
    }},

    -- Nvim-R --
    --
    -- Remedy for a cra* named Rstudio
    {'jalvesaq/Nvim-R',
        lazy = true,
        init = function()
	        vim.g.R_path = '/usr/bin/'
	        vim.g.R_assign = 1
        end
    },

    --- Nvim-tree ---
    --
    -- files tree
    {'nvim-tree/nvim-tree.lua',
        init = function() require("nvim-tree").setup() end,
    },
    {
  "ahmedkhalf/jupyter-nvim",
  run = ":UpdateRemotePlugins",
  event = "BufEnter *.ipynb",
  config = function()
    require("jupyter-nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
},
   --- Indent-blankline.nvim ---
    { "lukas-reineke/indent-blankline.nvim",
        main = "ibl", opts = {},
        init = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#8ECAE6" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#219EBC" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#126782" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#023047" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#FFB703" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#FD9E02" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#FB8500" })
            end)
            require("ibl").setup { indent = { highlight = highlight } }
        end,
    },

    ---  coc.nvim ---
    --
    -- Autocompletition
    -- Full configuration can be found in lua/coc-nvim.lua.
    {'neoclide/coc.nvim',
        branch = 'release',
        build = "yarn install --frozen-lockfile",
    },

    --- nvim-autopairs ---
    --
    -- Brackets autoclosing
    {'windwp/nvim-autopairs',
    	event = "InsertEnter",
	opts = {} 
	-- this is equalent to setup({}) function }, {'mattn/emmet-vim', }, {"roobert/tabtree.nvim", init = function() require("tabtree").setup() end,
	},
    --- semshi 
    --
    --- Better python syntax highlighting 
    {"wookayin/semshi", build = ":UpdateRemotePlugins", version = "*", 
    	-- Recommended to use the latest release
    	lazy=true,
        event = 'BufEnter *.py, *.ipynb',
	init = function() 
    	-- example, skip if you're OK with the default config 
    	vim.g['semshi#error_sign'] = false vim.cmd("hi semshiLocal           ctermfg=209 guifg=#ff875f")
        vim.cmd("hi semshiLocal           guifg=#7b1fa2 cterm=bold gui=bold")
        vim.cmd("hi semshiGlobal          ctermfg=75 guifg=#ffaf11")
        vim.cmd("hi semshiImported        guifg=#ffaf00 cterm=bold gui=bold")
        vim.cmd("hi semshiParameter       ctermfg=75  guifg=#5fafff")
        vim.cmd("hi semshiParameterUnused ctermfg=117 guifg=#87d7ff")
        vim.cmd("hi semshiFree            ctermfg=218 guifg=#ffafd7")
        vim.cmd("hi semshiBuiltin         ctermfg=207 guifg=#ff5fff")
        vim.cmd("hi semshiAttribute       ctermfg=49  guifg=#00ffaf")
        vim.cmd("hi semshiSelf            ctermfg=249 guifg=#ffb211")
        vim.cmd("hi semshiUnresolved      ctermfg=226 guifg=#ffff11")
        vim.cmd("hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f")
        vim.cmd("hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000")
   end,
   config = function()
   -- any config or setup that would need to be done after plugin loading
   end,},
  {"luckasRanarison/clear-action.nvim",
  opts = {}
  },

  -- LuaSnip
  --
  -- Code snipets 

  {"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
  },
{
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
        -- symbol = "▏",
        symbol = "│",
        options = { try_as_border = true },
},
},
    -- SECTION: Julia Specific plugins
{
    -- General Julai support
    'JuliaEditorSupport/julia-vim',
    lazy=true,
    event = "BufEnter *.jl"

  },
  -- SECTION : DataScience IDE specific plugins
  {
      -- magma.nvim - code cell like execution
      --  @ https://github.com/dccsillag/magma-nvim
      'dccsillag/magma-nvim',
      config = function()
          vim.cmd(":UpdateRemotePlugins")
          vim.g.magma_automatically_open_output = false
          vim.g.magma_image_provider = "ueberzug"
      end,
     keys = {
        { "<LocalLeader>r", "<cmd>MagmaEvaluateOperator<CR>" },
        { "<LocalLeader>rr", "<cmd>MagmaEvaluateLine<CR>" },
        { "<LocalLeader>r", "<cmd>MagmaEvaluateVisual<CR>", mode = "x" },
        { "<LocalLeader>rc", "<cmd>MagmaReevaluateCell<CR>" },
        { "<LocalLeader>rd", "<cmd>MagmaDelete<CR>" },
        { "<LocalLeader>ro", "<cmd>MagmaShowOutput<CR>" },
    } 
},
{
    -- nvim-notify - nice notifications pop-ups
    -- @ https://github.com/rcarriga/nvim-notify
    --
    'rcarriga/nvim-notify'
}
}
