-- CtrlP Stuff
-- I don't want to pull up these folders/files when calling CtrlP
vim.cmd([[
set wildignore+=*/vendor/**
set wildignore+=*/storage/**
set wildignore+=*/.cache/**
set wildignore+=*/cache/**
set wildignore+=*/public/js/app.js
set wildignore+=*/public/plugins/**
set wildignore+=*/node_modules/**
set wildignore+=*/android/**
set wildignore+=*/ios/**
set wildignore+=*/dist/**
set wildignore+=*/tags
set wildignore+=*/*.webp
set wildignore+=*/*.jpeg
set wildignore+=*/*.jpg
nnoremap <leader>df :CtrlPBuffer<cr>
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'min:1,max:20,results:20'
]])

-- let g:ctrlp_user_command =
-- \ 'find %s -type f | grep -v -P "\.jpg$|/tmp/"'          " MacOSX/Linux
--
-- if executable('ag')
--   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
-- endif
-- nnoremap <C-/> :CtrlPBuffer<cr>
-- set wildignore+=*/public/forum/**
