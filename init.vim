call plug#begin()

"*******************************************************************************
" vim-plug : install common packages
"*******************************************************************************

Plug 'dense-analysis/ale', { 'tag': 'v2.3.1'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'

" for colorschema
Plug 'tomasr/molokai'

" fzf
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
endif
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippet'

" vim-rhubarb
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'  " depends on 'vim-fugitive'

" vim-session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'  " depends on 'vim-misc'

" vimproc
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'neovim/node-host', { 'do': 'npm install'}

"*******************************************************************************
" vim-plug : install packages for each languages
"*******************************************************************************

"""" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'carlosgaldino/elixir-snippets'

"""" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}

"""" git
Plug 'gisphm/vim-gitignore'

"""" javascript
"" typescript

"" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

"""" python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

"""" rust
" Vim racer
Plug 'racer-rust/vim-racer'

" Rust.vim
Plug 'rust-lang/rust.vim'

"*******************************************************************************
" vim-plug : end
""******************************************************************************

call plug#end()

filetype plugin indent on

"*******************************************************************************
" vim-plug : end
""******************************************************************************

"" Encoding
set encoding=utf-8
set fileencoding=utf-8

let mapleader=','
set nu

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
set list listchars=tab:>-
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

""""  key mapping

" quickfix
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" fzf
nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>x :Commands<CR>

" neosnippet
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)


"""" Plugin Configurations

" integrate Python
let g:python_host_prog = '/Users/atakashi/.pyenv/shims/python2'
let g:python3_host_prog = '/Users/atakashi/.pyenv/shims/python3'

" integrate node
let g:node_host_prog = '/Users/atakashi/.ndenv/versions/v11.10.1/bin/neovim-node-host'

" for UltiSnips
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnapsSnippetDirectories=[/home/nelnal."/.local/share/nvim/snippets"]

" tigris
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1
let g:tigris#delay = 500

" for Airline
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" for ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
"let g:ale_javascript_flow_use_respect_pragma = 0
" remove 'tsserver' from 'javascript'
"let g:ale_linters = {
""  \'javascript': ['eslint', 'flow', 'jscs', 'jshint', 'standard', 'xo']
""  \}
let g:ale_linters = {
  \'javascript': ['eslint', 'flow']
  \}
let g:ale_fixers = {
  \'javascript': ['prettier-eslint']
  \}
let g:ale_javascript_prettier_use_local_config = 1

colorscheme molokai
