--[[ Variables ]]--
local opt = vim.opt	-- Variable for configuring Neovim options

--[[ Basic Editor Behavior ]]--
opt.backup = false							-- Creates a backup file
opt.showmatch = true						-- Highlight matching parenthesis
opt.swapfile = false						-- Don't use swapfile
opt.lazyredraw = true						-- Faster scrolling
opt.fileencoding = "utf-8"			-- The encoding written to a file
opt.clipboard = 'unnamedplus'		-- Copy/paste to system clipboard
opt.undofile = true							-- Saving actions even if you close and open NeoVim
opt.fixeol = false							-- Disabling the addition of files at the end
opt.wildmenu = true							-- Shows a more advanced menu for auto-completion suggestions.
opt.completeopt = {							-- Mostly just for cmp
	"noinsert",
	"menuone",
	"noselect"
}
