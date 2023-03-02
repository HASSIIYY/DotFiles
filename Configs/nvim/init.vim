"" INSTALLING PLUGINS

call plug#begin('~/.config/nvim/plugged')

	" Plugins of interaction with the editor
	Plug 'tc50cal/vim-terminal'
	Plug 'tpope/vim-surround'		" Automatic closing of paired elements.
	Plug 'tpope/vim-commentary' " Comments
	Plug 'ap/vim-css-color'			" Highlighting CSS colors

	" Color scheme
	Plug 'sainnhe/gruvbox-material'	" GruvBox-Material color scheme
	Plug 'ryanoasis/vim-devicons'		" Various icons for Vim/NeoVim

call plug#end()


"" BASIC EDITOR SETTINGS

" Parameters of interaction with the editor
	set mouse=a									" Enable mouse
	set encoding=utf-8					" Default encoding
	set number relativenumber		" Hybrid line numbering
	set noswapfile							" Disabling swapfile
	set scrolloff=7							" The number of lines of indentation from the bottom line of the editor
	set fileformat=unix					" Default file format
	filetype indent on					" Load filetype-specific indent files

" Tab Options
	set smartindent			" Copies the margins from the current line when adding a new one and automatically sets the margins in the 'right' places
	set smarttab
	set tabstop=2				" The number of spaces in the tab
	set softtabstop=2		" The number of spaces that the tab character is displayed with when adding
	set shiftwidth=2		" By default, it is used to adjust the width of the margins in spaces added by the commands '>>' and '<<'


"" COLOR SCHEME SETTINGS

" Important!!
	if has('termguicolors')
		set termguicolors
	endif

" Version of the color scheme
	" Available values: 'dark' and 'light'
	set background=dark 

" Set contrast.
	" Available values: 'hard', 'medium' and 'soft'
	let g:gruvbox_material_background = 'hard'

" For better performance
	let g:gruvbox_material_better_performance = 1

" Applying a color scheme
	colorscheme gruvbox-material
