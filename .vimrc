"PLUGINS

"PATHOGEN (PLUGIN MANAGER)
execute pathogen#infect()


"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"PLUGINS END

"QUICK SETUP
set laststatus=2
set number
set autoindent
"set wrap
"set rnu

syntax on
set background=dark
colorscheme PaperColor
"colorscheme candy
"colorscheme distinguished
"syntax enable
"set background=dark
"colorscheme solarized
