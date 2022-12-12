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
  set directory=$HOME/.vim/swapfiles
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  if isdirectory($HOME . '/.vim/backupdir')
    set backup		" keep a backup file (restore to previous version)
    set backupdir=$HOME/.vim/backupdir
  endif
  if has('persistent_undo')
    if isdirectory($HOME . '/.vim/undodir')
      set undofile	" keep an undo file (undo changes after closing)
      set undodir=$HOME/.vim/undodir " Specify the directory for undo files
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
  set rtp+=$HOME/.vim/bundle/Vundle.vim
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
  " Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}
  "
  "Plugin 'posva/vim-vue'

  " NerdTree
  Plugin 'nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'

  " Syntastic
  "Plugin 'vim-syntastic/syntastic'

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

  " JSBeautify
  Plugin 'maksimr/vim-jsbeautify'

  " auto-pairs
  Plugin 'jiangmiao/auto-pairs'

  " Rainbow Vim
  Plugin 'luochen1990/rainbow'

  " vim-tern
  Plugin 'ternjs/tern_for_vim'

  " vim-yaml
  Plugin 'yaml.vim'

  " vim-surrond
  Plugin 'tpope/vim-surround'

  " vim-highlightedyank
  Plugin 'machakann/vim-highlightedyank'

  " vim-sneak
  Plugin 'justinmk/vim-sneak'

  " Editorconfig
  Plugin 'editorconfig/editorconfig-vim'

  " Protobufs
  "Bundle 'uarun/vim-protobuf'

  " vim-terraform
  Bundle 'hashivim/vim-terraform'

  " THEMES
  " tender theme
  Plugin 'jacoborus/tender.vim'

  " Easy Motion
  Plugin 'easymotion/vim-easymotion'

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
nnoremap ; :

" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>+ :resize +5<CR>
noremap <Leader>- :resize -5<CR>
noremap <Leader>> :vertical resize +5<CR>
noremap <Leader>< :vertical resize -5<CR>
noremap <Leader>= <C-w>=

syntax enable
set t_Co=256
set noexpandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
set smartindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set laststatus=2
set colorcolumn=120
set autowrite
set wildmenu
set scrolloff=2
set sidescrolloff=5
set confirm "Confirm when closing an unsaved buffer
set formatoptions+=j "Remove comment leaders when combining lines
set history=1000 "Increase Undo History
set lazyredraw " Don't redraw during macros
set foldnestmax=1
set shortmess-=S " Show count on searches

set noerrorbells

nmap <silent> ,/ :nohlsearch<CR>

imap jk <ESC>

" BEGIN: Color Scheme Stuff
set background=dark
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

colorscheme tender
let g:airline_theme = 'tender'

hi clear Folded
hi Comment ctermfg=Grey guifg=Grey
hi Folded gui=bold cterm=bold ctermfg=White guifg=White
hi Visual ctermfg=bg ctermbg=fg guifg=bg guibg=fg
hi goBlock ctermfg=Cyan guifg=Cyan cterm=underline gui=underline
" Cursorline

hi clear CursorLine
hi CursorLine cterm=underline gui=underline

" END: Color Scheme Stuff

" Relative and Absolute Line Numbers
set relativenumber
nnoremap <F5> :set relativenumber!<CR>:set number!<CR>

" Paste Mode
noremap <F7> :set paste!<CR>


if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
      au!

      " For all java files set 'textwidth' to 120 characters.
      autocmd FileType java setlocal textwidth=120
  augroup END

  augroup commenting
      autocmd FileType javascript,java,go nnoremap <buffer> <Leader>/ I//<esc>j
      autocmd FileType javascript,java,go nnoremap <buffer> <Leader>? ^xxj
      autocmd FileType python,sh,yaml     nnoremap <buffer> <Leader>/ I#<esc>j
      autocmd FileType python,sh,yaml     nnoremap <buffer> <Leader>? ^xj
      autocmd FileType vim     nnoremap <buffer> <Leader>/ I"<esc>j
      autocmd FileType vim     nnoremap <buffer> <Leader>? ^xj
  augroup END

  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
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

