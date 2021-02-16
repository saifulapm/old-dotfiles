" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" Max Cantor's .vimrc File
" "zo" to open folds, "zc" to close, "zn" to disable.

" {{{ Plugins and Settings

" Vim Plug is used to handle plugins

" {{{ VIM-PLUG SETUP

set nocompatible
call plug#begin('~/.vim/plugged')

" }}}


" <PLUGINS>

" {{{ ColorSchemes
"     ====================

Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

" }}}

" {{{ Syntax Highliting
"     =================

Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['sensible']

" }}}

" {{{ Coc.nvim (Code Complition)

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" }}}

" {{{ Lightline

Plug 'itchyny/lightline.vim'

" }}}

" {{{ Vim Liquid Syntax

Plug 'tpope/vim-liquid'

" }}}

" {{{ Vim Surround

Plug 'tpope/vim-surround'

" }}}

" {{{ Vim FullScreen
"     ==============

Plug 'lambdalisue/vim-fullscreen'

" Normal Mapping (Command + Enter)
nnoremap <silent><D-cr> :FullscreenToggle<cr>

" }}}

" {{{ NERDTree
"     ========

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }

" Get rid of objects in C projects
let NERDTreeIgnore=['\~$', '.o$', 'bower_components', 'node_modules', '__pycache__']
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
cnoreabbrev NT NERDTreeToggle<cr>
cnoreabbrev nt NERDTreeToggle<cr>
cnoreabbrev nf NERDTreeFind<cr>
cnoreabbrev NF NERDTreeFind<cr>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" }}}

" {{{ Fzf.vim

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" }}}

" {{{ Yankstack

Plug 'maxbrunsfeld/vim-yankstack'

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

" }}}

" {{{ netrw: Configuration
"     ====================

let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" hide gitignore'd files
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default (this is the string toggled by netrw-gh)
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" }}}

" {{{ Vim GOYO

Plug 'junegunn/goyo.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>

" }}}

" {{{ Vim Multiple Cursors

Plug 'terryma/vim-multiple-cursors'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" }}}

" {{{ Ack Vim

Plug 'mileszs/ack.vim'

if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'                                                   
endif
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
" cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" }}}

" {{{ Tlib: Some utility functions

Plug 'vim-scripts/tlib'

" }}}

" {{{ Tpope Commentary

Plug 'tpope/vim-commentary'

" }}}

" {{{ For Snippets

Plug 'sirver/ultisnips'

let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim"
let g:UltiSnipsSnippetDirectories=["myUltiSnippets"]

" }}}

" {{{ 'Vim-tmux-navigator'

Plug 'christoomey/vim-tmux-navigator'

" }}}

" {{{ Tagbar vim

Plug 'preservim/tagbar'

" }}}

" {{{ Vim Git Plugin

Plug 'tpope/vim-fugitive'

" }}}

" {{{ Vim Wiki

Plug 'vimwiki/vimwiki'

" }}}

" </PLUGINS>


" {{{ VIM-PLUG TEARDOWN

call plug#end()

" }}}


" }}}

" {{{ Basic Settings


" {{{ Autocompletion on Vim

filetype plugin on
" au FileType php setl ofu=phpcomplete#CompletePHP
" au FileType ruby,eruby setl ofu=rubycomplete#Complete
" au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
" au FileType css setl ofu=csscomplete#CompleteCSS

" " Remove Preview
" set completeopt-=preview

" }}}

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Modelines
set modelines=2
set modeline

" For clever completion with the :find command
set path+=**

" Always use bash syntax for sh filetype
let g:is_bash=1


" Search
set ignorecase smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

set grepprg=grep\ -IrsnH

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Window display
set showcmd ruler laststatus=2

" Splits
set splitright

" Buffers
set history=500
if exists("&undofile")
    set undofile
endif

" Spelling
set dictionary+=/usr/share/dict/words thesaurus+=$HOME/.thesaurus

" Text display
set list                      " display unprintable characters f12 - switches
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«

" Typing behavior
set backspace=indent,eol,start

" Automatically wrap left and right [https://vim.fandom.com/wiki/Automatically_wrap_left_and_right]
set whichwrap+=<,>,h,l,[,]
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=2

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


set wildmode=full
set wildmenu
set complete-=i

" Formatting
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set foldlevelstart=0

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

set nrformats-=octal

" Session saving
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" Word splitting
set iskeyword+=-

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" A buffer becomes hidden when it is abandoned
set hid

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab


" {{{ Syntax Hilighting

" Syntax hilighting
syntax enable
" Colorscheme
set t_Co=256
set cursorline

colorscheme nord
" set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

hi FoldColumn guifg=bg guibg=bg
hi VertSplit guibg=bg guifg=#5c6370

" }}}

" {{{ Status Line 

