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
let mapleader=','


filetype indent on
filetype plugin on

" Needs help to indent html the way I want in vim 7.4
let g:html_indent_inctags = "html,body,head,tbody" 

"Don't be shy, my term has 256 colors. Even on Windows.
set t_Co=256
"jellybeans just rocks!
"
colorscheme jellybeans

" custom digraph
digraphs 3. 8230
" Remark: find unicode value for char under cursor: ga

autocmd BufEnter * setlocal noignorecase
autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2

"Sql file autocommands
augroup sqlgroup
    autocmd!
    autocmd BufEnter *.sql,*.pks,*.pkb setlocal ignorecase
    autocmd FileType sql inoremap <buffer> DO<Tab> DBMS_OUTPUT.PUT_LINE();<Esc>hi
augroup END

" {{{ Python augroup
augroup pythongroup
    autocmd!
    autocmd BufNewFile *.py  0r ~/.vim/templates/python/skeleton.py
augroup END
" }}}

" {{{ Markup language augroup
augroup markupgroup
    autocmd!
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    "Html template
    autocmd BufNewFile *.htm,*.html 0r ~/.vim/templates/html/skeleton.htm
    autocmd FileType html,xml,ant setlocal softtabstop=2 shiftwidth=2
    "Call Closetag when needed
    autocmd FileType html,xml,ant,markdown,php,htmldjango,smarty source ~/.vim/scripts/closetag.vim
    " Django templates mapping
    " TODO - transform using Ultisnipps
    autocmd FileType htmldjango inoremap <buffer> bl<tab> 
                \ {% block  %}<cr>{% endblock %}<esc>k$hhi
    autocmd FileType htmldjango inoremap <buffer> bt<tab> 
                \ {% blocktrans  %}<cr>{% endblocktrans %}<esc>k$hhi
    autocmd FileType htmldjango inoremap <buffer> if<tab> 
                \ {% if  %}<cr>{% endif %}<esc>k$hhi
    autocmd FileType htmldjango inoremap <buffer> for<tab> 
                \ {% for %}<cr>{% endfor %}<esc>k$hhi
    autocmd FileType htmldjango inoremap <buffer> ex<tab> 
                \ {% extends "" %}<esc>3hi
    autocmd FileType htmldjango inoremap <buffer> ##<tab> 
                \ {#  #}<esc>hhi
    autocmd FileType htmldjango inoremap <buffer> tr<tab> 
                \ {% trans "" %}<esc>F"i
    autocmd FileType htmldjango vnoremap <buffer> tr<tab> 
                \ xi{% trans "" %}<esc>F"P
    autocmd FileType htmldjango inoremap <buffer> var<tab>
                \ {{  }}<esc>hhi
    " Correction d'un probleme de keyword sous cygwin
    autocmd FileType html,xhtml,rst setlocal iskeyword=@,48-57,_,128-167,224-235
    autocmd FileType html,xhtml nnoremap <buffer> <leader>h O<div lang="en" style="text-align: justify; hyphens: auto; -moz-hyphens: auto; -o-hyphens: auto; -ie-hyphens: auto; -webkit-hyphens: auto"><esc>
augroup END
" }}}

" {{{ javascript augroup
augroup javascript
    autocmd!
    autocmd FileType javascript vnoremap <buffer> com<tab> xO/*<esc>p']o*/
augroup END
" }}}

" {{{ java augroup
augroup java
    autocmd!
    autocmd FileType java setlocal noexpandtab shiftwidth=8
" }}}

" {{{ vim augroup
augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" {{{ actionscript augroup
augroup actionscript
    autocmd!
    autocmd BufNewFile,BufRead *.as set filetype=actionscript
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

nnoremap <leader>d A - <esc>:r !date<cr><esc>kJ
nnoremap <leader>D A <esc>:r !date +\%d/\%m/\%Y<cr><esc>kJ
nnoremap <space> :
vnoremap <space> :
nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap gf :e <cfile><CR>
nnoremap Y y$

" Abrev
"

iabbrev Cdlt Cordialement

" statusline
set laststatus=2
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
