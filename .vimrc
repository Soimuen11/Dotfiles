"PLUGINS

"PATHOGEN (PLUGIN MANAGER)
call pathogen#infect()
syntax on
filetype plugin indent on

"PLUGINS END

"QUICK SETUP
" set spell
" set spelllang=fr
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
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Disable viminfo
let skip_defaults_vim=1
set viminfo=""

"QUICK SETUP END

"KEYBINDINGS
" save + exit vim with <del>
nmap <Del> :x!
"toggle insert mode with ctrl + space
nnoremap <C-space> i
imap <C-space> <Esc>
"remove highlighting
nmap nh :noh
"f5 for en spell check & f6 for fr spellcheck
map <silent> <F5> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
hi clear SpellBad
hi SpellBad cterm=underline
"KEYBINDINGS END
