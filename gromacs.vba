" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
syntax/mdp.vim	[[[1
47
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
"    http://www.r-project.org/Licenses/                                                                          
 


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
37
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
"    http://www.r-project.org/Licenses/                                                                          
 


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

let b:current_syntax = "ndx"

" "Highlights colors
hi def link ndxBlock       Special
hi def link ndxBlockValue  constant

ftdetect/gromacs.vim	[[[1
8
" Molecular Dynamics Parameter file (mdp)
au BufNewFile,BufRead *.mdp    setf mdp
au BufNewFile,BufRead *.MDP    setf mdp

" Index file (ndx)
au BufNewFile,BufRead *.ndx    setf ndx
au BufNewFile,BufRead *.NDX    setf ndx

