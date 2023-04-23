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
		

	--[[ Other ]]--
		use 'wbthomason/packer.nvim'	-- Packer Auto-update
		use "nvim-lua/popup.nvim"			-- An implementation of the Popup API from vim in Neovimh
		use 'nvim-lua/plenary.nvim'		-- Dependency for asynchronous NeoVim plugins

  if PackerBotstrap then
    require('packer').sync()
  end
end)
