--[[ Variables ]]--
local opt = vim.opt	-- Variable for configuring Neovim options
local g = vim.g			-- Global variables


--[[ Tab Options ]]--
-- Pressing Tab at the beginning of the line will add an indent, the width of which corresponds to shiftwidth
g.smarttab = true

-- Copies the margins from the current line when adding a new one and automatically sets the margins in the 'right' places
opt.smartindent = true

-- The number of spaces in the tab
opt.tabstop = 2

-- The number of spaces that the tab character is displayed with when adding
opt.softtabstop = 2

-- By default, it is used to adjust the width of the margins in spaces added by the commands '>>' and '<<'
opt.shiftwidth = 2

