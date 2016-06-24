" From github.com/amontalenti/home/blob/master/
" .vim/bundle/whitespace/plugin/whitespace.vim

if exists('g:loaded_whitespace_plugin')
    finish
endif
let g:loaded_whitespace_plugin = 1

" Highlight EOL whitespace
highlight ExtraWhiteSpace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/

" The above flashes annoyingly while typing, so be calmer in Insert
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/

function! s:fixWhitespace(line1, line2)
    let l:save_cursor = getpos('.')
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

command! -range=% FixWhitespace call <SID>fixWhitespace(<line1>, <line2>)
