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
