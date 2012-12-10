if exists("b:loaded_mdp_plugin")
  finish
endif
let b:loaded_mdp_plugin = 1

"let b:current_file=fnamemodify(expand("<sfile>"), ":h")."/mdp.dict"
"echomsg b:current_file
"execute "setlocal dictionary+=".b:current_file
"setlocal complete+=k

" Contextual completion with python
" 1) load the python module
let s:plugin_path = escape(expand('<sfile>:p:h'), '\')
python import sys
python import vim
exe 'python sys.path = ["' . s:plugin_path . '"] + sys.path'
"exe 'pyfile ' . s:plugin_path . '/mdp_complete.py'
"python hello_world('toto')
python import mdp_complete

function! Hello(name)
    python mdp_complete.hello_world(vim.eval('a:name'))
    echomsg l:return
endfunction

function! CompleteMDP(findstart, base)
    python mdp_complete.vim_complete()
    return l:result
endfunction

set completefunc=CompleteMDP
