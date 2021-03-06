" This must be first line
set nocompatible

" ================ NeoBundle ====================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

" Go
NeoBundle 'fatih/vim-go'

" JavaScript/CoffeeScript
NeoBundle 'vim-coffee-script'

" Utilities
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Syntastic'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Tagbar'
NeoBundle 'fugitive.vim'
NeoBundle 'delimitMate.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'EasyMotion'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'Tabular'
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "sent-hil/vim-snippets"
NeoBundle "Raimondi/delimitMate"
NeoBundle "skwp/greplace.vim"
NeoBundle "itchyny/lightline.vim"
NeoBundle "christoomey/vim-tmux-navigator"
NeoBundle "joshhartigan/vim-reddit"
NeoBundle "ryanss/vim-hackernews"

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" ================ NeoBundle ====================

" ================ General Config ====================
"Allow backspace key to delete in insert mode
set backspace=indent,eol,start

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Display incomplete commands
set showcmd

" Show matching brackets when text indicator is over them
set showmatch

" Makes search act like search in modern browsers
set incsearch

" Highlight search results
set hls

" ignore ctags
set wildignore+=*/tags

" general ruby ignores
set wildignore+=*/vendor/*
set wildignore+=*/coverage/assets/*

" Koding ignores
set wildignore+=*/builders/*
set wildignore+=*/node_modules/*
set wildignore+=*/_archive/*
set wildignore+=*/vagrant/*

" tired of moving too much, see toggle below
set relativenumber

set numberwidth=5
set showtabline=0
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2
set wildmode=longest,list
set cmdheight=1
set winheight=10
set winminheight=7
set winheight=999
set shell=/bin/sh
set wrap
set linebreak
set complete-=i
set numberwidth=2
set nofoldenable

" persist undos across sessions
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" recursively go up till you find tags (ctags) files
set tags=./tags;/

" ================ Theme ====================
syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" highlight current line
hi CursorLine cterm=NONE ctermbg=black

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" ================ Mappings ====================

nnoremap <CR> :nohlsearch<CR>/<BS>

let mapleader=","

" Use cntrl+jkhl to move between split buffers.
map <M-j> <C-w>j
map <M-k> <C-w>k
map <M-l> <C-w>l
map <M-h> <C-w>h

"switches between recently open files
nnoremap ;; <c-^>

" Esc is too hard to reach
imap jj <Esc>

" close file
map qq <C-w>q

if &diff
  nmap <c-h> :diffget 1<cr>
  nmap <c-l> :diffget 3<cr>
  nmap <c-k> [cz.
  nmap <c-j> ]cz.
  set nonumber
endif

map q <Nop>

" toggle line numbers
map <leader>n :set number! number?<CR>

" cut with shift x
vmap <C-x> :!pbcopy<CR>

" cut with shift c
vmap <C-c> :w !pbcopy<CR><CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" open buffer with list of ctags for file
map tt :TagbarToggle<CR>

" complete local variables
imap <leader>l <c-p>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U> " delete from current to end of line
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

map 0 ^

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" ================ Commands ====================
command!  W :w
command!  Q :q
command! Wq :wq

" ================ Misc ====================

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" delete trailing whitespace before save
autocmd BufWritePre * :%s/\s\+$//e

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%"

" ================ Config ====================
let g:stop_autocomplete=0

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

if executable('coffeetags')
  let g:tagbar_type_coffee = {
          \ 'ctagsbin' : 'coffeetags',
          \ 'ctagsargs' : '',
          \ 'kinds' : [
          \ 'f:functions',
          \ 'o:object',
          \ ],
          \ 'sro' : ".",
          \ 'kind2scope' : {
          \ 'f' : 'object',
          \ 'o' : 'object',
          \ }
          \ }
endif"}

" SYNTASTIC
let g:syntastic_loc_list_height=5

" open error list in bottom buffer
let g:syntastic_auto_loc_list=1

" jump to location of error afer saving
let g:syntastic_auto_jump=1

" CNTRP
nnoremap <leader>t :CtrlP<cr>

" buffer search
nnoremap <leader>p :CtrlPBuffer<cr>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <C-u> <ESC>:m .+1<CR>==gi
inoremap <C-i> <ESC>:m .-2<CR>==gi

let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

let g:go_bin_path = "/Users/senthil/.gobin"
let g:go_fmt_command = "goimports"
au FileType go nmap <C-]> <Plug>(go-def)

let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right':    '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" ================ Languages ====================
" GO
au BufRead,BufNewFile *.go.old set filetype=go
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.go set textwidth=1000
autocmd FileType go nnoremap <leader>ac :Ack --go "<C-R><C-W>"
"autocmd FileType go map .. :w \|! clear && go run %<CR>
au BufRead,BufNewFile *_test.go map .. :w \|! clear && go test<CR>

" ================ Functions ====================
function! OpenGoTestAlternate()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '_test\.go$') != -1
  let going_to_spec = !in_spec
  if going_to_spec
    let new_file = substitute(new_file, '\.e\?go$', '_test.go', '')
  else
    let new_file = substitute(new_file, '_test\.go$', '.go', '')
  endif
  exec ':e ' . new_file
endfunction
autocmd FileType go nnoremap <leader>s :call OpenGoTestAlternate()<cr>

" toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set relativenumber!
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

let g:SuperTabDefaultCompletionType = "context"
let g:stop_autocomplete=0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:EasyMotion_leader_key = '<Leader>'
"let g:syntastic_go_checkers = ['go', 'golint']

augroup markdown
  autocmd!

 " Set the auto-wrap at 80 characters for markdown.
  autocmd BufNewFile,BufRead *.md setlocal textwidth=80

 " Black magic from
 " http://vim.wikia.com/wiki/Automatic_formatting_of_paragraphs
 autocmd BufNewFile,BufRead *.md setlocal fo=aw2tq
augroup END

nnoremap Q gqip
set textwidth=80

cmap w!! w !sudo tee > /dev/null %

" If a file is changed outside of vim, automatically reload it without asking
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

nnoremap <leader>ac :Ack "<C-R><C-W>"
