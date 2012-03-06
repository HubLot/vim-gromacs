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


