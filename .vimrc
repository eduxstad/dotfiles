" Install Plug if Needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Install Plugins
call plug#begin('~/.vim/bundle')

Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

call plug#end()

" Turn on color highlighting
syntax enable
" Adjust tabstop for different filetypes
set tabstop=4 shiftwidth=4
filetype indent on
au FileType html setl shiftwidth=2 tabstop=2 et
au FileType javascript setl shiftwidth=2 tabstop=2 et
au FileType typescript setl shiftwidth=2 tabstop=2 et
" Keep cursor vertically centered (within 7 lines)
set so=7

"	custom leader
let mapleader = ","

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
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

"   Custom bindings
"	save file
noremap <leader>w :w<CR>
"	quit without saving
noremap <leader>q :q<CR>
"	quit with saving
noremap <leader>x :x<CR>

" this currently lags out the terminal
" set number
" set relativenumber

" toggle relative number
noremap + :set relativenumber! <bar> set number!<Enter>

" set mouseing
set mouse=a

" set spelllang 
set spelllang=en_us

"Open Zathura (for editing notes in Latex)
command ZATHURA silent exe "!echo " . shellescape(expand("%")) . " | grep -oP '^[^\.]+' | xargs -I{} zathura '{}'.pdf &disown" | redraw!

"Reopen file where left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

