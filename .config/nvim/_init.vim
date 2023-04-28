"*******************************************************************************
" table of comtents
"
" >vimplug#common< : 'vim-plug' common packages
" >vimplug#lang< : 'vim-plug' packages for languages
"
" >conf4basic< : neovim basic config
" >conf4visual< : neovim visual config
" >conf4integration< : neovim integration config
" >conf4ack< : config for 'ack.vim'
" >conf4ale< : config for 'ale'
" >conf4cocnvim< : config for 'coc.nvim'
" >conf4fzf< : config for 'fzf'
" >conf4rainbow< : config for 'rainbow'
" >conf4ultisnips< : config for 'ultisnips'
" >conf4vimairline< : config for 'vim-airline'
" >conf4vimindentguides< : config for 'vim-indent-guides'
"
"*******************************************************************************

call plug#begin('~/.local/share/nvim/plugged')

"*******************************************************************************
" >vimplug#common< : common packages
"*******************************************************************************

Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
if !exists('g:vscode')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'itchyny/lightline.vim'
  " Plug 'kassio/neoterm'
  Plug 'luochen1990/rainbow'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'thinca/vim-quickrun', {'tag' : '*'}
endif

" for colorschema
if !exists('g:vscode')
  Plug 'altercation/vim-colors-solarized'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'tomasr/molokai'
endif

if !exists('g:vscode')
  Plug 'github/copilot.vim'
endif

" fzf
if !exists('g:vscode')
  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf'
  else
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  endif
  Plug 'junegunn/fzf.vim'
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
endif

" snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if !exists('g:vscode')
  Plug 'ryanoasis/vim-devicons'
endif

" vim-rhubarb
if !exists('g:vscode')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb' " depends on 'vim-fugitive'
endif

"*******************************************************************************
" >vimplug#lang< : install packages for languages
"*******************************************************************************

" for html5
Plug 'othree/html5.vim'

" for docker
Plug 'ekalinin/Dockerfile.vim'

" for Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'mattreduce/vim-mix'

" for java
Plug 'tfnico/vim-gradle', { 'for': 'groovy' }

" for javascript
"Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'jamestthompson3/vim-jest', { 'for': ['javascript', 'javascript.jsx'] }

" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
" Plug 'flowtype/vim-flow'

" for golang

" for gitignore
Plug 'gisphm/vim-gitignore'


" for protobuf (buf)
Plug 'bufbuild/vim-buf'

" for ruby
Plug 'thoughtbot/vim-rspec'

" for terraform
Plug 'hashivim/vim-terraform'

"*******************************************************************************
" >vimplug#end< : end of vim-plug
"*******************************************************************************
"
call plug#end()

"*******************************************************************************
" >conf4basic< : nvim basic config
"*******************************************************************************

let mapleader=','
set nu
set fileencoding=utf-8

set nofoldenable

set autoread
set hidden
set showcmd
set swapfile

" 見た目系
set cursorline
set smartindent
set showmatch
set laststatus=2
set showtabline=2

" Tab 系
set list listchars=tab:>-,trail:-,eol:↲
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set wildmode=list:full
set history=1000
set complete+=k

" 検索系
set ignorecase
set smartcase
set noignorecase
set incsearch
set wrapscan
set hlsearch

set termguicolors

" quickfix
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

augroup MyFzfCommands
  command! VimConfig edit ~/.config/nvim/init.vim
augroup END

syntax enable
let g:tokyonight_style = 'night'
set background=dark
" colorscheme molokai
colorscheme  tokyonight

"*******************************************************************************
" >conf4integration< : neovim integration config
"*******************************************************************************

" integrate node
let g:node_host_prog = '/Users/takashi.asaba/.anyenv/envs/nodenv/versions/14.15.1/bin/neovim-node-host'

" integrate Python
let g:python_host_prog = '/Users/takashi.asaba/.anyenv/envs/pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '/Users/takashi.asaba/.anyenv/envs/pyenv/versions/py3neovim/bin/python'

