" Telescope configuration

" Search all files in project with ',t'
nnoremap <silent> ,t <cmd>Telescope find_files<cr>

" Search open buffers with ',b'
nnoremap <silent> ,b <cmd>Telescope buffers<cr>

" Optional: Clear cache (similar to ClearCtrlPCache, but Telescope handles caching differently)
nnoremap <silent> <D-P> <cmd>Telescope find_files clear_cache=true<cr>

" Idea from: http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open Telescope starting from a particular path, making it much more likely to find the correct thing first
" Mnemonic: 'jump to [something]'
nnoremap ,ja <cmd>Telescope find_files cwd=app/assets<cr>
nnoremap ,jm <cmd>Telescope find_files cwd=app/models<cr>
nnoremap ,jc <cmd>Telescope find_files cwd=app/controllers<cr>
nnoremap ,jv <cmd>Telescope find_files cwd=app/views<cr>
nnoremap ,jj <cmd>Telescope find_files cwd=app/assets/javascripts<cr>
nnoremap ,jh <cmd>Telescope find_files cwd=app/helpers<cr>
nnoremap ,jl <cmd>Telescope find_files cwd=lib<cr>
nnoremap ,jp <cmd>Telescope find_files cwd=public<cr>
nnoremap ,js <cmd>Telescope find_files cwd=spec<cr>
nnoremap ,jf <cmd>Telescope find_files cwd=fast_spec<cr>
nnoremap ,jd <cmd>Telescope find_files cwd=db<cr>
nnoremap ,jC <cmd>Telescope find_files cwd=config<cr>
nnoremap ,jV <cmd>Telescope find_files cwd=vendor<cr>
nnoremap ,jF <cmd>Telescope find_files cwd=factories<cr>
nnoremap ,jT <cmd>Telescope find_files cwd=test<cr>

" Jump to a method (tag in current file)
nnoremap <silent> <D-M> <cmd>Telescope current_buffer_tags<cr>

" Optional: Add some Telescope-specific mappings
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Add these lines for ripgrep integration
" Search within files using ripgrep
nnoremap <leader>rg <cmd>Telescope live_grep<cr>

" Optional: Search for the word under the cursor
nnoremap <leader>rw <cmd>Telescope grep_string<cr>

" Configure Telescope to use ripgrep
let g:telescope_vimgrep_arguments = [
  \ 'rg',
  \ '--color=never',
  \ '--no-heading',
  \ '--with-filename',
  \ '--line-number',
  \ '--column',
  \ '--smart-case'
  \ ]

" Set up Telescope defaults
let g:telescope_setup = {
  \ 'defaults': {
  \   'vimgrep_arguments': g:telescope_vimgrep_arguments
  \ }
  \ }

" Apply the configuration when Telescope is loaded
if exists(':Telescope')
  call telescope#setup(g:telescope_setup)
endif
