"PLUGINS

"PATHOGEN (PLUGIN MANAGER)
call pathogen#infect()
syntax on
filetype plugin indent on

"PLUGINS END

"QUICK SETUP
set laststatus=2
set number
" set rnu
set autoindent
set fdm=indent
set tabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
"set list


set background=dark
colorscheme PaperColor
"colorscheme candy
"colorscheme distinguished
"syntax enable
"set background=dark
"colorscheme solarized
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"QUICK SETUP END
