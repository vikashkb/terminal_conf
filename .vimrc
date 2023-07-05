" STEPS
" Run the following command after placing the vimrc file.
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" After that start vim and run
" :PluginInstall
" And you are good to go!
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
" Plugin 'Lokaltog/powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
" Plugin 'bling/vim-bufferline'
" Plugin 'HTML-AutoCloseTag'
" Plugin 'scrooloose/nerdtree'
" Plugin 'tpope/vim-vinegar'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
"Plugin 'edkolev/tmuxline.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible

set smartindent
autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
"highlight RedundantWhitespace ctermbg=red guibg=red
"match RedundantWhitespace /\s\+$\| \+\ze\t/
autocmd BufWritePre * :%s/\s\+$//e

set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
set backspace=2
syntax on

" Pertaining to issue from airline
" https://github.com/vim-airline/vim-airline/issues/2524
" Might not be needed
set hidden


" The following line if for highlighting lines greater than 80 columns.
"highlight longline ctermbg=black ctermfg=white guibg=red
"match longline /\%>80v.\+/

"match SpellCap '\%>80v.\+'


colors jellybeans
let g:jellybeans_use_lowcolor_black = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let c_space_errors=1
set t_Co=256
set hlsearch
set lbr
set history=50
set ruler
set number
set cursorline
set title
set scrolloff=3
set sidescroll=1
set sidescrolloff=15
set ignorecase
set incsearch
set smartcase
set wrapscan
set noswapfile
set wildmenu
set confirm
"set fdm=indent
"set foldmethod=syntax
"set foldlevelstart=1   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
set cpoptions+=$

set colorcolumn=80

" donot go to the LALA-LAND
nnoremap Q <nop>


set wildignore=*.bak,*.pyc,*.o,*.ojb,*.a,
            \*.pdf,*.jpg,*.gif,*.png,
            \*.svn,*.git,
            \STATIC,
            \env\*,.venv\


let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_dir_path_mode = 'a'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_cmd='exe "CtrlP".get(["", "Buffer", "MRU"], v:count)'

set laststatus=2
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#fnamemod = ':t'
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = ')'


let delimitMate_expand_cr = 1
augroup mydelimitMate
 au!
 au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
 au FileType tex let b:delimitMate_quotes = ""
 au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
 au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END



" obey even if mistype"
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q
command! Qa qa

 imap jj <ESC>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
let mapleader=" "
" Quickly edit/source .vimrc
 noremap <leader>ve :edit $HOME/.vimrc<CR>
 noremap <leader>vs :source $HOME/.vimrc<CR>
" " Yank(copy) to system clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>w :w<CR>
noremap <leader>wq :w<CR>:bd<CR>
 " Buffers, preferred over tabs now with airline.
" nnoremap <leader>k :bnext<CR>
" nnoremap <leader>j :bprevious<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>n <C-^>
" set linenumber to increase motion by object
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set relativenumber
"" nnoremap <C-w> :q<CR>
 " Bubbling (bracket matching)
 nmap <C-up> [e
 nmap <C-down> ]e
 vmap <C-up> [egv
 vmap <C-down> ]egv
 " Move faster
 map <C-j> <C-d>
 map <C-k> <C-u>
 nnoremap <silent> <Space><Space> @=(foldlevel('.')?'za':"\<Space><Space>")<CR>
 vnoremap <Space><Space> zf
 " Treat wrapped lines as normal lines
 nnoremap j gj
 nnoremap k gk

 vmap <C-c> :s/^/#/g<CR>:nohl<CR><C-l>

nmap <F3> a<C-R>=strftime("`%T`")<CR>
imap <F3> <C-R>=strftime("`%T`")<CR>

autocmd FileType python setlocal formatoptions+=r
autocmd FileType python nmap <F4> O# DOC(sumitj)
autocmd FileType c,c++ setlocal formatoptions+=r
autocmd FileType c,c++ nmap <F4> O// DOC(sumitj)

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell



function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if(argc() == 0)
    au VimEnter * nested :call LoadSession()
endif

nmap <F7> :call MakeSession()<CR>
source ~/.vim/plugin/cscope_maps.vim

"JS plugins
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1
"augroup javascript_folding
"    au!
"    au FileType javascript setlocal foldmethod=syntax
"augroup END

"you complete me pluging
"inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<C-g>u\<CR>"
