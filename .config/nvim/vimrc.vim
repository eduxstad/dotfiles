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

" Smart Indent based on filetype
filetype indent on
set smartindent

"	custom leader
let mapleader = ","

"   Custom bindings
"	save file
noremap <leader>w :w<CR>
"	quit without saving
noremap <leader>q :q<CR>
"	quit with saving
noremap <leader>x :x<CR>

"	Clipboard 
"	save to clipboard
noremap <leader>y "+y
"	paste from clipboard
noremap <leader>p "+p
"	paste from clipboard at end of line
noremap <leader>P "+P

"	reload current file
noremap <leader>e :e<CR>
"	spell toggling
noremap <leader>s :setlocal spell!<CR>
noremap <leader>ss :setlocal spell<CR>
noremap <leader>S :setlocal spell<bar>setlocal spell!<CR>

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

