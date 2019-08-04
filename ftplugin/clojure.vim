if exists('g:loaded_iced_asyncomplete')
  finish
endif
let g:loaded_iced_asyncomplete = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

let g:asyncomplete_triggers['clojure'] = [
      \ '/',
      \ ]

aug IcedAsyncompleteSetup
  au User asyncomplete_setup call asyncomplete#register_source({
      \ 'name': 'vim-iced',
      \ 'whitelist': ['clojure'],
      \ 'completor': function('iced#asyncomplete#complete'),
      \ })
aug END

let &cpoptions= s:save_cpo
unlet s:save_cpo
