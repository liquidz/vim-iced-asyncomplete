let s:save_cpo = &cpoptions
set cpoptions&vim

function! iced#asyncomplete#complete(opt, ctx) abort
  let kw = matchstr(a:ctx['typed'], '[[:alnum:]!$&*\-_=+:<>./?]\+$')
  let kwlen = len(l:kw)
  let startcol = a:ctx['col'] - kwlen

  if kwlen == 0
    call asyncomplete#complete(a:opt['name'], a:ctx, startcol, [])
  else
    call iced#complete#candidates(
          \ kw,
          \ {candidates -> asyncomplete#complete(a:opt['name'], a:ctx, startcol, candidates)},
          \ )
  endif
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
