" The Following is copied from $VIMRUNTIME/vimrc_example.vim
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
if filereadable("$VIMRUNTIME/defaults.vim")
  source $VIMRUNTIME/defaults.vim
endif

if isdirectory($HOME . '/.vim/swapfiles')
  set directory=~/.vim/swapfiles
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  if isdirectory($HOME . '/.vim/backupdir')
    set backup		" keep a backup file (restore to previous version)
    set backupdir=~/.vim/backupdir
  endif
  if has('persistent_undo')
    if isdirectory($HOME . '/.vim/undodir')
      set undofile	" keep an undo file (undo changes after closing)
      set undodir=~/.vim/undodir " Specify the directory for undo files
    endif
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" See https://shapeshed.com/vim-packages/ For packages info
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" END COPY $VIMRUNTIME/vimrc_example.vim

set nocompatible              " be iMproved, required
filetype off                  " required

if isdirectory($HOME . '/.vim/bundle/Vundle.vim')
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " Git plugin not hosted on GitHub
  Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}
  "
  Plugin 'posva/vim-vue'

  " NerdTree
  Plugin 'scrooloose/nerdtree'

  " Syntastic
  Plugin 'vim-syntastic/syntastic'

  " Omni Complete Automatic Popup
  Plugin 'vim-scripts/AutoComplPop'

  " vim-go 
  Plugin 'fatih/vim-go'

  " Vim Airline
  Plugin 'vim-airline/vim-airline'
  " Plugin 'vim-airline/vim-airline-themes'

  Plugin 'airblade/vim-gitgutter'

  "CtrlP
  Plugin 'kien/ctrlp.vim'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on

  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

  " see :h vundle for more details or wiki for FAQ
endif

" Put your non-Plugin stuff after this line

" Abbreviations
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

syntax enable
set t_Co=256
set expandtab
set shiftwidth=2
set smartindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set laststatus=2
set colorcolumn=120
set autowrite

" Relative and Absolute Line Numbers
set relativenumber
nnoremap <F5> :set relativenumber!<CR>:set number!<CR>

if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all java files set 'textwidth' to 120 characters.
  autocmd FileType java setlocal textwidth=120

  augroup END

  " Toggle line number types depending on events
  " This does not work as expected 
  " augroup numbertoggle
   " autocmd!
   " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
   " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  " augroup END

endif " has("autocmd")

" Split Right and Below
set splitright
set splitbelow

" Tell vim I'm writing on a dark background
"set background=dark

" Don't wrap lines longer than the view
set nowrap

" This specifies where in Insert mode the <BS> is allowed to delete the
" character in front of the cursor.  The three items, separated by commas, tell
" Vim to delete the white space at the start of the line, a line break and the
" character before where Insert mode started.
set backspace=indent,eol,start

" This makes Vim use the indent of the previous line for a newly created line.
" Thus there is the same amount of white space before the new line.  For example
" when pressing <Enter> in Insert mode, and when using the "o" command to open a
" new line.
set autoindent

" Always display the current cursor position in the lower right corner of the
" Vim window.
set ruler

"Display an incomplete command in the lower right corner of the Vim window,
"left of the ruler.  For example, when you type "2f", Vim is waiting for you to
"type the character to find and "2f" is displayed.  When you press "w" next,
"the "2fw" command is executed and the displayed "2f" is removed.
set showcmd

" Tab size 2 spaces
set tabstop=2
"set shiftwidth=1

" Onmi Completion
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Map Ctrl-Backspace to delete the previous word in insert mode.
" Doesn't work right now, figure out why http://vim.wikia.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
" map <C-BS> <C-W>
" noremap! <C-BS> <C-w>
" noremap! <C-h> <C-w>
" inoremap <C-w> <C-\><C-o>dB
" inoremap <C-BS> <C-\><C-o>db

" Command t
let g:CommandTMaxFiles=200000
set wildignore=*.class,*.jar,*.gif,*.png,*.jpg

" Vuejs filetype
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" Leader Key
map <space> <Leader>

" Make buffers Hidden
set hidden

" Show all tabs and trailing whitespace
set list
"set listchars=tab:>-,trail:-

" Navigate split buffers with C-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" NERDTree
if exists(":NERDTreeToggle")
  map <C-n> :NERDTreeToggle<CR>
  " Uncomment to close vim when all open buffers are closed
  "   (even if NERDTree is open)
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" Syntastic
if exists(":SyntasticInfo")
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  " let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  " Syntastic checker configuration 
  let g:syntastic_java_checkers = ["javac", "checkstyle"]
  let g:syntastic_javascript_checkers= ["eslint"]
  let g:syntastic_go_checkers= ["golint"]
  let g:syntastic_sql_checkers= ["sqlint"]
  let g:syntastic_html_checkers=["eslint"]
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_id_checkers = 0
endif

" Ctrl P
if exists(":CtrlP")
  nnoremap \p :CtrlP<CR>
  let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/]\.(git|hg|svn)$|.*/(target|node_modules|node)$',
     \ 'file': '\v\.(exe|so|dll|class|jar|png|jpg|gif)$',
     \ }
     "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',

  let g:ctrlp_max_files=0
  let g:ctrlp_max_depth=40
endif

" vim-go
if exists(":GoBuild")
  map <C-n> :cnext<CR>
  map <C-m> :cprevious<CR>
  nnoremap <leader>a :cclose<CR>

  " run :GoBuild or :GoTestCompile based on the go file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0,1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction

  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

  " Set all error lists to be quickfix
  " let g:go_list_type = 'quickfix'
  "
  " Set :GoTest timeout value
  " let g:go_test_timeout = '10s'
endif
