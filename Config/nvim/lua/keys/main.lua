-- Modes
--   Normal Mode:					nm()
--   Insert Mode:					im()
--   Visual Mode:					vm()
--   Visual Block Mode:		xm()
--   Term Mode:						tm()
--   Command Mode:				cm()


--[[ Connecting the Command Alias module ]]--
require('keys/alias')


--[[ Remap Space As Leader Key ]]--
m('<Space>', '<Nop>')	-- Disabling Space in Normal mode
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--[[ Normal Mode Keyboard Shortcuts ]]--
-- Tabs
nm('<leader>tN', ':tabnew<CR>')				-- Creating a new tab
nm('<leader>tn', ':tabnext<CR>')			-- Moving on to the next tab
nm('<leader>tp', ':tabprevious<CR>')	-- Moving on to the previous tab
nm('<leader>tc', ':tabclose<CR>')			-- Close tab

-- Plugins
nm('<leader>u', ':UndotreeToggle<CR>')

-- Other
-- nm('<leader>l, ':set list<CR>')
nm(';', ':')	-- Alias for ';'


--[[ Visual Mode Keyboard Shortcuts ]]--
vm('<', '<gv')	-- Simplified indentation
vm('>', '>gv')	--┘

-- Exiting modes by 'fd'
im('<ESC>', '<Nop>')	-- Disabling Esc in Insert mode
im('fd', '<ESC>')			-- Exiting Insert mode
im('ав', '<ESC>')			--┘

vm('<ESC>', '<Nop>')		-- Disabling Esc in Visual mode
vm('fd', '<ESC>')		-- Exiting Visual mode
vm('ав', '<ESC>')		--┘
