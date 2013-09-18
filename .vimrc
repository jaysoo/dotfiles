syntax on
filetype on
filetype plugin indent on
"au BufRead,BufNewFile *.tag set filetype=jsp

call pathogen#infect()

set showmatch       " show matching parens
set vb t_vb=        " disable beeping
set nohls           " no highlight for search term
set virtualedit=all
set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

"set autoindent     " always set autoindenting on
"set smartindent        " smart indent
"set cindent            " cindent
set noautoindent
set nosmartindent
set nocindent  

"set autowrite      " auto saves changes when quitting and swiching buffer
set expandtab      " tabs are converted to spaces, use only when required
set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines

syntax enable
set background=dark
colorscheme solarized

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72
    
    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

" Keyboard mappings
let mapleader=","
map <F1> :previous<CR>  " map F1 to open previous buffer
map <F2> :next<CR>      " map F2 to open next buffer
map <silent> <C-N> :silent noh<CR> " turn off highlighted search
map <Leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <Leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
map <Leader>u :source ~/.vimrc<cr> " update the system settings from my vimrc file
"----- write out html file
map <Leader>h :source $VIM/vim71/syntax/2html.vim<cr>:w<cr>:clo<cr>

map <Leader>l :TlistToggle<cr>
map <Leader>t :CtrlP<cr>
map <Leader>t :NERDTree<cr>
"map <Leader>rs :!coffee $JS_PATH/tools/runspecs.coffee %:p<cr>
"map <Leader>rS :!coffee $JS_PATH/tools/runspecs.coffee --all<cr>

map <Leader>pdb ofrom ipdb import set_trace; set_trace()<Esc>
map <Leader>cd Odefine (require, exports, module) -><cr>  

" Common command line typos
"cmap W w
"cmap Q q

" Keyboard mapping for numeric keypad
"imap <Esc>OM <c-m>
" map <Esc>OM <c-m>
"imap <Esc>OP <nop>
" map <Esc>OP <nop>
"imap <Esc>OQ /
" map <Esc>OQ /
"imap <Esc>OR *
" map <Esc>OR *
"imap <Esc>OS -
" map <Esc>OS -

"imap <Esc>Ol +
"imap <Esc>Om -
"imap <Esc>On ,
"imap <Esc>Op 0
"imap <Esc>Oq 1
"imap <Esc>Or 2
"imap <Esc>Os 3
"imap <Esc>Ot 4
"imap <Esc>Ou 5
"imap <Esc>Ov 6
"imap <Esc>Ow 7
"imap <Esc>Ox 8
"imap <Esc>Oy 9
"imap <Esc>Oz 0

"rails
let g:rails_path_additions = ['domain/common', 'domain/integration', 'domain/invoicing', 'domain/picking',
            \'domain/production', 'domain/quickbooks', 'domain/reports', 'domain/true_efficiency', 'domain/icg',
            \'domain/inventory', 'domain/master', 'domain/planning', 'domain/quality', 'domain/quoting',
            \'domain/shipping_receiving', 'domain/wms']

let g:Tlist_Inc_Winwidth=0
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

set runtimepath^=~/.vim/bundle/ctrlp.vim

"Closetag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

"Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
