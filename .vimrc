set nocompatible
filetype off

""" Vundle
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
"Plugin 'VundleVim/Vundle.vim'

""" vim-plug (vundle alternative)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

"Plug 'sudo.vim' " deprecated?
"Plug 'gtags.vim' " deprecated?
"Plug 'monday'
"Plug 'TwitVim' " deprecated?
Plug 'h1mesuke/vim-alignta'

"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-smartchr'
Plug 'kana/vim-smartword'
Plug 'kana/vim-surround'

" CamelCase/snake_case
Plug 'nicwest/vim-camelsnek'
" csv
Plug 'mechatroner/rainbow_csv'

" c++
Plug 'rhysd/vim-clang-format'
Plug 'bfrg/vim-cpp-modern'
Plug 'kana/vim-operator-user'


"Plug 'Shougo/vimproc'
"Plug 'Shougo/neocomplcache'
"Plug 'Shougo/vimshell'
"Plug 'Shougo/vimfiler'
"Plug 'Shougo/unite.vim'
Plug 'Shougo/vinarise.vim'
"Plug 'h1mesuke/unite-outline'

"Plug 'scrooloose/nerdtree'
"Plug 'majutsushi/tagbar'

Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'

" NOTE: fuzzyfinder requires L9
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" window swap
Plug 'wesQ3/vim-windowswap'

" lsp
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
" another lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" auto completion
"Plug 'Shougo/deoplete.nvim'
"Plug 'lighttiger2505/deoplete-vim-lsp'

" for haskell
"Plug 'ujihisa/neco-ghc'
"Plug 'eagletmt/ghcmod-vim'
"Plug 'eagletmt/unite-haddock'

" for coq
Plug 'eagletmt/coqtop-vim'

" for rust
Plug 'rust-lang/rust.vim'

" for scala
Plug 'derekwyatt/vim-scala'

" for Typescript
Plug 'leafgarland/typescript-vim'

" for haxe
Plug 'jdonaldson/vaxe'

" for agda
Plug 'derekelkins/agda-vim'

" for swift
Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'

" nix
Plug 'LnL7/vim-nix'

" terraform
Plug 'hashivim/vim-terraform'

" others
Plug 'scrooloose/syntastic'

Plug 'solarnz/thrift.vim'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" lsp config
source ~/.vim/coc_config.vim

filetype plugin indent on


syntax on
set t_Co=256
colorscheme hybrid


autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd FileType typescript :set makeprg=make
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

"cmapclear
"imapclear
"omapclear
"nmapclear
"vmapclear
"xmapclear
"smapclear

set shell=/bin/zsh
set number
set autoindent
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start
set modeline
set modelines=4
"set clipboard=unnamed
" Stop auto window resize
set noequalalways

"encoding
let &termencoding = &encoding
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,iso-2022-jp,sjis,euc-jp
set ambiwidth=double

"status
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set showcmd

"space
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" backup
set backupdir=$HOME/.tmp
set directory=$HOME/.tmp

" Delete trailing spaces by <F5>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" tabs
nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprevious<CR>

"日本語入力中にカーソルの色を変更する
if has('multi_byte_ime') || has('xim')
" 日本語入力ON時のカーソルの色を設定
highlight CursorIM guibg=Purple guifg=NONE
endif
"Zenkaku-Space visualization
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
" Change cursor appearances
let &t_SI .= "\e[5 q"
let &t_SR .= "\e[3 q"
let &t_EI .= "\e[1 q"

" ファイルの自動読み直しの設定でInsertモードに切り替わった時とウィンドウが移動した時にファイルを読み直すようにする
if has("autocmd")
  augroup vimrc-checktime
    autocmd!
    autocmd InsertEnter,WinEnter * checktime
  augroup END
endif

"search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

function! s:GetVisualSelection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction

function! s:Highlighting(text, checkWordBoundaries)
    if a:checkWordBoundaries == 1
        let @/ = '\<'.a:text.'\>'
    else
        let @/ = a:text
    endif
    return ":\<c-u>silent set hlsearch\<CR>"
