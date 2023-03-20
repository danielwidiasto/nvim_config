"Functions
fun! SetAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

fun! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfun

call plug#begin()

    "Core
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'jiangmiao/auto-pairs'

    "Theme
    Plug 'morhetz/gruvbox'

call plug#end()

:colorscheme gruvbox

"Basic
set nocompatible
:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set tabpagemax=15

call SetAlias("W", "w")

match errorMsg /\s\+$/

"Remap
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(0) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
