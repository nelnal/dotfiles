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
Plug 'dense-analysis/ale', { 'tag': 'v2.3.1'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'kassio/neoterm'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'

" for colorschema
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'

" fzf
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
endif
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" vim-rhubarb
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " depends on 'vim-fugitive'

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
" Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'mattn/vim-goimports'

" for gitignore
Plug 'gisphm/vim-gitignore'


" for protobuf (buf)
Plug 'bufbuild/vim-buf'

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

syntax on

" quickfix
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

augroup MyFzfCommands
  command! VimConfig edit ~/.config/nvim/init.vim
augroup END

colorscheme molokai

"*******************************************************************************
" >conf4integration< : neovim integration config
"*******************************************************************************

" integrate node
let g:node_host_prog = '/home/nelnal/.anyenv/envs/nodenv/versions/12.14.0/bin/neovim-node-host'

" integrate Python
let g:python_host_prog = '/home/nelnal/.anyenv/envs/pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '/home/nelnal/.anyenv/envs/pyenv/versions/py3neovim/bin/python'

" integrate Ruby
let g:ruby_host_prog = '/home/nelnal/.anyenv/envs/rbenv/versions/2.7.1/bin/neovim-ruby-host'

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

" for completion
inoremap <slient><expr> <D-space> coc#refresh()

nmap <leader>df <Plug>(coc-definition)
nmap <leader>td <Plug>(coc-type-definition)
nmap <leader>im <Plug>(coc-implementation)
nmap <leader>rf <Plug>(coc-references)

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
  autocmd! VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#293739 ctermbg=235 ctermfg=59
  autocmd! VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#232526 ctermbg=236 ctermfg=59
augroup END

"*******************************************************************************
" >conf4vim-goimports< : config for 'vim-goimports'
"*******************************************************************************
let g:goimports_simplify = 1