endfunction

nnoremap <script> <expr> * <SID>Highlighting(expand('<cword>'), 1)
nnoremap <script> <expr> g* <SID>Highlighting(expand('<cword>'), 0)
vmap * <esc><visual-word-highlight>
nmap <script> <expr> <visual-word-highlight> <SID>Highlighting(<SID>GetVisualSelection(), 0)

" ctags
nnoremap <C-]> :exe("ltag ".expand('<cword>')."\|lopen")<CR>
nnoremap g<C-]> :exe("ltag ".expand('<cword>')."\|llist")<CR>


" cursorline
setlocal cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
"highlight CursorLine term=reverse cterm=reverse

" wrap
set nowrap

"folding
set foldcolumn=2
set foldmethod=marker
set foldmarker={{{,}}}

"mouse
"set mouse=a
set mousehide
"map <MouseDown> <Nop>
"map <MouseUp> <Nop>

" tags
set tags=.tags

" TagList
"let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'

" fakeclip
"map gy "*y
"map gp "*p
"if exists('$WINDOW') || exists('$TMUX')
"    map gY (fakeclip-screen-y)
"    map gP (fakeclip-screen-p)
"endif

" Adjust window size
" f: Focus
nnoremap <silent> <c-w>f :resize<cr>:vertical resize 140<cr>
" t: Tall
nnoremap <silent> <c-w>t z200<cr>
" w: Wide
nnoremap <silent> <c-w>w 800<c-w>>
nnoremap <silent> <c-w>> 40<c-w>>
nnoremap <silent> <c-w>< 40<c-w><

"general mapping {{{1
let mapleader = "\<Space>"
noremap j gj
noremap k gk
noremap <c-e> 5<c-e>
noremap <c-y> 5<c-y>
noremap zh 20zh
noremap zl 20zl
"noremap <leader><leader> :w<cr>
nnoremap ,vs <esc>:<c-u>so ~/.vimrc<cr>:noh<cr>
nnoremap ,ve <esc>:<c-u>vs ~/.vimrc<cr>
nnoremap ,n <esc>:<c-u>noh<cr>
nnoremap ,c <esc>:<c-u>cclose<cr>

"inoremap <ESC> <ESC>:set iminsert=0<CR>

" fuzzyfinder
nnoremap <unique> <silent> <leader>f :Files<CR>
nnoremap <unique> <silent> <leader>g :Ag<CR>

" ref.vim {{{1
let g:ref_phpmanual_path=$HOME."/.vim/ref/php-chunked-xhtml"

" VimFiler.vim {{{1
command! Vf VimFiler -buffer-name=explorer -split -simple -toggle -no-quit
let g:vimfiler_as_default_explorer=1

nnoremap ,f :<c-u>VimFilerSplit -winheight=10 -toggle -double -horizontal -reverse<cr>


" Unite.vim {{{1
" 入力モードで開始する
"let g:unite_enable_start_insert=1
"noremap ,m :<c-u>Unite <c-d>
"noremap ,mf :<c-u>Unite buffer file_mru file_rec<CR>
"noremap ,mo :<c-u>Unite outline<CR>


" VimShell.vim {{{1
let g:vimshell_popup_command="botright 10new"
nnoremap ,s :<c-u>VimShellPop -toggle<cr>


" Tagbar {{{1
nnoremap ,o :<c-u>TagbarToggle<cr>


" NerdTree {{{1
nnoremap <silent> ,t :NERDTreeToggle<cr>
let NERDTreeWinSize=31


" redmine.vim {{{1
let g:redmine_auth_site = 'http://localhost:3000'
let g:redmine_auth_key  = ''
let g:redmine_author_id = '5'
let g:redmine_project_id = '1'


" gtags.vim {{{1
nnoremap <c-j> :GtagsCursor<cr>

" xml.vim {{{1
filetype plugin on

