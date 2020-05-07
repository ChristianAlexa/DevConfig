syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set cmdheight=2
set updatetime=50
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader=','

" :PluginInstall
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1
nmap <Leader>ne :NERDTreeToggle<CR>:set number<CR>
Plug 'sheerun/vim-polyglot'
Plug 'tweekmonster/gofmt.vim'

call plug#end()

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

colorscheme gruvbox
nnoremap <C-p> :GFiles<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

fun! ToggleCC()
    if &cc == ''
        set cc=80
    else
        set cc=
    endif
endfun

nnoremap <Leader>cc :call ToggleCC()<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

func GoCoC()
    :CocEnable
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <Leader>gd <Plug>(coc-definition)
    nmap <buffer> <Leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <Leader>gi <Plug>(coc-implementation)
    nmap <buffer> <Leader>gr <Plug>(coc-references)
    nmap <buffer> <Leader>rr <Plug>(coc-rename)
    nnoremap <buffer> <Leader>cr :CocRestart
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType js,ts,cpp,cxx,h,hpp,c :call GoCoc()

