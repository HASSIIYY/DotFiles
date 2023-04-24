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


--[[ Connecting Plugins Modules ]]--
require('plugins.packer')							-- Module Packer.nvim
require('plugins.configs.cmp')				-- Module Completion Plugin
require('gruvbox-material').setup()		-- Applying a color scheme
