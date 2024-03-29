require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		"bash", "c", "comment", "css", "git_config", "gitignore", "html",
		"ini", "javascript", "jq", "lua", "markdown", "markdown_inline",
		"python", "query", "rasi", "vim", "vimdoc"
	},

	-- List of analyzer names that should be ignored by the installer
	ignore_install = {},

	-- Enable syntax highlighting
	highlight = { enable = true },

	-- Enable auto-completion of paired elements
	autopairs = { enable = true	},

	-- Illumination of paired elements
	rainbow = {
    enable = true,

    -- List of languages you want to disable the plugin for
    disable = {},

    -- Which query to use for finding delimiters
    query = 'rainbow-parens',

    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  },

	-- Enable Treesitter-based commenting
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
  }
}
