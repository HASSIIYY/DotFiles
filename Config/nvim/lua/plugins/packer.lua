--[[ Installing Packer Into The System ]]--
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end


--[[ Packer Pre-Setup ]]--
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


--[[ Install Your Plugins Here ]]--
return require('packer').startup(function(use)
	--[[ Plugins of interaction with the editor ]]--
		use 'mbbill/undotree'						-- Creates a tree of changes in the file


	--[[ Color scheme and appearance ]]--
		use 'nvim-tree/nvim-web-devicons'				-- Various icons for Vim/NeoVim
		use 'ap/vim-css-color'									-- Highlighting CSS colors
		use 'wittyjudge/gruvbox-material.nvim'	-- GruvBox-Material color scheme
		use 'HiPhish/nvim-ts-rainbow2'					-- Illumination of paired elements
		use 'nvim-treesitter/nvim-treesitter'		-- Enabling Tree-Sitter support in NeoVim


	--[[ The Completion Plugin ]]--
	  use "hrsh7th/nvim-cmp"					-- The completion plugin
		use "hrsh7th/cmp-buffer"				-- Buffer completions
		use "hrsh7th/cmp-path"					-- Path completions
		use "hrsh7th/cmp-cmdline"				-- Cmdline completions
		use "saadparwaiz1/cmp_luasnip"	-- Snippet completions
		use "hrsh7th/cmp-nvim-lsp"			-- Nvim-cmp source for neovim's built-in language server client
		use "hrsh7th/cmp-nvim-lua"			-- Nvim-cmp source for neovim Lua API.


	--[[ Snippets ]]--
	  use "L3MON4D3/LuaSnip"							-- Snippet engine
		use "rafamadriz/friendly-snippets"	-- A bunch of snippets to usef


	--[[ Language Server Protocol ]]--
		use 'neovim/nvim-lspconfig'							-- Configs for LSP servers
		use "williamboman/mason.nvim"						-- Simple to use language server installer
		use "williamboman/mason-lspconfig.nvim" -- Simple to use language server installer
		use 'jose-elias-alvarez/null-ls.nvim'		-- LSP diagnostics and code actions


	--[[ Other ]]--
		use 'wbthomason/packer.nvim'	-- Packer Auto-update
		use "nvim-lua/popup.nvim"			-- An implementation of the Popup API from vim in Neovimh
		use 'nvim-lua/plenary.nvim'		-- Dependency for asynchronous NeoVim plugins


  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
