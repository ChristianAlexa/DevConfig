" VIMRC

" =============================================================================
" About
" =============================================================================

" - Author: Christian Alexa
" - This is a vim config file: ~/.vimrc
" - There should also be a directory:  ~/.vim
" - Plugins are managed with Vundle: ~/.vim/bundle
" - Periodically, clear out your vim cache: ~/.viminfo

" =============================================================================
" General Settings
" =============================================================================

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
set scrolloff=2                 " scroll buffer near edges of screen
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

" =============================================================================
" General Mapped Keybinds
" =============================================================================

" Map <Leader> key to comma
let mapleader= ','

" use ,t to add task symbol '- [ ] '
nnoremap <Leader>t i- [ ]  <Esc>i

" so I can go up and down wrapped lines
map j gj
map k gk

" =============================================================================
" Functions
" =============================================================================

" Toggle color column to indicate max width
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

" =============================================================================
" Vundle - a plugin manager
" Getting Started:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/
" Run this command in a fresh terminal window to install new plugins
" :PluginInstall
" set resource path and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" =============================================================================

" =============================================================================
" Nerd tree - a terminal file tree
" Getting Started:
" $ git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinSize=30        " default pane width
let NERDTreeShowHidden=1        " see hidden files
" Use `,ne` to toggle nerd tree on/off
nmap <Leader>ne :NERDTreeToggle<CR>:set number<CR>
" =============================================================================

" =============================================================================
" Plugin Smooth Scroll - less jarring <c-d> and <c-u> scroll movement
" Getting Started:
" $ git clone https://github.com/terryma/vim-smooth-scroll.git ~/.vim/bundle/
Plugin 'terryma/vim-smooth-scroll'
" overwrite scroll keybinds to use smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>
" =============================================================================

" =============================================================================
" Vim Fireplace - REPL for Clojure development
" Getting Started:
" $ git clone https://github.com/tpope/vim-fireplace.git ~/.vim/bundle/
Plugin 'tpope/vim-fireplace'
" =============================================================================

" =============================================================================
" Markdown Folding - Text outlining for Vim based on Emacs Org-Mode
" Commands:
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" =============================================================================

" All Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required

