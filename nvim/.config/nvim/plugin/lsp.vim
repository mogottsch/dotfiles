
lua require('mogottsch.lsp')

nnoremap g? :lua vim.diagnostic.open_float()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gh :lua vim.lsp.buf.hover()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gs :lua vim.lsp.buf.signature_help()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gt :lua vim.lsp.buf.type_definition()<CR>
" nnoremap <leader>gw :lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <leader>gW :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>ah :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>af :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>ee :lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>ar :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>= :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>ai :lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>ao :lua vim.lsp.buf.outgoing_calls()<CR>