" Onmi Completion
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"set omnifunc=syntaxcomplete#Complete
"set completeopt=longest,menuone
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
" Cycle through buffers.
nnoremap <A-Tab> :bnext<CR>
nnoremap <A-Tab> :bprevious<CR>
" nnoremap <Tab> :BufExplorerHorizontalSplit<CR>

" Show all tabs and trailing whitespace
" See https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
" set list
map <F6> :set invlist<CR>
set listchars=tab:␉⎵,trail:␠,eol:⏎

" Navigate split buffers with C-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Navigate to mru buffer with C-Tab
map <Leader><Tab> <C-^>

" Navigate to the end and beginning of lines more easily
map E $
map B ^

" NERDTree
" if exists(":NERDTreeToggle")
  map <Leader>n :NERDTreeToggle<CR>

  let NERDTreeShowHidden=1
  " Uncomment to close vim when all open buffers are closed
  "   (even if NERDTree is open)
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"endif

" Syntastic
" if exists(":SyntasticInfo")
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*

"  let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
  " let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 0

  " Syntastic checker configuration
"  let g:syntastic_java_checkers = ["javac", "checkstyle"]
"  let g:syntastic_javascript_checkers= ["eslint"]
"  let g:syntastic_go_checkers= ["golint"]
"  let g:syntastic_sql_checkers= ["sqlint"]
"  let g:syntastic_html_checkers=["eslint"]
"  let g:syntastic_aggregate_errors = 1
"  let g:syntastic_id_checkers = 0
"endif

" Ctrl P
"if exists(":CtrlP")
  nnoremap \p :CtrlP<CR>
  nnoremap <Tab> :CtrlPMRUFiles<CR>
  let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/]\.(git|hg|svn)$|.*/(target|node_modules|node|build)$',
     \ 'file': '\v\.(exe|so|dll|class|jar|png|jpg|gif)$',
     \ }
     "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',

  let g:ctrlp_max_files=0
  let g:ctrlp_max_depth=40
  let g:ctrlp_show_hidden=1
"endif

" vim-go
"if exists(":GoBuild")
  map <C-n> :cnext<CR>
  map <C-m> :cprevious<CR>
  nnoremap <leader>a :cclose<CR>

 " goimports is a replacement for gofmt that adds/removes imports
 " automatically and then runs gofmt
  let g:go_fmt_command = "goimports"
  let g:go_def_mode='gopls'
  "let g:go_info_mode='gopls'

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
  autocmd FileType go nmap <Leader>d :GoDocBrowser
  autocmd FileType go nmap <Leader>f :GoTestFunc<CR>
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  "autocmd FileType go setlocal foldmethod=syntax

 " Automatically call :GoSameIds to match ids under your cursor
  let g:go_auto_sameids = 1
  let g:go_auto_type_info = 1
 " Set go-info delay time (ms)
  set updatetime=100
  let g:go_fmt_experimental = 1

 " Set all error lists to be quickfix
 " let g:go_list_type = 'quickfix'
 "
 " Set :GoTest timeout value
 " let g:go_test_timeout = '10s'

  "let g:go_highlight_array_whitespace_error = 1
  "let g:go_highlight_chan_whitespace_error = 1
  "let g:go_highlight_space_tab_error = 1
  "let g:go_highlight_trailing_whitespace_error = 1
  "let g:go_highlight_build_constraints = 1
  "let g:go_highlight_string_spellcheck = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_parameters = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_format_strings = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_methods = 1
 "endif

" yaml.vim
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/yaml.vim/colors/yaml.vim

" rainbow.vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

let g:gitgutter_git_args=""

"https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" Here is (what should be a one-line) map to help you tell just what syntax
" highlighting groups the item under the cursor actually is:
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" vim-highlightedyank
let g:highlightedyank_highlight_duration=150
