" if exists("g:ctrlp_user_command")
"   unlet g:ctrlp_user_command
" endif

" if executable('ag')
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command =
"     \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
"
"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" else
"   " Fall back to using git ls-files if Ag is not available
"   let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
" endif

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'

" nnoremap <silent> ,t :CtrlP<CR>
nnoremap <silent> ,e :GFiles<CR>
nnoremap <silent> ,d :Buffer<cr>

" why not working?
nnoremap <silent> ,t :GFiles<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,ja :GFiles app/assets<CR>
map ,jm :GFiles app/models<CR>
map ,jc :GFiles app/controllers<CR>
map ,jv :GFiles app/views<CR>
map ,jj :GFiles app/assets/javascripts<CR>
map ,jh :GFiles app/helpers<CR>
map ,jl :GFiles lib<CR>
map ,jp :GFiles public<CR>
map ,js :GFiles spec<CR>
map ,jd :GFiles db<CR>
map ,jC :GFiles config<CR>
map ,jV :GFiles vendor<CR>
map ,jF :GFiles factories<CR>
map ,jT :GFiles test<CR>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>
