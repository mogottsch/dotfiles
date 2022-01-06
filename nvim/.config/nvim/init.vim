"------------------------------------------------------------
" Features
set noswapfile
set nobackup

set termguicolors

" Display relative line numbers on the left
set number relativenumber
" Show absolute numbers in insert mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Show max char bar to the right
set colorcolumn=80

" Always show column to the left (for lsp & stuff)
set signcolumn=yes

" Plugins
"------------------------------------------------------------
call plug#begin()

Plug 'junegunn/vim-easy-align'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-capslock' " <C-G>c Insert | gC Normal 
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'francoiscabrol/ranger.vim' " <Leader>f
Plug 'sbdchd/neoformat'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'morhetz/gruvbox'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Telescope 
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" Initialize plugin system
call plug#end()

" Plugin Config
"------------------------------------------------------------
let g:camelcasemotion_key = '<leader>'
let g:highlightedyank_highlight_duration = 200

let g:ranger_map_keys = 0


" auto-format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

" Appearance
"------------------------------------------------------------
let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox

"------------------------------------------------------------
" Usability options
set clipboard=unnamedplus


set incsearch
set ignorecase
set smartcase

set confirm

" Enable mouse
if has('mouse')
  set mouse=a
endif

set nowrap

set scrolloff=8

" More space for messages
set cmdheight=2

"------------------------------------------------------------
" Indentation options
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"------------------------------------------------------------
" Mappings
let mapleader = " "

noremap <Leader><Leader>c :source $MYVIMRC<cr>

" Keep centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break marks
" not working in vscode
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" move lines from any mode
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Make current file executable
nnoremap <leader>x :silent !chmod +x %<CR>

" Open sessionizer
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" Open ranger
map <leader>r :Ranger<CR>

command PI PlugInstall