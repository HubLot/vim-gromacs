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
" " Language:           Xvg
" " Maintainer:         Jonathan Barnoud <jonathan@barnoud.net>
" " Last Change:        10 Mar 2012
" " Filenames:          *.xvg *.XVG
" " 

if exists("b:current_syntax")
  finish
endif

"  " For Comments
syn match xvgComment "#.*$"

"  " For graphical instructions
syn match xvgInstruction "@.*$"

let b:current_syntax = "gro"

" "Highlights colors
hi def link xvgComment          Comment
hi def link xvgInstruction      Special


