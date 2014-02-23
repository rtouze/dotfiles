"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My .vimrc (^-^)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect() 

syntax on
set nocompatible
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set showcmd
set showmode
set autoindent
set wildmenu
set showmatch
set ruler
set backspace=2

"Don't be shy, my term has 256 colors. Even on Windows.
set t_Co=256

filetype indent on
filetype plugin on

" Needs help to indent html the way I want in vim 7.4
let g:html_indent_inctags = "html,body,head,tbody" 

"jellybeans just rocks!
colorscheme jellybeans

" custom digraph
digraphs 3. 8230
" Remark: find unicode value for choar under cursor: ga

autocmd BufEnter * setlocal noignorecase
autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.less setlocal filetype=sass

"Sql file autocommands
augroup sqlgroup
    autocmd!
    autocmd BufEnter *.sql,*.pks,*.pkb setlocal ignorecase
    autocmd FileType sql inoremap <buffer> DO<Tab> DBMS_OUTPUT.PUT_LINE();<Esc>hi
augroup END

"Python templates
augroup pythongroup
    autocmd!
    autocmd BufNewFile *.py  0r ~/.vim/templates/python/skeleton.py
    autocmd BufNewFile test_*.py %d | 0r ~/.vim/templates/python/test_skeleton.py
augroup END

augroup markupgroup
    autocmd!
    autocmd BufNewFile,BufRead *.md set filetype=mkd
    "Html template
    autocmd BufNewFile *.htm,*.html 0r ~/.vim/templates/html/skeleton.htm
    autocmd FileType html,xml,ant setlocal softtabstop=2 shiftwidth=2
    "Call Closetag when needed
    autocmd FileType html,xml,ant,mkd,php source ~/.vim/scripts/closetag.vim 
    autocmd FileType html,mkd iabbrev <buffer> ... &hellip; 
augroup END

augroup javascript
    autocmd!
    autocmd FileType javascript inoremap <buffer> fun<tab> function () {<cr>}<esc>O
    autocmd FileType javascript inoremap <buffer> dbg<tab> console.debug();<esc>hi
    autocmd FileType javascript vnoremap <buffer> com<tab> xO/*<esc>p']o*/

augroup END

"Remap jk to get out of insert mode!
inoremap jk <esc>

"I remap Q, because I don't want to switch to Ex mode by mistake.
noremap Q gq

"Insert mapping to double paired char and put the cursor in the middle
inoremap "<TAB> ""<ESC>i
inoremap '<TAB> ''<ESC>i
inoremap [<TAB> []<ESC>i
inoremap (<TAB> ()<ESC>i
inoremap {<TAB> {}<ESC>i
inoremap <<TAB> <><ESC>i
inoremap `<TAB> ``<ESC>i
inoremap /*<Tab> /**/<Esc>hi

" Bubble single lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
" Bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]
