"------------------------------------------------------------
" Features
set noswapfile
set nobackup

if has('termguicolors')
  set termguicolors
endif

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
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-capslock' " <C-G>c Insert | gC Normal
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'francoiscabrol/ranger.vim' " <Leader>r
Plug 'sbdchd/neoformat'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'morhetz/gruvbox'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'L3MON4D3/LuaSnip'
Plug 'github/copilot.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ThePrimeagen/harpoon'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'NTBBloodbath/rest.nvim'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua' " nvim specific lua
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

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

let g:copilot_no_tab_map = v:true

" auto-format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

augroup vairline
    autocmd FileType * unlet! g:airline#extensions#whitespace#checks
    autocmd FileType markdown let g:airline#extensions#whitespace#checks = [ 'indent' ]
augroup END

set diffopt+=vertical
nmap <leader>gs :Ge :<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" augroup easymotion
"     autocmd User EasyMotionPromptBegin silent! LspStop
"     autocmd User EasyMotionPromptEnd silent! LspStart
" augroup END

let g:airline_section_z = "%p%%"

" Appearance
"------------------------------------------------------------
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'soft'
autocmd vimenter * ++nested colorscheme gruvbox

let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ''

" Fix weird appearance of easymotion targets 
hi link EasyMotionTarget ErrorMsg

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

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Delay e.g. for vim-gitgutter
set updatetime=100

"------------------------------------------------------------
" Indentation options
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

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

noremap <C-s> :update<CR>
inoremap <C-s> <C-o>:update<CR>

"Open file explorer
nnoremap <leader>pv :Ex<CR>

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" whole buffer
nnoremap yie ggyG``
nnoremap die ggdG

"Plugin mappings
map <leader>r :Ranger<CR>
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
nmap <leader>mp <Plug>MarkdownPreviewToggle

" vim easly align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" rest.nvim
nmap <leader><leader>r <Plug>RestNvim

" Enter normal mode from terminal mode
tnoremap <Esc> <C-\><C-n>

xnoremap p pgvy

command PI PlugInstall