" set statusline=%<%f\          " custom statusline
" set stl+=[%{&ff}]             " show fileformat
" set stl+=%y%m%r%=
" set stl+=%-14.(%l,%c%V%)\ %P
if has("gui_running")

    let g:lightline = {
        \ 'colorscheme': 'nord',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             ['cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \ },
        \ }

else

    let g:lightline = {
        \ 'colorscheme': 'nord',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
        \ }

endif

" }}}

" {{{ Gui Vim Setup

if has("gui_running")

" Set extra options when running in GUI mode
set guioptions-=T
set guioptions-=e

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set t_Co=256

set lines=40 columns=162
set guifont=Dank\ Mono:h18
set macligatures


" Font Big / Small 
command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')

endif

" }}}

" {{{ Coc.nvim Setup

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <Leader><space>r coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references<Leader><space> when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <Leader><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader><space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader><space>p  :<C-u>CocListResume<CR>

cnoreabbrev dd call CocAction('diagnosticToggle')<cr>

" }}}

"}}}

" Backups editing {{{

" Some servers have issues with backup files, see #649.

set directory=$HOME/.backups/swaps,$HOME/.backups,$HOME/tmp,.
set backupdir=$HOME/.backups/backups,$HOME/.backups,$HOME/tmp,.
if exists("&undodir")
	set undodir=$HOME/.backups/undofiles,$HOME/.backups,$HOME/tmp,.
endif

" }}}

" Key Mappings {{{

" Editing vimrc
nnoremap ,v :source $MYVIMRC<CR>
nnoremap ,e :edit $MYVIMRC<CR>

" Clipboard Settings
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Change indent continuously
vmap < <gv
vmap > >gv

" Select the stuff I just pasted
nnoremap gV `[V`]

" Newlines
nnoremap <C-i> o<ESC>k
nnoremap <C-o> O<ESC>j

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easy Comand Mode
noremap <Leader>, :

" Easy quickfix navigation
" nnoremap <C-n> :cn<CR>
" nnoremap <C-p> :cp<CR>

" NerdTree Key Mapping
noremap <Leader>q :NERDTreeToggle<cr>

" " Fzf Mapping
map <leader>j :Files<cr>
" " Quickly find and open a buffer
map <leader>o :Buffers<cr>
" " Quickly find and open a recently opened file
" map <leader>r :CtrlPMRU<CR>


" Quickly change search hilighting
nnoremap <silent> <Leader>; :set invhlsearch<CR>

" Movement between tabs OR buffers
"
nnoremap <silent> <Leader>l :call MyNext()<CR>
nnoremap <silent> <Leader>h :call MyPrev()<CR>

" Resizing split windows
nnoremap ,w :call SwapSplitResizeShortcuts()<CR>

" Easy changing for scrolloff [when scrolling, corsor will be in middle]
nnoremap ,b :call SwapBrowseMode()<CR>

" Wraps visual selection in an HTML tag
vnoremap ,w <ESC>:call VisualHTMLTagWrap()<CR>

" Word processing
nnoremap ,N :call WordProcessingToggle()<CR>

" For Notepad-like handling of wrapped lines
nnoremap ,n :call NotepadLineToggle()<CR>

" Quick function prototype
nnoremap ,f :call QuickFunctionPrototype()<CR>

" Redo last Ex command with bang
nnoremap ,! q:k0ea!<ESC>

" Directory of current file (not pwd)
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Swap tab/space mode
nnoremap ,<TAB> :set et! list!<CR>

" Sane pasting
command! Paste call SmartPaste()

" Open File Under Cursor
" Override vim commands 'gf', '^Wf'
nnoremap gf :call GotoFile("")<CR>
nnoremap <C-W>f :call GotoFile("new")<CR> 

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=1
catch
endtry


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Tagbar Plugin
nmap <F8> :TagbarToggle<CR>

" }}}

" Custom Functions {{{

" MyNext() and MyPrev(): Movement between tabs OR buffers {{{
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction
" }}}

" SwapSplitResizeShortcuts(): Resizing split windows {{{
if !exists( 'g:resizeshortcuts' )
    let g:resizeshortcuts = 'horizontal'
    nnoremap _ <C-w>-
    nnoremap + <C-w>+
endif

function! SwapSplitResizeShortcuts()
    if g:resizeshortcuts == 'horizontal'
        let g:resizeshortcuts = 'vertical'
        nnoremap _ <C-w><
        nnoremap + <C-w>>
        echo "Vertical split-resizing shortcut mode."
    else
        let g:resizeshortcuts = 'horizontal'
        nnoremap _ <C-w>-
        nnoremap + <C-w>+
        echo "Horizontal split-resizing shortcut mode."
    endif
endfunction
" }}}

" SwapBrowseMode(): Easy changing for scrolloff {{{
if !exists( 'g:browsemode' )
    let g:browsemode = 'nobrowse'
    set sidescrolloff=0
    set scrolloff=0
endif

function! SwapBrowseMode()
    if g:browsemode == 'nobrowse'
        let g:browsemode = 'browse'
        set sidescrolloff=999
        set scrolloff=999
        echo "Browse mode enabled."
    else
        let g:browsemode = 'nobrowse'
        set sidescrolloff=0
        set scrolloff=0
        echo "Browse mode disabled."
    endif
endfunction
" }}}

