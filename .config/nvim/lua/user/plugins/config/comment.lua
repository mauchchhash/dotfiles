local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

comment.setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
}

vim.cmd([[
" nnoremap <silent> gCz <plug>(comment_toggle_linewise_current)
" vnoremap <silent> gCz <plug>(comment_toggle_linewise_visual)
" nnoremap <silent> gCZ <plug>(comment_toggle_blockwise_current)
" vnoremap <silent> gCZ <plug>(comment_toggle_blockwise_visual)

" nmap <silent> <leader>c gCz:w<cr>
" vmap <silent> <leader>c gCz:w<cr>
" nmap <silent> <leader>C gCZ:w<cr>
" vmap <silent> <leader>C gCZ:w<cr>

nmap <silent> <leader>c gcc:w<cr>
vmap <silent> <leader>c gc:w<cr>
nmap <silent> <leader>C gbc:w<cr>
vmap <silent> <leader>C gb:w<cr>

nmap <silent> <c-/> gcc
vmap <silent> <c-/> gc
nmap <silent> <c-?> gbc
vmap <silent> <c-?> gb
]])
-- *<Plug>(comment_toggle_linewise_current)*
-- *<Plug>(comment_toggle_blockwise_current)*
-- *<Plug>(comment_toggle_linewise_visual)*
-- *<Plug>(comment_toggle_blockwise_visual)*
