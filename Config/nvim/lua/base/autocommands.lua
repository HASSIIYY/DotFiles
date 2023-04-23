-- Do not auto comment on new lines when switching to a new line
vim.api.nvim_create_autocmd({'BufEnter'}, {
  pattern = '*',
  callback = function()
    vim.opt.fo:remove('c')
    vim.opt.fo:remove('r')
    vim.opt.fo:remove('o')
  end
})

-- Disabling relativenumber for insertion mode
vim.cmd [[
					augroup every
						autocmd!
						au InsertEnter * set norelativenumber
						au InsertLeave * set relativenumber
					augroup END
				]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Highlighting copied lines
local YankHighlightGrp = vim.api.nvim_create_augroup('YankHighlightGrp', {})
vim.api.nvim_create_autocmd('TextYankPost', {
	group = YankHighlightGrp,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 500,
    })
  end
})
