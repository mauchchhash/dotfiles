" My neovim configuration
" TIPS::
" :help checkhealth
"""""""""""""""""""""""""""""""""""""""""""""""""""
" "syntax enable
"filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.nvim/script.vim
let mapleader = ","
set tabstop=4                    " a tab is four spaces
set softtabstop=4                " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                    " expand tabs by default (overloadable per file type later)
set shiftwidth=4                 " number of spaces to use for autoindenting
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set tags=tags
set relativenumber number
set ignorecase                   " ignore case when searching
set smartcase                    " ignore case if search pattern is all lowercase,
set autowrite                    " save on buffer switch
set hidden                       " save the undo history when buffer change
set splitbelow
set splitright
set cursorline
" set autoindent                  " always set autoindenting on
" set copyindent                  " copy the previous indentation on autoindenting
"""""""""""""""""""""""""""""""""""""""""""""""""""
"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"""""""""""""""""""""""""""""""""""""""""""""""""""
" todo: neomake,
nnoremap <leader>n :nohlsearch<cr>
nnoremap <Leader>vr :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>td :e todos.text<CR>
inoremap <C-l> <Esc>A
inoremap ;; <Esc>A;
inoremap ;w <Esc>A;<Esc>:w<cr>
inoremap ,, <Esc>A,
nnoremap ( :bp<cr>
nnoremap ) :bn<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>
inoremap <leader>w <Esc>:w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap ' `
nnoremap ` '
tnoremap <Esc> <C-\><C-n>
" autocmd BufEnter * silent! normal! g`"
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Laravel Mappings
nnoremap <leader>la :!php artisan 
nnoremap <leader>lm :!php artisan make:
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags stuff
" for list off ctags supported languages run: ctags --list-languages
" ab ct !ctags -R --exclude=vendor --exclude=.git --exclude=public/forum/ --languages=PHP,Java<cr>
" ab ct !ctags -R --exclude=.git --languages=PHP,Java<cr>
" ab ct !ctags -R<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.nvim/plugged')

" Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-line'
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'jwalton512/vim-blade', { 'for': 'php' }
Plug 'osyo-manga/vim-over'
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'janko/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'Olical/vim-enmasse'
Plug 'Valloric/MatchTagAlways'
Plug 'mbbill/undotree'
Plug 'henrik/vim-indexed-search'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/sideways.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'FooSoft/vim-argwrap'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""
" color settings
" set background=dark
" colorscheme solarized
colorscheme dracula
"""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree stuff
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
nnoremap <Leader>vp :cd ~/code/socio<cr>:NERDTreeToggle<cr>
let NERDTreeShowHidden=1
"""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Stuff
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
" nnoremap <C-/> :CtrlPBuffer<cr>
" set wildignore+=*/public/forum/**

let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'min:1,max:10,results:10'
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-php-namespace stuff
" Automatically adds the corresponding use statement for the name under the cursor.
function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>
" Expands the name under the cursor to its fully qualified name.
function! IPhpExpandClass()
  call PhpExpandClass()
  call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pe <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pe :call PhpExpandClass()<CR>
"Sort existing use statements alphabetically
autocmd FileType php inoremap <Leader>ps <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>ps :call PhpSortUse()<CR>
let g:php_namespace_sort_after_insert = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim blade stuff
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-over stuff
let g:over#command_line#enable_import_commandline_map = 0
nnoremap <leader>s :OverCommandLine<cr>%s/
vnoremap <leader>s :OverCommandLine<cr>s/
"""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete stuff
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000
"""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun stuff
nnoremap <Leader>ct :bufdo e<cr>:NERDTreeRefreshRoot<cr>:CtrlPClearCache<cr>:AsyncRun ctags -R --exclude=node_modules<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline stuff
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_theme='night_owl'
let g:airline_theme='simple'
" let g:airline_statusline_ontop=1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar stuff
nnoremap <silent> <Leader>e :TagbarToggle<CR>
" ab T TagbarToggle<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet stuff
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
ab snpath NERDTree ~/.nvim/plugged/neosnippet-snippets/neosnippets/personal
let g:neosnippet#snippets_directory = "~/.nvim/plugged/neosnippet-snippets/neosnippets/personal"
" which disables all runtime snippets
let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-test stuff
" make test commands execute using dispatch.vim
" let test#strategy = "neovim"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Easy Align stuff
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive stuff
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gm :Git checkout master<cr>
nnoremap <leader>gb :Git branch<cr>
nnoremap <leader>gx :Git branch -d 
nnoremap <leader>gn :Git checkout -b 
nnoremap <leader>gc :Git checkout 
nnoremap <leader>gt :Gcommit -m '
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gM :Git merge 
nnoremap <leader>g. :Git add .<cr>
nnoremap <leader>gp :Git push<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine stuff
let g:indentLine_char = '┊'
""""""""""""""""""""""""""""""""""""""""""""""""""
" greplace stuff
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
""""""""""""""""""""""""""""""""""""""""""""""""
" c++ stuff
autocmd FileType cpp nnoremap <Leader>tn :tab split<cr>:terminal g++ -std=c++11 % -o %.out && ./%.out<cr>i
"""""""""""""""""""""""""""""""""""""""""""""""""""
" js stuff
autocmd FileType javascript nnoremap <Leader>tn :tab split<cr>:terminal node %<cr>i
"""""""""""""""""""""""""""""""""""""""""""""""""""
" highlightedyank stuff
let g:highlightedyank_highlight_duration = 100
