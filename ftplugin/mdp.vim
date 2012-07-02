if exists("b:loaded_mdp_plugin")
  finish
endif
let b:loaded_mdp_plugin = 1

let b:current_file=fnamemodify(expand("<sfile>"), ":h")."/mdp.dict"
echomsg b:current_file
execute "setlocal dictionary+=".b:current_file
setlocal complete+=k
