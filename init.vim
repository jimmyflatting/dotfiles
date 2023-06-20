" Enable syntax highlightning
syntax enable

" Set colors
set termguicolors

" Enable filetype detection
filetype plugin indent on

" Set the tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable line numbers
set number

" Set clipboard
set clipboard+=unnamedplus

" Specify the plugin installation directory
call plug#begin('~/.vim/plugged')

" List your plugins here
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

" End the plugin section
call plug#end()

" PLUGINS CONFIG

" NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = 'left'
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd FileType nerdtree nnoremap <buffer> a :NERDTreeAddFile<CR>
autocmd FileType nerdtree nnoremap <buffer> A :NERDTreeCreateDir<CR>
autocmd FileType nerdtree nnoremap <buffer> r :NERDTreeRename<CR>
autocmd FileType nerdtree nnoremap <buffer> R :NERDTreeRenameDir<CR>

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
let g:prettier#config#print_width = '60'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'i
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')


" TreeSitter
lua << EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained", -- Install maintained parsers
    highlight = {
      enable = true, -- Enable Treesitter highlighting
    },
  }
EOF

" vim-airline
lua << EOF
require("bufferline").setup{}
EOF
colorscheme catppuccin_mocha

" Bufferline
nnoremap <Tab> :BufferLineCycleNext<CR>
nnoremap <S-Tab> :BufferLineCyclePrev<CR>


" Set the Leader key to '\' (backslash)
let mapleader = "\<Space>"

" CoC Keybindings
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Switch between current buffer and NERDTree using <Leader>+arrow keys
nnoremap <M-Left> :NERDTreeFind<CR>
nnoremap <M-Right> :wincmd l<CR>
nnoremap <M-Up> :wincmd k<CR>
nnoremap <M-Down> :wincmd j<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-a> ggVG

" Enable mouse support
set mouse=a
