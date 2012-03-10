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

