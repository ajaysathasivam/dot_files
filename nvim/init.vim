call plug#begin('~/.vim/plugged')
Plug 'Townk/vim-autoclose' " Automatically close parenthesis, etc
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim' "Onedark
Plug 'scrooloose/nerdtree'  " file list
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'ryanoasis/vim-devicons' "NerdTree Icon
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'ctrlpvim/ctrlp.vim'  " fuzzy search files
Plug 'wsdjeg/FlyGrep.vim'  " awesome grep on the fly
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'sheerun/vim-polyglot' " Better language packs
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2'  " awesome autocomplete plugin
Plug 'ncm2/ncm2-bufword'  " buffer keyword completion


call plug#end()

" ncm2 settings {{{
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

set pumheight=5
" }}}

" map S to replace current word with pasteboard {{{
nnoremap S diw"0P
nnoremap cc "_cc
nnoremap q: :q<CR>
nnoremap w: :w<CR>

" map paste, yank and delete to named register so the content
" will not be overwritten (I know I should just remember...)
nnoremap x "_x
vnoremap x "_x

set clipboard=unnamedplus
" }}}




" mapping Esc {{{
imap <F13> <Esc>
cnoremap <Esc> <C-c>
inoremap <c-c> <ESC>
nnoremap <C-z> <Esc>  " disable terminal ctrl-z
" }}}

" FlyGrep settings {{{
nnoremap <leader>s :FlyGrep<cr>
" }}}

" Set options {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" path to your python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

filetype indent on
set foldmethod=marker
set fileformat=unix
set shortmess+=c

set mouse=a  " change cursor per mode
set number  " always show current line number
set smartcase  " better case-sensitivity when searching
set wrapscan  " begin search from top of file when nothing is found anymore

set expandtab
set tabstop=2
set shiftwidth=4
set fillchars+=vert:\  " remove chars from seperators
set softtabstop=4

set history=1000  " remember more commands and search history

set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning

set breakindent  " preserve horizontal whitespace when wrapping
set showbreak=..
set lbr  " wrap words
set nowrap  " i turn on wrap manually when needed

set scrolloff=3 " keep three lines between the cursor and the edge of the screen

set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload

set noshowmode  " keep command line clean
set noshowcmd

set laststatus=2  " always slow statusline

set splitright  "i prefer splitting right and below
set splitbelow

set hlsearch  " highlight search and search while typing
set incsearch
set cpoptions+=x  " stay at seach item when <esc>

set noerrorbells  " remove bells (i think this is default in neovim)
set visualbell
set t_vb=
set relativenumber
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

" easy split movement {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split Alignment {{{
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>
noremap <silent> <C-S-Up> :resize +1<CR>
noremap <silent> <C-S-Down> :resize -1<CR>
" }}}
" }}}
" Copy Paste Command{{{
" CTRL-C to copy (visual mode)
vmap <C-c> y
" CTRL-X to cut (visual mode)
vmap <C-x> x
" CTRL-V to paste (insert mode)
imap <C-v> <esc>P

imap <C-s> <esc>:w<CR>
" }}}


" tabs: {{{
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" }}}

" colorscheme options {{{
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'hard'
"highlight Comment ctermfg=Red

"colorscheme deus
"let g:deus_termcolors=256

"set termguicolors

"let g:tokyonight_style = 'storm' " available: night, storm
"let g:tokyonight_enable_italic = 1

"colorscheme tokyonight
colorscheme onedark
" }}}

" toggle nerdtree on ctrl+n {{{
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
" }}}

" Airline settings {{{
" do not show error/warning section
let g:airline_symbols = {'s1':''}
let g:airline_section_error = ""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_warning = ""
let g:airline_section_c = "%<%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%{airline#util#wrap(airline#extensions#coc#get_status(),0)}%#__restore__#%#__accent_bold#%#__restore__#"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let mapleader = " " " Leader is the space key
let g:mapleader = " "
let maplocalleader = "`"
let g:maplocalleader = "`"
nnoremap <SPACE> <Nop>
" }}}






