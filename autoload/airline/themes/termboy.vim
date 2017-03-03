function! s:bgfg(bg, fg, ...)
  return extend([termboy#term2gui(a:fg), termboy#term2gui(a:bg),
    \ a:fg, a:bg], a:000)
endfunction
function! airline#themes#termboy#refresh()
  let g:airline#themes#termboy#palette = {}

  let g:airline#themes#termboy#palette.accents
    \ = { 'red': s:bgfg('', 'DarkRed'), }

  let s:N1 = s:bgfg('DarkBlue', 'White', 'bold')
  let s:N2 = s:bgfg('DarkMagenta', 'White')
  let s:N2A = s:bgfg('Magenta', 'Black')
  let s:N3 = s:bgfg('DarkGreen', 'White')
  let s:N3A = s:bgfg('Green', 'Black')
  let g:airline#themes#termboy#palette.normal
    \ = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let g:airline#themes#termboy#palette.normal_modified
    \ = { }

  let s:I1 = s:bgfg('DarkRed', 'White', 'bold')
  let s:I2 = s:N2A
  let s:I3 = s:N3A
  let g:airline#themes#termboy#palette.insert
    \ = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#termboy#palette.insert_modified
    \ = g:airline#themes#base16#palette.normal_modified

  let s:R1 = s:I1
  let s:R2 = s:N2A
  let s:R3 = s:N3A
  let g:airline#themes#termboy#palette.replace
    \ = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#termboy#palette.replace_modified
    \ = g:airline#themes#base16#palette.normal_modified

  let s:V1 = s:bgfg('Yellow', 'Black', 'bold')
  let s:V2 = s:N2A
  let s:V3 = s:N3A
  let g:airline#themes#termboy#palette.visual
    \ = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#termboy#palette.visual_modified
    \ = g:airline#themes#base16#palette.normal_modified

  let s:IA = s:bgfg('DarkGreen', 'White')
  let s:IM = s:IA
  let g:airline#themes#termboy#palette.inactive
    \ = airline#themes#generate_color_map(s:IA, s:IA, s:IA, s:IA, s:IA, s:IA)
  let g:airline#themes#termboy#palette.inactive_modified
    \ = airline#themes#generate_color_map(s:IM, s:IM, s:IM, s:IM, s:IM, s:IM)

  let s:WIV = s:bgfg('DarkRed', 'White', 'bold')
  let s:WI = s:bgfg('Yellow', 'DarkRed', 'bold')
  let g:airline#themes#termboy#palette.normal.airline_warning
    \ =  [s:WI[0], s:WI[1], s:WI[2], s:WI[3] ]
  let g:airline#themes#termboy#palette.normal_modified.airline_warning
    \ = g:airline#themes#termboy#palette.normal.airline_warning
  let g:airline#themes#termboy#palette.insert.airline_warning
    \ = g:airline#themes#termboy#palette.normal.airline_warning
  let g:airline#themes#termboy#palette.insert_modified.airline_warning
    \ = g:airline#themes#termboy#palette.normal.airline_warning
  let g:airline#themes#termboy#palette.visual.airline_warning
    \ =  [s:WIV[0], s:WIV[1], s:WIV[2], s:WIV[3] ]
  let g:airline#themes#termboy#palette.visual_modified.airline_warning
    \ = g:airline#themes#termboy#palette.visual.airline_warning
  let g:airline#themes#termboy#palette.replace.airline_warning
    \ = g:airline#themes#termboy#palette.normal.airline_warning
  let g:airline#themes#termboy#palette.replace_modified.airline_warning
    \ = g:airline#themes#termboy#palette.normal.airline_warning

  let g:airline#themes#termboy#palette.normal.airline_error
    \ = g:airline#themes#termboy#palette.normal.airline_warning
  let g:airline#themes#termboy#palette.normal_modified.airline_error
    \ = g:airline#themes#termboy#palette.normal_modified.airline_warning
  let g:airline#themes#termboy#palette.insert.airline_error
    \ = g:airline#themes#termboy#palette.insert.airline_warning
  let g:airline#themes#termboy#palette.insert_modified.airline_error
    \ = g:airline#themes#termboy#palette.insert_modified.airline_warning
  let g:airline#themes#termboy#palette.visual.airline_error
    \ = g:airline#themes#termboy#palette.visual.airline_warning
  let g:airline#themes#termboy#palette.visual_modified.airline_error
    \ = g:airline#themes#termboy#palette.visual_modified.airline_warning
  let g:airline#themes#termboy#palette.replace.airline_error
    \ = g:airline#themes#termboy#palette.replace.airline_warning
  let g:airline#themes#termboy#palette.replace_modified.airline_error
    \ = g:airline#themes#termboy#palette.replace_modified.airline_warning
endfunction
call airline#themes#termboy#refresh()
