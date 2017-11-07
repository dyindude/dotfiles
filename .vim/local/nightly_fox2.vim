" inspired by http://paulrouget.com/e/myconf/
fun! tmuxline#presets#nightly_fox2#get()
    let bar = tmuxline#new()
    call bar.right.add('y', '#(cat ~/.nowplaying.txt)')
    call bar.right.add('z', '%H:%M')

    call bar.win.add('win.dim', '#I#W')
    "call bar.win.add('win', '#W')

    call bar.cwin.add_left_sep()
    call bar.cwin.add('cwin', '#W')
    call bar.cwin.add_left_sep()

    let bar.options['status-justify'] = 'left'
    let bar.win_options['window-status-activity-attr'] = 'none'

    return bar
endfun
