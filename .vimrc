"PLUGINS

"PATHOGEN (PLUGIN MANAGER)
call pathogen#infect()
syntax on
filetype plugin indent on

"PLUGINS END

"QUICK SETUP
set laststatus=2
set number
set relativenumber 
set wildmenu
set wildmode=list:longest,full
set encoding=utf-8
set autoindent
set fdm=indent
set tabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
set background=dark
colorscheme PaperColor
"colorscheme candy
"colorscheme distinguished
"colorscheme solarized
"set background=dark
let g:syntastic_tex_checkers = ['lacheck']
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"QUICK SETUP END

"Keybindings
map <Del> :x!
