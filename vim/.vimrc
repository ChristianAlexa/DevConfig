" vim config file: ~/.vimrc

set nocompatible                " use vim defaults
set directory^=$HOME/.vim/tmp/  " store backup swap files in /tmp
set laststatus=2                " always show the status line
set number                      " add line numbers
set shiftwidth=4
set guifont=Menlo               " set font
set autoindent
set tabstop=4                   " set tab indentation amount
set expandtab                   " uses spaces instead of tab character
set smartindent
" set scrolloff=2                 " scroll buffer near edges of screen
set background=dark
set hlsearch                    " highlight a /search. Toggle off with :noh
filetype off                    " disable filetype detection
syntax on                       " syntax highlighting
set nowrap                      " Don't wrap lines

" persist folds on save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" map <Leader> key to comma
let mapleader= ','

" move cursor up and down wrapped lines
map j gj
map k gk

" use ,cc to toggle color column
fun! ToggleCC()
  if &cc == ''
    " example of multi columns
    " set cc=1,2,4,8
    set cc=80
  else
    set cc=
  endif
endfun

nnoremap <Leader>cc :call ToggleCC()<CR>

" (PLUGIN MANAGER) vundle
" $ :PluginInstall to install plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" (PLUGIN) Nerd tree - a terminal file tree
" Use `,ne` to toggle nerd tree on/off
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinSize=30        " default pane width
let NERDTreeShowHidden=1        " see hidden files
nmap <Leader>ne :NERDTreeToggle<CR>:set number<CR>

" (PLUGIN) Smooth Scroll - <c-d> move down <c-u> move up
Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

" (PLUGIN) commentary.vim - comment out lines
" Use 'shift + v' to visually select and 'gc' to toggle commenting
Plugin 'tpope/vim-commentary'

" (PLUGIN) vim-javascript - terminal syntax highlighting for js
Plugin 'pangloss/vim-javascript'

" (PLUGIN) lightline - useful terminal modal display
Plugin 'itchyny/lightline.vim'

" All Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
