if exists('g:ToggleBool')
    " finish
endif

fu! ToggleBool#ToggleBool()
    let line = getline('.')
    let oldignorecase=&ignorecase
    set noic
    if(match(line, "true") != -1)
        let line = substitute(line, "true", "false", "gI")
    elseif(match(line, "True") != -1)
        let line = substitute(line, "True", "False", "gI")
    elseif(match(line, "false") != -1)
        let line = substitute(line, "false", "true", "gI")
    elseif(match(line, "False") != -1)
        let line = substitute(line, "False", "True", "gI")
    endif

    call setline('.', line)
    let &ignorecase=oldignorecase
    unlet oldignorecase
endf

command! ToggleBool call ToggleBool#ToggleBool()

nmap <space> :ToggleBool<cr>j

let g:ToggleBool = 1
