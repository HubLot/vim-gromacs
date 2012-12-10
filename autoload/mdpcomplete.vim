if exists("b:loaded_mdp_complete")
  finish
endif
let b:loaded_mdp_complete = 1


if has('python')
    " Contextual completion with python
    let s:plugin_path = escape(expand('<sfile>:p:h'), '\')
    python import sys
    python import vim
    exe 'python sys.path = ["' . s:plugin_path . '"] + sys.path'
    python import mdp_complete

    function! mdpcomplete#Complete(findstart, base)
        python mdp_complete.vim_complete()
        return l:result
    endfunction
endif
