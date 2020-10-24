" ~ Welcome to my .vimrc ~

execute pathogen#infect()
syntax on


"----------------------------
"           Colors!
"----------------------------

" Base Colorscheme
colorscheme xcodedarkhc


" Set to 256 colors
set t_Co=256


" Airline theme
let g:airline_theme='bubblegum'

"----------------------------
"           Editor!
"----------------------------

" Enable mouse stuff
set mouse=a

" Show tabs
set list
set listchars=tab:»\  " ends with space

" jj = esc in insert mode
inoremap jj <esc>

" tab = 4 spaces
" set expandtab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable line numbers
set number

" Turn on syntax highlighting
syntax on

" Auto-tab new lines to match previous line
set autoindent
set copyindent

" Ignore case when searching
set ignorecase

"----------------------------
"         NerdTree!
"----------------------------

" Nerd Tree runs on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open with ctrl + n
nnoremap <C-n> :NERDTreeToggle<CR>

" Close when last window is a nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files by default
let g:NERDTreeShowHidden = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"----------------------------
"          Airline!
"----------------------------

"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#enabled = 0

let g:airline_detect_crypt=0
let g:airline_detect_spell=0

" Custom symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

" Allows statusbar to show up with one window
set laststatus=2


let g:airline_extensions = ['syntastic']

" Custom statusline
function! AirlineInit()
	let g:airline_section_a = airline#section#create_left([''])
	let g:airline_section_b = airline#section#create([''])
	let g:airline_section_c = airline#section#create(['file'])
	let g:airline_section_x = airline#section#create(['%l/%L : %3c'])
	let g:airline_section_y = airline#section#create([''])
	let g:airline_section_z = airline#section#create_left(['mode', 'paste'])
	let g:airline_section_error = airline#section#create(['syntastic-err'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()


"----------------------------
"          Syntastic!
"----------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:syntastic_javascript_exec='/usr/lib/node_modules/eslint/bin/eslint.js'
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
