" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
syntax/mdp.vim	[[[1
46
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
"    http://www.gnu.org/licenses/gpl-3.0.html 


" Vim syntax file
" " Language:           Molecular Dynamics parameter file
" " Maintainer:         Hubert Santuz <hubert.santuz@gmail.com>
" " Last Change:        21 Feb 2012
" " Filenames:          *.mdp *.MDP
" " 

if exists("b:current_syntax")
  finish
endif

" " For Comments
syn match mdpComment ";.*$"

" "For parameters (before '=')
syn match mdpParam       "^[A-Za-z0-9_-]\+" contains=mdpParamName
syn match mdpParamName   "[A-Za-z0-9_-]\+" contained

" "For values (after '=')
syn match mdpValue       "= *\([A-Za-z0-9_-]\|\s\|\.\)\+" contains=mdpEqual,mdpValueName
syn match mdpEqual       "=" contained
syn match mdpValueName   "\([A-Za-z0-9_-]\|\s\|\.\)\+" contained  


let b:current_syntax = "mdp"

" "Highlights colors
hi def link mdpComment     Comment
hi def link mdpValueName   Constant
hi def link mdpEqual       Function

syntax/ndx.vim	[[[1
40
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
"    http://www.gnu.org/licenses/gpl-3.0.html
 


" Vim syntax file
" " Language:           Index file
" " Maintainer:         Hubert Santuz <hubert.santuz@gmail.com>
" " Last Change:        21 Feb 2012
" " Filenames:          *.ndx *.NDX
" " 

if exists("b:current_syntax")
  finish
endif

" " Between the [...]
syn region ndxBlock start='\[' end='\]'  contains=ndxBlockValue
syn match ndxBlockValue   "\([A-Za-z0-9_-]\|\s\|\.\)\+" contained

"  " For Comments
syn match ndxComment ";.*$"

let b:current_syntax = "ndx"

" "Highlights colors
hi def link ndxBlock       Function
hi def link ndxBlockValue  Keyword
hi def link ndxComment     Comment
syntax/top.vim	[[[1
61
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
"    http://www.gnu.org/licenses/gpl-3.0.html
 


" Vim syntax file
" " Language:           Topology file
" " Maintainer:         Hubert Santuz <hubert.santuz@gmail.com>
" " Last Change:        23 Feb 2012
" " Filenames:          *.top *.TOP *.itp *.ITP
" " 

if exists("b:current_syntax")
  finish
endif

"  " For Comments
syn match topComment ";.*$"

" " For Strings
syn region topString start='"' end='"'

" " For Preprocessing directives
syn match  topPreProc  "^\s*#\(define\|include\|endif\|else\|endif\)"
syn match  topIfDef    "^\s*#ifdef\s*\w\+" 

" " Between the [...]
syn region topBlock start='\[' end='\]'  contains=topBlockValue
syn match topBlockValue   "\([A-Za-z0-9_-]\|\s\|\.\)\+" contained

" "Special treatment for [ molecules ] : highlights names of molecules and the
" "numbers
syn region topMolecules start='^\s*\[\s*molecules\s*\]' end='^\s*\['me=e-1 transparent contains=ALL
syn match topMolType "^\([A-Za-z0-9_-]\|+\)\+" contained containedin=topMolecules nextgroup=topMolNumber skipwhite
syn match topMolNumber "\d\+" contained containedin=topMolecules


let b:current_syntax = "top"

" "Highlights colors
hi def link topComment      Comment
hi def link topString       Constant
hi def link topPreProc      Special
hi def link topIfDef        Special
hi def link topBlock        Function
hi def link topBlockValue   Keyword
hi def link topMolType      Type
hi def link topMolNumber    Constant


syntax/gro.vim	[[[1
57
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
"    http://www.gnu.org/licenses/gpl-3.0.html
 


" Vim syntax file
" " Language:           Coordinate File
" " Maintainer:         Hubert Santuz <hubert.santuz@gmail.com>
" " Last Change:        08 Mar 2012
" " Filenames:          *.gro *.GRO
" " 

if exists("b:current_syntax")
  finish
endif

"  " For Comments
syn match groComment ";.*$"

"  " List of atoms
syn match groResNumber "^\s*[0-9]\{1,5}" nextgroup=groResName skipwhite 
syn match groResName "\([A-Za-z0-9_-]\|\s\)\{1,5}" nextgroup=groAtomName contained
syn match groAtomName "\([A-Za-z0-9_-]\|\s\)\{1,5}" nextgroup=groAtomNumber contained
syn match groAtomNumber "\s*\d\{1,5}" nextgroup=groCoordinates contained
syn match groCoordinates "\([0-9-]\|\s\|\.\)\{1,24}" nextgroup=groVelocities contained
syn match groVelocities "\([0-9-]\|\s\|\.\)\{1,24}" contained

"  " Total number of atoms (2nd line)
syn match groAllAtomNumber "^\d\+$"

"  " Size of the box (last line)
syn match groBox "^\s\+\d\+\.\d\+\s\+\d\+\.\d\+\s\+\d\+\.\d\+\s*"

let b:current_syntax = "gro"

" "Highlights colors
hi def link groComment          Comment
hi def link groAllAtomNumber    Function
hi def link groResNumber        Constant
hi def link groResName          Special
hi def link groAtomName         Special
hi def link groAtomNumber       Constant
hi def link groCoordinates      Type
hi def link groVelocities       Keyword
hi def link groBox              Function

ftdetect/gromacs.vim	[[[1
20
" Molecular Dynamics Parameter file (mdp)
au BufNewFile,BufRead *.mdp    setf mdp.gromacs
au BufNewFile,BufRead *.MDP    setf mdp.gromacs

" Index file (ndx)
au BufNewFile,BufRead *.ndx    setf ndx.gromacs
au BufNewFile,BufRead *.NDX    setf ndx.gromacs

"Topology file (top, itp)
au BufNewFile,BufRead *.top    setf top.gromacs
au BufNewFile,BufRead *.TOP    setf top.gromacs

au BufNewFile,BufRead *.itp    setf top.gromacs
au BufNewFile,BufRead *.ITP    setf top.gromacs

"Coordinate file (gro)
"
au BufNewFile,BufRead *.gro    setf gro.gromacs
au BufNewFile,BufRead *.GRO    setf gro.gromacs

ftplugin/gromacs.vim	[[[1
71
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
"   ],      -- Jump to the previous section
"   ]!      -- Jump to the next section


if exists("b:loaded_gmx_plugin")
  finish
endif
let b:loaded_gmx_plugin = 1

map  ];   :call GromacsCommentSelection()<CR>
vmap ];   :call GromacsCommentSelection()<CR>
map  ]:   :call GromacsUncommentSelection()<CR>
vmap ]:   :call GromacsUncommentSelection()<CR>
map  ],   :call GromacsMoveSection(1)<CR>
map  ]!   :call GromacsMoveSection(-1)<CR>

" Comment out selected lines
" Add the comment character as first column
function GromacsCommentSelection() range
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
function GromacsUncommentSelection() range
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
function GromacsMoveSection(direction)
    let regexp = "\\[.*\\]"
    let flag = "W"
    if (a:direction == -1)
        let flag = flag."b"
    endif
    let res = search(regexp, flag)
endfunction
