" Don't try to be vi compatible
set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"When installing from scratch run 
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"to set up vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tomasiser/vim-code-dark'
Plugin 'itchyny/lightline.vim'
call vundle#end()            

filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate

syntax on
let python_highlight_all=1
let mapleader = " "

set noshowmode " hides --insert-- extra line
" set termguicolors " Use full terminal colors.
set mouse=a
set title
set history=1000
set nowrap
" set listchars=tab:▸\ ,eol:¬ " Visualize tabs and newlines
set modelines=0 " Security
set relativenumber " Show relative and absolute line #s
set number
set cursorline
set encoding=utf-8 " Encoding
set textwidth=79 " Whitespace
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noshiftround
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
set hidden " Allow hidden buffers
set ttyfast " Rendering
set laststatus=2 " Status bar
set showcmd " Shows the last command typed in bottom right
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set visualbell
set t_vb=

" Use VS-CODE Inspired Colorscheme.
colorscheme codedark
" Set background to see transparent terminal background.
highlight Normal ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermfg=DarkGrey ctermbg=NONE guifg=#666666 guibg=NONE
highlight NonText ctermbg=NONE
" The guicolors and builtin vim terminal is broken so split screen with winterm
highlight Terminal guibg=#1e1e1e
" Colors current line differently from relative lines.
highlight clear CursorLine
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=#666666 guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#e2e822 guibg=NONE

" Theme for Lightline bar
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Bright',
      \ }
" Makes the center of the lightline transparent
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

" Extends % jumping between if-else etc... 
runtime! macros/matchit.vim

" Enables ctrl-c and ctrl-v copying and pasting to clipboard.
map <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
map <C-v> :r ~/.vimbuffer<CR>

" clear search with leader + ,
map <leader><,> :let @/=''<cr> 
" Formatting
map <leader>q gqip
" Toggle viewing tabs and EOL use leader key + l 
map <leader>l :set list!<CR> 
" Comment out lines using leader + /
noremap <leader>/ :Commentary<cr>

"Autoclose parentheses in insert mode.
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" Searching
nnoremap / /\v
vnoremap / /\v
