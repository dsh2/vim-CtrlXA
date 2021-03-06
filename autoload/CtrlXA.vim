function! CtrlXA#CtrlXA(CtrlAX) abort
  " use vim-repeat to ensure @. = <C-A/X>
  let repeat = ":silent! call repeat#set('" . a:CtrlAX . "','" . v:count . "')\<cr>"

  " first try matching cWORD, then cword
  let cWORD = expand('<cWORD>')
  let cword = expand('<cword>')

  for toggle in get(b:, 'CtrlXA_Toggles', g:CtrlXA_Toggles)
    let len = len(toggle)
    let i = 0
    while i < len
      let current = toggle[i]
      let next = toggle[ (i + 1) % len]

      if cWORD is# current
        return "\"_ciW" . next . "\<esc>" . repeat
      endif

	  " TODO: add separate loop for cword (vs. cWORD) to NOT break skip symmetry 
"       if cword is# current
"         return ":\<c-u>call search('\\v(\\k|\\x)','cz')\<cr>" . "\"_ciw" . next . "\<esc>" . repeat
"       endif

      let i = i+1
    endwhile
  endfor

  return a:CtrlAX . repeat
endfunction
