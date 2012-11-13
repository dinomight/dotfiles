set nocompatible
filetype on
set history=1000
set cf
set clipboard+=unnamed
set ffs=unix,dos,mac
filetype plugin on
set viminfo+=!
set viminfo='100,\"50,n~/.viminfo
set isk+=_,$,@,%,#,-

set background=dark
syntax on
colorscheme evening
hi PreProc ctermfg=Red
hi Constant cterm=bold ctermfg=Red
hi String cterm=underline gui=underline ctermfg=White guifg=White
hi StatusLine ctermfg=Red ctermbg=White guifg=Red guibg=White
hi StatusLineNC ctermfg=Red ctermbg=White

set lsp=0
set wildmenu
set ruler
set cmdheight=1
set number
set lz
set hid
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set shortmess=atl
set report=0
set noerrorbells
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

set showmatch
set mat=2
set matchpairs=(:),{:},[:]
set nohlsearch
set incsearch
set listchars=nbsp:.,tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set so=10
set novisualbell

set fo=tcqrn
set com=s1:/*,mb:*,ex:*/
set ai
set si
set nocindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set nowrap

set backup
set backupdir=~/tmp,~/backup,./
set makeef=error.err

autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent
autocmd BufEnter *.cpp,*.h,*.c,*.cxx,*.hpp set et ts=2 sw=2 cindent
autocmd BufEnter *.plib set filetype=perl
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Make it so up and down go through columns in line
imap <silent> <Up> <C-o>gk
imap <silent> <Down> <C-o>gj
map <silent> <Up> gk
map <silent> <Down> gj

" Make insert and delete give us a bit of scroll
noremap <INS> 2<C-Y>
noremap <DEL> 2<C-E>

map <F3> :set hls!<bar>set hls?<CR>
imap <F3> <ESC>:set hls!<bar>set hls?<CR>i

noremap <F6> <C-W>w
inoremap <F6> <ESC><C-W>wi

ab teh the
