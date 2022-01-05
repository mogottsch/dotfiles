lua require('mogottsch.telescope')

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fd :lua require('mogottsch.telescope').search_dotfiles()<CR>
nnoremap <leader>fw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>cw :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

