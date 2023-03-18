"" INSTALLING PLUGINS

call plug#begin('~/.config/nvim/plugged')

	" Plugins of interaction with the editor
	Plug 'majutsushi/tagbar'			" Tag menu for NeoVim
	Plug 'mbbill/undotree'				" Creates a tree of changes in the file
	Plug 'tc50cal/vim-terminal'		" Improving work with the NeoVim terminal
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}	" Multiple Cursor for NeoVim

	" Color scheme and appearance
	Plug 'sainnhe/gruvbox-material'	" GruvBox-Material color scheme
	Plug 'ryanoasis/vim-devicons'		" Various icons for Vim/NeoVim
	Plug 'luochen1990/rainbow'			" Illumination of paired elements
	Plug 'ap/vim-css-color'					" Highlighting CSS colors

	" Other
	Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
	Plug 'liuchengxu/vista.vim'		" Shows the structure of the current source file

call plug#end()



"" BASIC EDITOR SETTINGS

" Parameters of interaction with the editor
	set mouse=a									" Enable mouse
	set encoding=utf-8					" Default encodingi
	set number relativenumber		" Hybrid line numbering
	set noswapfile							" Disabling swapfile
	set scrolloff=7							" The number of lines of indentation from the bottom line of the editor
	set fileformat=unix					" Default file format
	filetype indent on					" Load filetype-specific indent files

" Tab Options
	set smarttab				" Pressing Tab at the beginning of the line will add an indent, the width of which corresponds to shiftwidth
	set smartindent			" Copies the margins from the current line when adding a new one and automatically sets the margins in the 'right' places
	set tabstop=2				" The number of spaces in the tab
	set softtabstop=2		" The number of spaces that the tab character is displayed with when adding
	set shiftwidth=2		" By default, it is used to adjust the width of the margins in spaces added by the commands '>>' and '<<'

" Example of StatusLine configuration
	set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P	" Statusline configuration
	" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{wordcount()[\"words\"]}

" Other
	set clipboard+=unnamedplus  " Use the system clipboard
	set undofile								" Saving actions even if you close and open NeoVim



""PLUGIN SETTINGS
" Raindow
	let g:rainbow_active = 1	" Enabling the illumination of paired elements

" Markdown Preview
	let g:mkdp_page_title = 'Preview: ${name}.md'	" ${name} will be replace with the file name



"" COLOR SCHEME SETTINGS

" Important!!
if has('termguicolors')
	set termguicolors
endif

" Version of the color scheme
set background=dark " Available values: 'dark' and 'light'

" Set contrast.
let g:gruvbox_material_background = 'hard' " Available values: 'hard', 'medium' and 'soft'

" For better performance
let g:gruvbox_material_better_performance = 1

" Applying a color scheme
colorscheme gruvbox-material



"" KEYBOARD SHORTCUTS FOR PLUGINS
nmap <F5> :Vista!!<CR>
nmap <F6> :TagbarToggle<CR>
nmap <F7> :UndotreeToggle<CR>
nmap <F8> <Plug>MarkdownPreviewToggle<CR>



"" KEYBOARD SHORTCUTS
" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>



"" FUNCTIONS



"" AUTOCOMMANDS
" Removing trailing whitespaces
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	au BufWinEnter * match ExtraWhitespace /\s\+$/
	au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	au InsertLeave * match ExtraWhitespace /\s\+$/
	au BufWinLeave * call clearmatches()

" Disabling relativenumber for insertion mode
	augroup every
		autocmd!
		au InsertEnter * set norelativenumber
		au InsertLeave * set relativenumber
	augroup END
