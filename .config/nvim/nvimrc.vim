" vimtex
noremap <leader>v :VimtexCompile<CR>
let g:vimtex_view_general_viewer = 'zathura'
let g:tex_flavor='latex'
let g:vimtex_quickfix_enabled = 0
let g:vimtex_mappings_enabled = 0

" ultisnips
noremap <leader>se :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" Neovim
" remove footer
set laststatus=1
