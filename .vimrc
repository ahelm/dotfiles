" ------------------------------
" .vimrc for MacBook 13inch 2015
" ------------------------------

"" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'Yggdroot/indentLine'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
call plug#end()

"" General settings
let g:mapleader='\'         			            " use ',' as leader
set autoread                                	" reload changed buffer
au FocusGained,BufEnter   * :checktime      	" update at change of focus
set tabstop=2       				                  " number of visual spaces per TAB
set softtabstop=2   				                  " number of spaces in tab when editing
set shiftwidth=2    				                  " number of spaces to use for indent
set expandtab       				                  " tabs are spaces
set autoindent      				                  " automatically ident
set ignorecase                                " case of normal letter is ignored
set smartcase                                 " ignore case when lowercase letters only
set incsearch                                 " search as characters are entered
set hlsearch                                  " highlight matches
set hidden                                    " TextEdit might fail if hidden is not set
set signcolumn=yes                            " 
set nowrap                                    " Do not wrap lines


"" Keyboard shortcuts
" Saving and Quiting
noremap  <leader>w  :update<CR>
vnoremap <leader>w  <C-C>:update<CR>
inoremap <leader>w  <C-O>:update<CR>
nnoremap <leader>q  :bd<CR>
noremap  <leader>Q  :qa<CR>
" Tabs
nnoremap <leader>n  :bprevious<CR>
nnoremap <leader>m  :bnext<CR>
inoremap <leader>n  <Esc>:bprevious<CR>i
inoremap <leader>m  <Esc>:bnext<CR>i
" Window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Searching
nnoremap <space>          /
nnoremap <leader><space> :nohlsearch<CR>
" FZF bindings
noremap  <C-F>  :Files<CR>
noremap  <C-G>  :GFiles<CR>
noremap  <C-T>  :Tags<CR>
noremap  <C-B>  :BTags<CR>
" unbind `Q` to enter in ex mode
map Q <Nop>

"" Styling
syntax on                   " use syntax highlighting
color dracula               " best Colorscheme ever
set number                  " show line numbers
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{()}]
filetype indent plugin on   " automatic lang-dependent ident
set mouse=a                 " allow mouse usage
set clipboard+=unnamedplus  " using system clipboard on mac
set termguicolors	    " use guicolors in iTerm

"" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
" remove default option from right side -> less information
let g:airline_section_z = '%4l/%L:%3v'

"" Python settings
let g:python_highlight_all = 1

"" Coc settings
autocmd FileType json syntax match Comment +\/\/.\+$+
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Completion selection - use tab and shift+tab
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"" coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"" coc-explorer
nmap <C-N> :CocCommand explorer<CR>

"" IndentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#424450'

"" FZF settings
" Removes any additional space from generation of tags
let g:fzf_tags_command = 
      \'ctags -R ' .
      \'--exclude=.mypy_cache ' .
      \'--exclude=.git ' .
      \'--exclude=.venv ' .
      \'--exclude=.tox ' . 
      \'--exclude=docs ' . 
      \'--exclude=.vscode ' .
      \'--exclude=.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded' } }
