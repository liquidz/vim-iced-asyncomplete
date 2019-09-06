if exists('g:loaded_iced_asyncomplete')
  finish
endif
let g:loaded_iced_asyncomplete = 1

if !exists('g:asyncomplete_triggers')
  echoe 'prabirshrestha/asyncomplete.vim is required.'
endif

if !exists('g:vim_iced_version')
      \ || g:vim_iced_version < 1101
  echoe 'iced-asyncomplete: vim-iced v0.11.1 or later is required.'
endif

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
