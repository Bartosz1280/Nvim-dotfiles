--- HeliX Nvim init.lua
--
-- Part of HeliX Nvim config containing.
-- Main configuration file
-- 
-- GitHub: Bartosz1280

--------------------------
-- INTERNAL IMPORTS
--------------------------
vim.o.path = vim.o.path .. './'
local plugins = require('plugins')
require("keymappings")
require("custom_funcs")
require("coc-nvim-config")

--------------------------
-- OPTIONS
--------------------------

-- vim.opt.completeopt = {"noinser", "menuone", "noselect"} -- cause an unexptected error
vim.opt.clipboard = "unnamedplus" -- Use system's clipboard

-- MOUSE OPTIONS
vim.opt.mouse = "a" -- Allow the mouse

-- UI OPTIONS
vim.opt.termguicolors = true -- True color support
vim.opt.background = "light" -- Background color (set to "dark" or "light")
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight cursor line
vim.opt.splitbelow = true -- Put opened window at the bottom in vertical split
vim.opt.splitright = true -- Put opened window on the right in horizontal split
vim.opt.showmode = false -- Hide the mode indicator

--vim.opt.syntax = true -- Syntax highlighting
vim.opt.updatetime = 300 -- Refresh rate

-- TAB
vim.opt.shiftwidth = 4 -- Indentation width
vim.opt.softtabstop = 4 -- Number of spaces in a tab when editing
vim.opt.tabstop = 4 -- Number of visual spaces per tab
vim.opt.expandtab = true -- Use spaces for tabs (for Python)

-- SEARCHING
vim.opt.incsearch = true -- Searches while typing
vim.opt.hlsearch = false -- Do not highlight matches
vim.opt.smartcase = true -- Case-sensitive search when uppercase is present
vim.opt.ignorecase = true -- Ignore uppercase while searching

-- SPELL CHECK OPTIONS
-- By default spelling = false
-- it can be enabled with :set spell
vim.opt.spellsuggest = {"best", 9} -- Show 10 best suggestions in spell check 
vim.opt.spelllang = 'en_us'


-- Custom commands
vim.cmd([[command! -nargs=0 PasteRCode lua PasteRCode()]])
vim.cmd([[command! -nargs=0 PasteRFigureChunk lua PasteRFigureChunk()]])
vim.cmd([[command! -nargs=0 PasteRKableTableChunk lua PasteRKableTableChunk()]])
vim.cmd([[command! -nargs=0 LoremIpsum lua LoremIpsum()]])
vim.cmd([[command! -nargs=0 BootstrapLink lua BootstrapLink()]])
vim.cmd('command! -nargs=1 OpenLuaConfig :lua OpenLuaConfig(<f-args>)')


-- Check if running inside tmux
if os.getenv("TMUX") then
  -- Colors in tmux
  vim.cmd('let &t_8f = "\27[38;2;%lu;%lu;%lum"')
  vim.cmd('let &t_8b = "\27[48;2;%lu;%lu;%lum"')
end

-- Enable true color support
vim.o.termguicolors = true

-- Set the background to dark
vim.o.background = "dark"

-- Set the colorscheme to base16-flat
--vim.cmd('colorscheme base16-flat')

