function! s:let(name, value)
  let dotidx = strridx(a:name, '.')
  if dotidx != -1
    let name = a:name[: dotidx - 1]
    let key = a:name[dotidx + 1 :]
  else
    let name = a:name
    let key = ''
  endif
  let name = printf('g:termboy#%s', name)
  if !exists(name)
    execute printf('let %s = %s', name, !empty(key) ? string({}) : string(a:value))
  endif
  if !empty(key)
    execute printf('let dict = %s', name)
    if !has_key(dict, key)
      let dict[key] = a:value
    endif
  endif
endfunction

call s:let('guiColors.black', '#1e1e1e')
call s:let('guiColors.darkBlue', '#3c50be')
call s:let('guiColors.darkGreen', '#508c3c')
call s:let('guiColors.darkCyan', '#3c8cb4')
call s:let('guiColors.darkRed', '#b43c3c')
call s:let('guiColors.darkMagenta', '#7846a0')
call s:let('guiColors.darkYellow', '#b4af50')
call s:let('guiColors.lightGray', '#b4b4b4')
call s:let('guiColors.darkGray', '#787878')
call s:let('guiColors.blue', '#5078f0')
call s:let('guiColors.green', '#64b450')
call s:let('guiColors.cyan', '#64a0f0')
call s:let('guiColors.red', '#f05050')
call s:let('guiColors.magenta', '#b464f0')
call s:let('guiColors.yellow', '#f0e678')
call s:let('guiColors.white', '#ffffff')

function! s:lowercamel(name)
  return strlen(a:name) == 0 ? '' : tolower(a:name[0]).a:name[1:]
endfunction

function! termboy#term2gui(name)
  return get(g:termboy#guiColors,
    \ s:lowercamel(a:name), a:name)
endfunction

function! termboy#cook(recipe)
  for key in keys(a:recipe)
    execute printf('hi %s NONE', key)
    if a:recipe[key] =~ '^&'
      execute printf('hi! link %s %s', key, a:recipe[key][1:])
    elseif !empty(a:recipe[key])
      let styles = []
      let bg = ''
      let fg = ''
      for arg in split(a:recipe[key], "\u0020")
        if arg =~ '^!'
          let styles = split(arg, '!')
        else
          let colors = split(arg, '@', 1)
          if len(colors) == 1
            let fg = colors[0]
          elseif len(colors) == 2
            let bg = colors[0]
            let fg = colors[1]
          endif
        endif
      endfor
      let args = []
      if !empty(styles)
        call add(args, printf('cterm=%s', join(styles, ',')))
        call add(args, printf('gui=%s', join(styles, ',')))
      endif
      if !empty(bg)
        call add(args, printf('ctermbg=%s', bg))
        call add(args, printf('guibg=%s', termboy#term2gui(bg)))
      endif
      if !empty(fg)
        call add(args, printf('ctermfg=%s', fg))
        call add(args, printf('guifg=%s', termboy#term2gui(fg)))
      endif
      execute printf('hi! %s %s', key, join(args, "\u0020"))
    endif
  endfor
  set background=dark
endfunction
