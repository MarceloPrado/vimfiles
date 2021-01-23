lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope git_files theme=get_dropdown<cr>
nnoremap <leader>ps <cmd>Telescope live_grep prompt_prefix=🔍 theme=get_dropdown<CR>