" integrate Ruby
let g:ruby_host_prog = '/Users/takashi.asaba/.anyenv/envs/rbenv/versions/3.2.2/bin/neovim-ruby-host'

"*******************************************************************************
" >conf4ack< : config for 'ack.vim'
"*******************************************************************************

let g:ackprg = 'ag --nogroup --nocolor --column'

"*******************************************************************************
" >conf4ale< : config for 'ale'
"*******************************************************************************

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_line_on_enter = 0
"let g:ale_javascript_flow_use_respect_pragma = 0

let g:ale_linters = {
  \"javascript": [],
  \"go": [],
  \"proto": ["buf-check-lint"],
  \}
let g:ale_fixers = {
  \'javascript': [],
  \"go": [],
  \}

let g:ale_javascript_prettier_use_local_config = 1

"*******************************************************************************
" >conf4cocnvim< : config for 'coc.nvim'
"*******************************************************************************
"
"" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" for completion
inoremap <slient><expr> <D-space> coc#refresh()

nmap <leader>df <Plug>(coc-definition)
nmap <leader>td <Plug>(coc-type-definition)
nmap <leader>im <Plug>(coc-implementation)
nmap <leader>rf <Plug>(coc-references)
nmap <leader>dc <Plug>(coc-declaration)

nmap <leader>dn <Plug>(coc-diagnostic-next)
nmap <leader>dp <Plug>(coc-diagnostic-prev)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>fmt <Plug>(coc-format)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <leader>cc :<C-u>CocFzfList commands<CR>
nmap <leader>ld :<C-u>CocFzfList diagnostics<CR>
nmap <leader>lo :<C-u>CocFzfList outline<CR>
nmap <leader>ls :<C-u>CocFzfList symbols<CR>

nnoremap <silent>K :call <SID>show_documentation()<CR>

" for coc-snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

nmap <space>e :CocCommand explorer<cr>

" imap <slient><script><expr> <C-n> copilot#Accept("\<CR>")

" Add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')


"*******************************************************************************
" >conf4fzf< : config for 'fzf'
"*******************************************************************************

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>cmd :Commands<CR>
nnoremap <leader>S :Ag

augroup MyFzfCommands
  command! VimConfig edit ~/.config/nvim/init.vim

  autocmd!
  autocmd FileType javascript setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab
augroup END

"*******************************************************************************
" >conf4rainbow< : config for 'rainbow'
"*******************************************************************************

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
\	'guifgs': ['skyblue', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\	}
\}

"*******************************************************************************
" >conf4toggleterm< : config for 'toggleterm'
"*******************************************************************************
lua require("toggleterm").setup()

"*******************************************************************************
" >conf4ultisnips< : config for 'ultisnips'
"*******************************************************************************

" use coc.nvim
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<e-tab>"
"let g:UltiSnapsSnippetDirectories=[$HOME."/.local/share/nvim/snippets"]

"*******************************************************************************
" >conf4vimairline< : config for 'vim-airline'
"*******************************************************************************

if !has('gui_running')
  set t_Co=256
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

"*******************************************************************************
" >conf4vimindentguides< : config for 'vim-indent-guides'
"*******************************************************************************

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1

augroup MyIndentGuidesAutoCmd
  let g:indent_guides_auto_colors = 0

  autocmd!
  autocmd! VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 guifg=#5f5f5f ctermbg=235 ctermfg=59
  autocmd! VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 guifg=#5f5f5f ctermbg=236 ctermfg=59
augroup END

"*******************************************************************************
" >conf4vim-rspec< : config for 'vim-terraform'
"*******************************************************************************

nmap <leader>rcs :RunCurrentSpecFile()<CR>
nmap <leader>rns :RunNearestSpec()<CR>
nmap <leader>rls :RunLastSpec()<CR>
"
"*******************************************************************************
" >conf4vim-terraform< : config for 'vim-terraform'
"*******************************************************************************
"
let g:terraform_fmt_on_save=1