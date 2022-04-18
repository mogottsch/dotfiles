lua require('mogottsch.harpoon')

nnoremap <silent><leader>a :lua require('harpoon.mark').add_file()<CR>
nnoremap <silent><C-e> :lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>

nnoremap <silent><A-a> :lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <silent><A-s> :lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <silent><A-d> :lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <silent><A-f> :lua require('harpoon.ui').nav_file(4)<CR>

nnoremap <silent><A-j> :lua require('harpoon.ui').nav_file(5)<CR>
nnoremap <silent><A-k> :lua require('harpoon.ui').nav_file(6)<CR>
nnoremap <silent><A-l> :lua require('harpoon.ui').nav_file(7)<CR>

nnoremap <silent><leader>ta :lua require('harpoon.term').gotoTerminal(1)<CR>
nnoremap <silent><leader>ts :lua require('harpoon.term').gotoTerminal(2)<CR>
nnoremap <silent><leader>td :lua require('harpoon.term').gotoTerminal(3)<CR>
nnoremap <silent><leader>tf :lua require('harpoon.term').gotoTerminal(4)<CR>

nnoremap <silent><leader>sa :lua require('harpoon.term').sendCommand(1, 1)<CR>
nnoremap <silent><leader>ss :lua require('harpoon.term').sendCommand(1, 2)<CR>
nnoremap <silent><leader>sd :lua require('harpoon.term').sendCommand(1, 3)<CR>
nnoremap <silent><leader>sf :lua require('harpoon.term').sendCommand(1, 4)<CR>