" VisualHTMLTagWrap(): Wraps visual selection in an HTML tag {{{
function! VisualHTMLTagWrap()
    let html_tag = input( "html_tag to wrap block: ")
    let jumpright = 2 + strlen( html_tag )
    normal `<
    let init_line = line( "." )
    exe "normal i<".html_tag.">"
    normal `>
    let end_line = line( "." )
    " Don't jump if we're on a new line
    if( init_line == end_line )
        " Jump right to compensate for the characters we've added
        exe "normal ".jumpright."l"
    endif
    exe "normal a</".html_tag.">"
endfunction
" }}}

" WordProcessingToggle() {{{
function! WordProcessingToggle()
    if !exists('b:wordprocessing') || (b:wordprocessing == 'false')
        let b:wordprocessing = 'true'
        setlocal wrap linebreak nolist
        setlocal textwidth=0
        echo "Word processing mode enabled."
    else
        let b:wordprocessing = 'false'
        setlocal nowrap nolinebreak list
        setlocal textwidth=80
        echo "Word processing mode disabled."
    endif
endfunction
" }}}

" NotepadLineToggle(): For Notepad-like handling of wrapped lines {{{
function! NotepadLineToggle()
    if !exists('b:notepadlines') || (b:notepadlines == 'false')
        nnoremap <buffer> j gj
        nnoremap <buffer> k gk
        let b:notepadlines = 'true'
        setlocal wrap
        echo "Notepad wrapped lines enabled."
    else
        unmap <buffer> j
        unmap <buffer> k
        let b:notepadlines = 'false'
        setlocal nowrap
        echo "Notepad wrapped lines disabled."
    endif
endfunction
" }}}

" QuickFunctionPrototype(): Quickly generate a function prototype. {{{
function! QuickFunctionPrototype()
    let function_name = input( "function name: ")
    if &ft == "php"
        " The extra a\<BS> startinsert! is because this function drops
        " out of insert mode when it finishes running, and startinsert
        " ignores auto-indenting.
        exe "normal ofunction ".function_name."(){\<CR>}\<ESC>Oa\<BS>"
        startinsert!
    else
        echo "Filetype not supported."
    endif
endfunction
" }}}

" {{{ Sane Pasting

function! SmartPaste()
    setl paste
    normal "+p
    setl nopaste
endfunction

" }}}

" {{{ Open File Under Cursor

function! GotoFile(w)
    let curword = expand("<cfile>")
    if (strlen(curword) == 0)
        return
    endif
    let matchstart = match(curword, ':\d\+$')
    if matchstart > 0
        let pos = '+' . strpart(curword, matchstart+1)
        let fname = strpart(curword, 0, matchstart)
    else
        let pos = ""
        let fname = curword
    endif
 
    " check exists file.
    if filereadable(fname)
        let fullname = fname
    else
        " try find file with prefix by working directory
        let fullname = getcwd() . '/' . fname
        if ! filereadable(fullname)
            " the last try, using current directory based on file opened.
            let fullname = expand('%:h') . '/' . fname
        endif
    endif

   " Open new window if requested
    if a:w == "new"
        new
    endif
    " Use 'find' so path is searched like 'gf' would
    execute 'find ' . pos . ' ' . fname
endfunction

" }}}

" {{{ JSDoc Functuon https://github.com/jordwalke/VimJSDocSnippets/blob/master/plugin/JSDocSnippets.vim

function! JSDocSnippetForLineBelow()
  " if strpart(getline('.'), col('.') - 2, 1) == "\n"
    let l    = line('.') + 1
    " let i    = indent(l)
    " let pre  = repeat(' ',i)
    let placeHolderCount = 1
    let text = getline(l)
    let params   = matchstr(text,'([^)]*)')
    let funcPat = 'function\|=>'
    let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
    let funcMatch = matchstr(text, funcPat)
    " echomsg params
    if funcMatch == "function" || funcMatch == "=>"
      let vars = []
      let m    = ' '
      let ml = matchlist(params,paramPat)
      while ml!=[]
        let [_,var;rest]= ml
        let vars += [' * @param {${'.placeHolderCount.':varType}} '.var.' ${'.(placeHolderCount+1).':Description}']
        let placeHolderCount = placeHolderCount+2
        let ml = matchlist(rest,paramPat,0)
      endwhile

      let beforeReturn = join(['/**'] + vars, "\n")
      let retLine = "\n * ${".placeHolderCount.":@return {${".(placeHolderCount+1).":void}} ${".(placeHolderCount+2).":description}}\n"
      let comment = beforeReturn.retLine." */"
      " echoerr join(comment, "_")
      return comment
    else
      return "/**\n * $0\n */"
    endif
    " call append(l-1,comment)
    " call cursor(l+1,i+3)
  " else
  "   return '/**'
  " endif
endfunction


" }}}

" }}}

" {{{ Auto Commands


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto generate tags file on file write of *.c and *.h files
" autocmd BufWritePost *.c,*.h silent! !ctags . &

" }}}

" {{{ Filtype Specific Settings

" {{{ Javascript

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

" Js Doc Generator
au FileType javascript inoremap <silent> <C-d> {<C-R>=UltiSnips#Anon(JSDocSnippetForLineBelow(), '{')<cr>

" Javascript Speficic Folding
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

" }}}

" }}}

