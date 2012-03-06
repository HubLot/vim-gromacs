Vim-Gromacs
===========

Vim-Gromacs is a plugin to easy manipulate Gromacs files in Vi/Vim.
It contains a set of files to enable syntax highlighting for Gromacs files.
For the moment, it works with mdp, ndx and top/itp files.
It contains also macros to comment/uncomment easily selections of a file and to jump to different sections (*[...]*) of a file.


Installation
------------

+ **Manual Way**

Go to your ~/.vim directory

If *syntax*, *ftdetect* and *ftplugin* directories don't exist, copy them from github.
If they are, copy only files inside. Otherwise, existing files will be replaced.

+ **VimBall Way (Vim >= 7.0)**

Get the vimball *gromacs.vba*.
Open it with vi and type:

::

  :so %
  :q!



+ **OS Supported**

Vim-Gromacs has been tested on Ubuntu 8.04, 10.04 and 11.04, Debian Squeeze and Mac OS X.
Please let us know if it's working on other distros.

Get Started
-----------

Syntax highlighting should be automatic.
To use macros, you need to allow filetype plugins : "filetype plugin on" in your *.vimrc*.
(If you want to have gromacs macros always allowed, move gromacs.vim from  *~/.vim/ftplugin* to *~/.vim/plugin*)


Usage
-----

Shortcuts for the macros:

]; -- Comment the selection|
]: -- Uncomment the selection|
], -- Jump to the next section
]! -- Jump to the previous section

A section is defined by '[....]'


Authors
-------

**Hubert Santuz**

+ https://github.com/HubLot
+ https://twitter.com/hsantuz

**Jonathan Barnoud**

+ https://github.com/jbarnoud
+ https://twitter.com/jbarnoud


Licence
-------

This program is free software: you can redistribute it and/or modify  
it under the terms of the GNU General Public License as published by   
the Free Software Foundation, either version 3 of the License, or      
(at your option) any later version.                                    
                                                                      
This program is distributed in the hope that it will be useful,        
but WITHOUT ANY WARRANTY; without even the implied warranty of         
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          
GNU General Public License for more details.                           
                                                                          
A copy of the GNU General Public License is available at
http://www.gnu.org/licenses/gpl-3.0.html.

                                         
