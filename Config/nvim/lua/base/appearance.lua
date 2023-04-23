--[[ Variables ]]--
local opt = vim.opt	-- Variable for configuring Neovim options


--[[ Editor Appearance ]]--
opt.number = true						-- Show line number
opt.relativenumber = true		-- Show line number in relative format
opt.colorcolumn = '80'			-- Line lenght marker at 80 columns
opt.linebreak = true				-- Wrap on word boundary
opt.cursorline = true				-- highlight the current line
opt.signcolumn = "yes"			-- Always show the sign column, otherwise it would shift the text each time
opt.showmode = false				-- We don't need to see things like -- INSERT -- anymore
opt.termguicolors = true		-- set term gui colors (most terminals support this
