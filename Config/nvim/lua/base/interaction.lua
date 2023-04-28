--[[ Variables ]]--
local opt = vim.opt	-- Variable for configuring Neovim options


--[[ Parameters of interaction with the editor ]]--
-- Matching Russian and English letters in normal mode
opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
opt.mouse = 'a'			-- Enable mouse support
opt.scrolloff = 7		-- The number of lines of indentation from the bottom line of the editor
opt.pumheight = 10	-- pop up menu height
opt.laststatus = 3

