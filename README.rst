Vim-Gromacs
===========

Vim-Gromacs is a plugin to easy manipulate Gromacs files in Vi/Vim.

It contains a set of files to enable syntax highlighting for Gromacs files.
For the moment, it works with mdp, gro, top/itp, xvg and ndx files.

It contains also macros to comment/uncomment easily selections of a file and to
jump to different sections (*[...]*) of a file.

The plugin also provides contextual autocompletion in mdp files.


Installation
------------

+ **VimBall Way (Vim >= 7.0)**

Get the vimball *gromacs.vba*.
Open it with vi and type:

::

  :so %
  :q!

+ **Pathogen Way**

Pathogen is a vim module which allows to load modules from there own directory.

Install pathogen (https://github.com/tpope/vim-pathogen) and then clone this
repository in ~/.vim/bundle. It works.

+ **Manual Way**

Go to your ~/.vim directory.

If *syntax*, *autoload*, *ftdetect*, and *ftplugin* directories don't exist,
copy them from github.  If they are, copy only the files inside. Otherwise,
existing files will be replaced.

+ **OS Supported**

Vim-Gromacs has been tested on Ubuntu 8.04, 10.04 and 11.04, Debian Squeeze,
Fedora 16 and 17 and Mac OS X.

Please let us know if it's working on other distros.

Get Started
-----------

Syntax highlighting should be automatic.

Macros
~~~~~~

To use macros, you need to allow filetype plugins : "filetype plugin on" in
your *.vimrc*.

(If you want to have gromacs macros always allowed, move gromacs.vim from
*~/.vim/ftplugin* to *~/.vim/plugin*)

Completion
~~~~~~~~~~

To activate contextual completion in mdp files, add the following line in your
*.vimrc*:

::

    autocmd FileType mdp.gromacs set omnifunc=mdpcomplete#Complete

Then completion is triggered in insert mode by <C-x><C-o>.

Fix number of atoms when saving gro file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To automatically fix the number of atoms in gro files at saving time add the following line to your *.vimrc*:

::

    autocmd BufWritePre *.gro call Update_number_of_atoms()

You can also update the number of atoms by using the "Unatoms" command.

Tricks
-------

Change the shortcut for completion
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The shortcut that trigger the contextual completion in MDP files is long to
type. It can be changed however. With the following instruction in your
*.vimrc*, <C-n> will trigger the completion. The change will be active only for
MDP files.

::

    autocmd FileType mdp.gromacs imap <C-n> <C-x><C-o>

Suggest values when you type =
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To have the possible values suggested when you write the = in a MDP file, just
add the following line in your *vimrc*:

::

    autocmd FileType mdp.gromacs imap <silent> <buffer> = = <C-X><C-O>

Complete as you type
~~~~~~~~~~~~~~~~~~~~

In addition to the previous trick you might want the completion pop-up to
appears as you type. To get this you will need the `AutoComplPop
<http://www.vim.org/scripts/script.php?script_id=1879>`_ plugin which depends
to the `L9 <http://www.vim.org/scripts/script.php?script_id=3252>`_ one. Once
you have this plugin installed, add the following instructions to your
*.vimrc*:

::

    function! Meet(text)
        return len(a:text)
    endfunction

    function! DoNothing()
        return 1
    endfunction

    let g:acp_behavior = {'mdp.gromacs': [{'command' : "\<C-x>\<C-o>",
        \ 'commandfunc': 'mdpcomplete#Complete',
        \ 'meets': 'Meet', 'onPopupClose': 'DoNothing', 'repeat': 1}]}

Usage
-----

Shortcuts for the macros:

* ]; -- Comment the selection
* ]: -- Uncomment the selection
* ]j -- Jump to the next section
* ]k -- Jump to the previous section

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


