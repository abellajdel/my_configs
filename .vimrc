runtime !debian
syntax on
call pathogen#infect()
colorscheme delek

set nocompatible

set number
set autoindent
set autowriteall
set background=dark
set backspace=2
set expandtab
set pastetoggle=<C-Insert>
set ruler
set shiftwidth=4
set smartindent
set smarttab
set nostartofline
set wildignore=*.o
set wildmode=longest,list
set viminfo='10,\"100,:20,%,n~/.viminfo
set nowrap
syntax on
filetype plugin indent on

nmap <F1> :tabedit<Space>
nmap <F2> gT
nmap <F3> gt
nmap <F4> :bd<Return>
nmap <F5> :NERDTreeToggle<Return>
nmap <F6> <C-w><C-w>
nmap <F7> :tabnew<bar>NERDTreeToggle<Return>
nmap <F12> :w<Return>
nmap Q :qa<Return>

hi MatchParen ctermbg=blue
hi LineNr ctermfg=cyan

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    au BufEnter *[Mm]akefile    set noet sw=8
    au BufEnter *.c,*.cpp,*.h,*.inl   call DoCAutocommands()
    au BufEnter *.html          set nosi nocin ft=html
    au BufEnter *.less          set ft=less
    au BufEnter *.i,*.swg       set ft=swig | call DoCAutocommands()
    au BufEnter *.py            call DoPythonAutocommands()
    au BufEnter *.java          set cin
    au BufEnter *.mp            set si | nmap <F11> :!mpost %<Return>
    au BufEnter *.gpi           set si | nmap <F11> :!gnuplot %<Return>
    au BufEnter *.ppl           set ft=gnuplot | nmap <F11> :!pyxplot %<Return>
    au BufEnter *.coffee        set noet sw=2 ts=2
    au BufEnter *.rb            set sw=2
    au BufEnter *.cu            set ft=cu | call DoCAutocommands()
    au BufEnter *.sh            nmap <F11> :!sh %<Return>
    au BufWritePost ~/.vimrc    so ~/.vimrc
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

    function DoCAutocommands()
        set cin et si sw=4
        syn keyword cType uint ulong ushort uchar byte real
        nmap <F11> :make "%:r"<Return>
        vmap <F8> <Plug>PComment
    endfunction

    function DoPythonAutocommands()
        set ts=4 sw=4 sta et sts=4 ai nosmartindent
        nmap <F11> :!python "%:r.py"<Return>
    endfunction



endif
