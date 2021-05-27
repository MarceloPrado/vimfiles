call plug#begin('~/.vim/plugged')
  " Telescope: https://github.com/nvim-telescope/telescope.nvim
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " File tree: https://github.com/kyazdani42/nvim-tree.lua
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

  " Themes plugins
  Plug 'gruvbox-community/gruvbox'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'
  Plug 'ayu-theme/ayu-vim'

  " Other plugins
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'

  " Comment and uncomment line of codes
  Plug 'tpope/vim-commentary'

  " Elixir syntax highlighting
  Plug 'elixir-editors/vim-elixir'

  " TypeScript JSX highlighting + Snippets
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'mlaursen/vim-react-snippets'
call plug#end()

syntax on
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" colorscheme onedark

let mapleader = " "

" Moves through multiple windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Resize windows
nnoremap <leader>= :wincmd =<CR>
nnoremap <silent> <c-Up> :resize -5<CR>
nnoremap <silent> <c-Down> :resize +5<CR>
nnoremap <silent> <c-left> :vertical resize -5<CR>
nnoremap <silent> <c-right> :vertical resize +5<CR>

" Sent by CMD + S on iterm2, saves file
noremap  <silent> <C-ss> :w<CR>
inoremap <silent> <C-ss> <ESC>:w<CR>i

" Set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 70})
augroup END

" Removes whitespace on buffer write
augroup white_space_trimmer
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END