" minibufexpl.vim {{{1
"nmap <Space> :MBEbn<CR>
"" GNU screen likeなキーバインド
""let mapleader = "^F"
"nnoremap <Leader><Space> :MBEbn<CR>
"nnoremap <Leader>n       :MBEbn<CR>
"nnoremap <Leader><C-n>   :MBEbn<CR>
"nnoremap <Leader>p       :MBEbp<CR>
"nnoremap <Leader><C-p>   :MBEbp<CR>
"nnoremap <Leader>c       :new<CR>
"nnoremap <Leader><C-c>   :new<CR>
"nnoremap <Leader>k       :bd<CR>
"nnoremap <Leader><C-k>   :bd<CR>
"nnoremap <Leader>s       :IncBufSwitch<CR>
"nnoremap <Leader><C-s>   :IncBufSwitch<CR>
"nnoremap <Leader><Tab>   :wincmd w<CR>
"nnoremap <Leader>Q       :only<CR>
"nnoremap <Leader>w       :ls<CR>
"nnoremap <Leader><C-w>   :ls<CR>
"nnoremap <Leader>a       :e #<CR>
"nnoremap <Leader><C-a>   :e #<CR>
"nnoremap <Leader>"       :BufExp<CR>
"nnoremap <Leader>1   :e #1<CR>
"nnoremap <Leader>2   :e #2<CR>
"nnoremap <Leader>3   :e #3<CR>
"nnoremap <Leader>4   :e #4<CR>
"nnoremap <Leader>5   :e #5<CR>
"nnoremap <Leader>6   :e #6<CR>
"nnoremap <Leader>7   :e #7<CR>
"nnoremap <Leader>8   :e #8<CR>
"nnoremap <Leader>9   :e #9<CR>

" bufferlist.vim {{{1
map <silent> <f4> :call BufferList()<CR>

" yankring.vim {{{1
let g:yankring_history_dir="$HOME/.tmp"

" smartword.vim {{{1
map w <Plug>(smartword-w)
map b <Plug>(smartword-b)
map e <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

"" neocomplcache conf {{{1
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 0
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 0
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 5
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \   'default'  : ''
"    \ , 'vimshell' : $HOME.'/.vimshell_hist'
"    \ , 'scheme'   : $HOME.'/.gosh_completions'
"    \ , 'php'      : $HOME.'/.vim/dictionary/PHP.dict'
"    \ }
"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"imap <C-j>     <Plug>(neocomplcache_snippets_jump)
"smap <C-j>     <Plug>(neocomplcache_snippets_jump)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"let g:neocomplcache_omni_patterns = {}
"endif
""let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"" --- end neocomplcache

" twitvim {{{1
"let twitvim_login_b64=""
"let twitvim_count=80

" SCIMではダメらしい {{{1
"nnoremap <silent> i <esc>:<c-u>set imi=2<cr>i
"inoremap <silent> <esc> <esc>:set imi=0<cr>
"inoremap <silent> <c-[> <esc>:set imi=0<cr>

" normal modeに切り替える際にIM Off. SCIM連動
"inoremap <silent> <esc> <esc>:call ForceImOff()<cr>
"inoremap <silent> <c-[> <esc>:call ForceImOff()<cr>
"function! ForceImOff()
"	let imoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
"endfunction


"hi Folded ctermbg=black ctermfg=darkgray
"hi Visual ctermbg=black ctermfg=darkcyan
""" 選択肢
"hi Pmenu ctermbg=lightgray ctermfg=black
""" 選択部
"hi PmenuSel ctermbg=red ctermfg=black
"hi PmenuSbar
"hi PmenuThumb

" syntastic
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["java"] }

let g:syntastic_cpp_checkers = ['clang_check']

" agda-vim {{{1
"let g:agda_extraincpaths = ["/Users/ruicc/Works/agda/agda-stdlib/src"]
"let maplocalleader = ","

" vim-clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++17",
            \ "BreakBeforeBraces" : "Stroustrup"}

