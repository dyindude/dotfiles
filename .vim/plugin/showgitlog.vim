" The Vim plugin just simply shows
" the current editing file's git log (if possible)
" shourtcut set to sl
" Written by sunus Lee
" sunuslee@gmail.com
" Fri Nov  9 15:21:22 CST 2012
"
" This program is free software. It comes without any warranty, to
" the extent permitted by applicable law. You can redistribute it
" and/or modify it under the terms of the Do What The Fuck You Want
" To Public License, Version 2, as published by Sam Hocevar. See
" http://sam.zoy.org/wtfpl/COPYING for more details. */

function! ShowGitLog(method)
    let current_editing=expand('%:p')
    lcd %:p:h
    let cmd="git log -p ".current_editing
    let log=system(cmd)
    if len(log) < 220
        echo 'No Git Log Found!'
        return
    endif
    let fname=system("mktemp")
    let cmd=a:method." ".fname
    execute cmd
    call append(line('$'), split(log, "\n"))
    set syntax=diff
endfunction


nmap <silent> tsl :call ShowGitLog("tabnew")<CR>
nmap <silent> vsl :call ShowGitLog("vsplit")<CR>
nmap <silent> hsl :call ShowGitLog("split")<CR>
