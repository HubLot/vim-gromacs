"                                                                           
"    This program is free software: you can redistribute it and/or modify  
"    it under the terms of the GNU General Public License as published by   
"    the Free Software Foundation, either version 3 of the License, or      
"    (at your option) any later version.                                    
"                                                                           
"    This program is distributed in the hope that it will be useful,        
"    but WITHOUT ANY WARRANTY; without even the implied warranty of         
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          
"    GNU General Public License for more details.                           
"                                                                           
"    A copy of the GNU General Public License is available at
"    <http://www.gnu.org/licenses/>.


" " Maintainer:         Jonathan Barnoud <jonathan@barnoud.net>
" " Last Change:        23 Feb 2012

" Shortcuts:
"   ];      -- Comment the selected block
"   ]:      -- Uncomment the selected block
"   ]k      -- Jump to the previous section
"   ]j      -- Jump to the next section


if exists("b:loaded_gmx_plugin")
  finish
endif
let b:loaded_gmx_plugin = 1

map  ];   :call GromacsCommentSelection()<CR>
vmap ];   :call GromacsCommentSelection()<CR>
map  ]:   :call GromacsUncommentSelection()<CR>
vmap ]:   :call GromacsUncommentSelection()<CR>
map  ]j   :call GromacsMoveSection(1)<CR>
map  ]k   :call GromacsMoveSection(-1)<CR>

" Comment out selected lines
" Add the comment character as first column
function! GromacsCommentSelection() range
    let commentString = ";"
    let cl = a:firstline
    while (cl <= a:lastline)
        let ul = substitute(getline(cl), "^\\(.*\\)$", commentString."\\1", "")
        call setline(cl, ul)
        let cl = cl + 1
    endwhile
endfunction

" Uncomment  selected lines
" Remove the first comment character
function! GromacsUncommentSelection() range
    let commentString = ";"
    let cl = a:firstline
    while (cl <= a:lastline)
        let ul = substitute(getline(cl),
            \"\\([ \\t]*\\\)".commentString."\\(.*\\)$", "\\1\\2", "")
        call setline(cl, ul)
        let cl = cl + 1
    endwhile
endfunction

" Move to the next (1) or previous (-1) section
function! GromacsMoveSection(direction)
    let regexp = "^[ \t]*\\[.*\\]"
    let flag = "W"
    if (a:direction == -1)
        let flag = flag."b"
    endif
    let res = search(regexp, flag)
endfunction
