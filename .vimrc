set nocompatible              " be iMproved, required
set background=dark
set completeopt-=preview
set nu
set rnu
set incsearch
set scrolloff=8
set colorcolumn=80

" turn off GoImport on save
let g:go_fmt_command = "gofmt"

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'preservim/nerdtree'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-fugitive'

call vundle#end()            " required

filetype plugin indent on    " required

syntax on
colorscheme gruvbox

let mapleader = " "
nnoremap <C-p> :NERDTree<CR>
nnoremap <C-h> :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>F :Rg<CR>

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

set errorformat^=%-GIn\ file\ included\ %.%# 
autocmd VimEnter * hi Normal ctermbg=none
let g:gruvbox_transparent_bg=1
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType typescript setlocal ts=4 sts=4 sw=4
