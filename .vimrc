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
" {{{ Python augroup
augroup pythongroup
    " Cause a bug in syntax highlighting :P
    autocmd!
    autocmd BufNewFile *.py  0r ~/.vim/templates/python/skeleton.py
    autocmd BufNewFile test_*.py %d | 0r ~/.vim/templates/python/test_skeleton.py
    autocmd FileType python inoremap <buffer> cla<tab> class (object):<cr>
                \"""Blah blah"""<cr>pass<esc>kkF(i
    autocmd FileType python inoremap <buffer> me<tab> def (self):<cr>
                \"""Blah blah"""<cr>pass<esc>kkF(i
    autocmd FileType python inoremap <buffer> fn<tab> def ():<cr>
                \"""Blah blah"""<cr>pass<esc>kkF(i
augroup END
" }}}

" {{{ Markup language augroup
augroup markupgroup
    autocmd!
    autocmd BufNewFile,BufRead *.md set filetype=mkd
    "Html template
    autocmd BufNewFile *.htm,*.html 0r ~/.vim/templates/html/skeleton.htm
    autocmd FileType html,xml,ant setlocal softtabstop=2 shiftwidth=2
    "Call Closetag when needed
    autocmd FileType html,xml,ant,mkd,php source ~/.vim/scripts/closetag.vim 
    " Django templates mapping
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> bl<tab> 
                \ {% block  %}<cr>{% endblock %}<esc>k$hhi
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> bt<tab> 
                \ {% blocktrans  %}<cr>{% endblocktrans %}<esc>k$hhi
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> if<tab> 
                \ {% if  %}<cr>{% endif %}<esc>k$hhi
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> for<tab> 
                \ {% for %}<cr>{% endfor %}<esc>k$hhi
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> ex<tab> 
                \ {% extends "" %}<esc>3hi
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> ##<tab> 
                \ {#  #}<esc>hhi
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> tr<tab> 
                \ {% trans "" %}<esc>F"i
    autocmd FileType html,xhtml,htmldjango vnoremap <buffer> tr<tab> 
                \ xi{% trans "" %}<esc>F"P
    autocmd FileType html,xhtml,htmldjango inoremap <buffer> var<tab>
                \ {{  }}<esc>hhi
augroup END
" }}}

" {{{ javascript augroup
augroup javascript
    autocmd!
    autocmd FileType javascript inoremap <buffer> fun<tab> function () {<cr>}<esc>O
    autocmd FileType javascript inoremap <buffer> dbg<tab> console.debug();<esc>hi
    autocmd FileType javascript vnoremap <buffer> com<tab> xO/*<esc>p']o*/
augroup END
" }}}

" {{{ vim augroup
augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

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
