--[[ Connecting Basic Settings ]]--
require('base.autocommands')	-- Editor Autocommands
require('base.appearance')		-- Editor Appearance
require('base.basic')					-- Basic Editor Behavior
require('base.interaction')		-- Parameters of interaction with the editor
require('base.panel')					-- Panel Settings
require('base.search')				-- Search Parameters
require('base.tabs')					-- Tab Parameters


--[[ Connecting Hotkey Modules ]]--
require('keys.main')						-- The main hotkey module
require('keys.plugins.cmp')			-- Keyboard shortcuts for the autocomplete module
require('keys.plugins.mason')		-- Keyboard shortcuts for Mason


--[[ Connecting Plugins Modules ]]--
require('plugins.packer')							-- Module Packer.nvim
require('plugins.configs.cmp')				-- Module Completion Plugin
require('plugins.configs.treesitter')	-- Syntax highlighting module in NeoVim
require('plugins.configs.autopairs')	-- Module Treesitter-based commenting 
require('plugins.configs.comment')		-- Module auto-completion of paired elements 
require('plugins.configs.gitsigns')		-- Module displaying changes in Git
require('gruvbox-material').setup()		-- Applying a color scheme


--[[ Connecting LSP Modules ]]--
require('plugins.configs.lsp.mason')
require('plugins.configs.lsp.null-ls')
require('plugins.configs.lsp.handlers').setup()
