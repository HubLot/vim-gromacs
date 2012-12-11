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
syn match mdpValue       "= *[^=\t;]\+" contains=mdpEqual,mdpValueName
syn match mdpEqual       "=" contained
syn match mdpValueName   "[^=\t;]\+" contained  


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

syntax/xvg.vim	[[[1
50
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
" " Language:           Xvg, Gromacs formated data files
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
syn match xvgInstruction "@.*$" contains=xvgString,xvgKeywords,xvgArguments,xvgBoolean,xvgWith
syn match xvgString "\".*\"" contained
syn keyword xvgKeywords TYPE title subtitle xaxis yaxis view legend world linestyle linewidth color box contained
syn keyword xvgArguments label box loctype length xy nxy xmin xmax ymin ymax string fill patern contained
syn keyword xvgBoolean on off contained
syn keyword xvgWith with contained

let b:current_syntax = "gro"

" "Highlights colors
hi def link xvgComment          Comment
hi def link xvgInstruction      Special
hi def link xvgString           String
hi def link xvgKeywords         Keyword
hi def link xvgArguments        Type
hi def link xvgBoolean          Boolean
hi def link xvgWith             Conditional


ftdetect/gromacs.vim	[[[1
22
" Molecular Dynamics Parameter file (mdp)
au BufNewFile,BufRead *.mdp    setf mdp.gromacs
au BufNewFile,BufRead *.MDP    setf mdp.gromacs

" Index file (ndx)
au BufNewFile,BufRead *.ndx    setf ndx.gromacs
au BufNewFile,BufRead *.NDX    setf ndx.gromacs

" Topology file (top, itp)
au BufNewFile,BufRead *.top    setf top.gromacs
au BufNewFile,BufRead *.TOP    setf top.gromacs

au BufNewFile,BufRead *.itp    setf top.gromacs
au BufNewFile,BufRead *.ITP    setf top.gromacs

" Coordinate file (gro)
au BufNewFile,BufRead *.gro    setf gro.gromacs
au BufNewFile,BufRead *.GRO    setf gro.gromacs

" Coordinate file (gro)
au BufNewFile,BufRead *.xvg    setf xvg
au BufNewFile,BufRead *.XVG    setf xvg
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
ftplugin/gro.vim	[[[1
26
if exists("b:loaded_gro_plugin")
  finish
endif
let b:loaded_gro_plugin = 1

function Number_of_atoms()
    let line_idx = line('$')
    while len(getline(line_idx)) == 0
        let line_idx -= 1
    endwhile
    let natoms = line_idx - 3
    return natoms
endfunction

function Declared_number_of_atoms()
    return substitute(getline(2), ' ', '', 'g')
endfunction

function Update_number_of_atoms()
    if Declared_number_of_atoms() - Number_of_atoms() != 0
        call setline(2, Number_of_atoms())
        echo "Number of atoms updated!"
    endif
endfunction

command Unatoms call Update_number_of_atoms()
ftplugin/top.vim	[[[1
9
if exists("b:loaded_top_plugin")
  finish
endif
let b:loaded_top_plugin = 1

let b:current_file=fnamemodify(expand("<sfile>"), ":h")."/top.dict"
echomsg b:current_file
execute "setlocal dictionary+=".b:current_file
setlocal complete+=k
ftplugin/top.dict	[[[1
24
[ angles ]
[ angletypes ]
[ atoms ]
[ atomtypes ]
[ bonds ]
[ bondtypes ]
[ cmaptypes ]
[ constraints ]
[ constrainttypes ]
[ defaults ]
[ dihedrals ]
[ dihedraltypes ]
[ dummies3 ]
[ exclusions ]
[ implicit_genborn_params ]
[ moleculetype ]
[ nonbond_params ]
[ pairs ]
[ pairtypes ]
[ polarization ]
[ position_restraints ]
[ settles ]
[ virtual_sites3 ]
[ water_polarization ]
autoload/mdp_complete.py	[[[1
335
#!/usr/bin/env python
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# A copy of the GNU General Public License is available at
# http://www.gnu.org/licenses/gpl-3.0.html.

"""
Contextual completion for mdp files.
"""

__author__ = 'Jonathan Barnoud'

import vim

MDP = {
    # Preprocessing
    'include': [],
    'define': ['-DFLEXIBLE', '-DPOSRES'],
    # Run control
    'integrator': ['md', 'md_vv', 'md_vv_avek', 'sd', 'sd1', 'bd', 'steep',
                   'cg', 'l_bfgs', 'nm', 'tpi', 'tpic'],
    'tinit': [],
    'dt': [],
    'nsteps': [],
    'init_step': [],
    'comm_mode': ['linear', 'angular', 'no'],
    'nstcomm': [],
    'comm_grps': [],
    # Langevin dynamics
    'bd_fric': [],
    'ld_speed': [],
    # Energy minimization
    'emtol': [],
    'emstep': [],
    'nstcgsteep': [],
    'nbfgscorr': [],
    # Shell mMlecular Dynamics
    'emtol': [],
    'niter': [],
    'fcstep': [],
    # Test particle insertion
    'rtpi': [],
    # Output control
    'nstxout': [],
    'nstvout': [],
    'nstfout': [],
    'nstlog': [],
    'nstcalcenergy': [],
    'nstenergy': [],
    'nstxtout': [],
    'xtc_precision': [],
    'xtc_grps': [],
    'energygrps': [],
    # Neighbor searching
    'nstlist': [],
    'ns_type': ['grid', 'simple'],
    'pbc': ['xyz', 'no', 'xy'],
    'periodic_molecules': ['no', 'yes'],
    'rlist': [],
    'rlistlong': [],
    # Eectrostatics
    'coulombtype': ['cut_off', 'ewald', 'pme', 'pppm', 'reaction_field',
                    'generalized_reaction_field', 'reaction_field_zero',
                    'reaction_field_nec', 'shift', 'encad_shift', 'switch',
                    'user', 'pme_switch', 'pme_user', 'pme_user_switch'],
    'rcoulomb_switch': [],
    'rcoulomb': [],
    'epsilon_r': [],
    'epsilon_rf': [],
    # VdW
    'vdwtype': ['cut_off', 'shift', 'switch', 'encad_shift', 'user'],
    'rvdw_switch': [],
    'rvdw': [],
    'dispcorr': ['no', 'enerpres', 'ener'],
    # Tables
    'table_extension': [],
    'energygrp_table': [],
    # Ewald
    'fourierspacing': [],
    'fourier_nx': [],
    'fourier_ny': [],
    'fourier_nz': [],
    'pme_order': [],
    'ewald_rtol': [],
    'ewald_geometry': ['3d', '3dc'],
    'epsilon_surface': [],
    'optimize_fft': ['no', 'yes'],
    # Temperature coupling
    'tcoupl': ['no', 'berendsen', 'nose_hoover', 'v_rescale'],
    'nsttcouple': [],
    'nh_chain_length': [],
    'tc_grps': [],
    'tau_t': [],
    'ref_t': [],
    # Pressure coupling
    'pcoupl': ['no', 'berendsen', 'parrinello_rahman', 'mttk'],
    'pcoupltype': ['isotropic', 'semiisotropic', 'anisotropic',
                   'surface_tension'],
    'nstpcouple': [],
    'tau_p': [],
    'compressibility': [],
    'ref_p': [],
    'refcood_scaling': ['no', 'all', 'com'],
    # Simulated annealing
    'annealing': ['no', 'single', 'periodic'],
    'annealling_npoints': [],
    'annealing_time': [],
    'annealing_temp': [],
    # Velocity generation
    'gen_vel': ['no', 'yes'],
    'gen_temp': [],
    'gen_seed': [],
    # Bonds
    'constraints': ['none', 'hbonds', 'all_bonds', 'h_angles', 'all_angles'],
    'contraint_algorithm': ['lincs', 'shake'],
    'continuation': ['no', 'yes'],
    'shake_top': [],
    'lincs_order': [],
    'links_iter': [],
    'links_warnangle': [],
    'morse': ['no', 'yes'],
    # Energy group exclusions
    'energygrp_excl': [],
    # Walls
    'nwalls': [],
    'wall_atomtype': [],
    'wall_type': ['9_3', '10_4', '12_6', 'table'],
    'wall_r_linpot': [],
    'wall_density': [],
    'wall_ewald_zfac': [],
    # COM pulling
    'pull': ['no', 'umbrella', 'constraint', 'constant_force'],
    'pull_geometry': ['distance', 'direction', 'direction_periodic',
                      'cylinder', 'position'],
    'pull_dim': [],
    'pull_r1': [],
    'pull_r0': [],
    'pull_constr_tol': [],
    'pull_start': ['no', 'yes'],
    'pull_nstxout': [],
    'pull_nstfout': [],
    'pull_ngroups': [],
    'pull_group0': [],
    'pull_weights0': [],
    'pull_pbcatom0': [],
    'pull_group1': [],
    'pull_weights1': [],
    'pull_pbcatom1': [],
    'pull_vec1': [],
    'pull_init1': [],
    'pull_rate1': [],
    'pull_k1': [],
    'pull_kb1': [],
    'disre': ['no', 'simple', 'ensemble'],
    'disre_weighting': ['conservating', 'equal'],
    'disre_mixed': ['no', 'yes'],
    'disre_fc': [],
    'disre_tau': [],
    'nstdisreout': [],
    'orire': ['no', 'yes'],
    'orire_fc': [],
    'orire_tau': [],
    'orire_fitgrp': [],
    'nstorireout': [],
    # Free energy calculations
    'free_energy': ['no', 'yes'],
    'init_lambda': [],
    'delta_lambda': [],
    'foreign_lambda': [],
    'dhdl_derivatives': [],
    'sc_alpha': [],
    'sc_power': [],
    'sc_sigma': [],
    'couple_moltype': [],
    'couple_lambda0': ['vdw_q', 'vdq', 'q', 'none'],
    'couple_lambda1': ['vdw_q', 'vdw', 'q', 'none'],
    'couple_intramol': ['no', 'yes'],
    'nstdhdl': [],
    'separate_dhdl_file': ['yes', 'no'],
    'dh_hist_size': [],
    'dh_hist_spacing': [],
    # Non-equilibrium MD
    'acc_grps': [],
    'accelerate': [],
    'freezegrps': [],
    'freezedim': [],
    'cos_accelaration': [],
    'deform': [],
    # Electric fields
    'e_x': [],
    'e_y': [],
    'e_z': [],
    'e_xt': [],
    'e_yt': [],
    'e_zt': [],
    # Mixed quantum/classical molecular dynamics
    'qmmm': ['no', 'yes'],
    'qmmm_grps': [],
    'qmmmscheme': ['normal', 'oniom'],
    'qmmethod': ['am1', 'pm3', 'rhf', 'uhf', 'dft', 'b3lyp', 'mp2',
                 'casscf', 'mmvb'],
    'qmbasis': ['sto_3g', '3_21g', '3_21g*', '3_21+g', '6_21g', '6_31g',
                '6_31g*', '6_31+g*', '6_311g'],
    'qmcharge': [],
    'qmmult': [],
    'casorbitals': [],
    'caselectrons': [],
    'sh': ['no', 'yes'],
    # Implicit solvent
    'implicit_solvent': ['no', 'gbsa'],
    'gb_algorithm': ['still', 'hct', 'obc'],
    'nstgbradii': [],
    'rgbradii': [],
    'gb_epsilon_solvent': [],
    'gb_slatconc': [],
    'gb_obc_alpha': [],
    'gb_obc_beta': [],
    'gb_obc_gamma': [],
    'gb_dielectric_ofset': [],
    'sa_algorithm': ['ace_approximation', 'none'],
    'sa_surface_tension': [],
    # User defined thingies
    'user1_grps': [],
    'user2_grps': [],
    'userint1': [],
    'userint2': [],
    'userint3': [],
    'userint4': [],
    'userreal1': [],
    'userreal2': [],
    'userreal3': [],
    'userreal4': [],
}


def normalize_name(name):
    """
    Normalize a name by using lower case and replacing every "-" by "_".

    :Parameter:
        - name: the name to normalize

    :Return:
        - the normalized name
    """
    return name.lower().replace("-", "_")


def get_start(line, cursor):
    """
    Find the cursor position at the beginning of the word that will be
    completed.

    This represent the case where the completion function is called by vim
    with findstart = 1.

    :Parameters:
        - line: the content of the current line
        - cursor: the current position of the cursor on the line

    :Return:
        - the position at which the completion should start, -1 if no
          completion is possible
    """
    for idx, character in enumerate(line[cursor::-1]):
        index = cursor - idx
        if character in "= ":  # Beginning of a value
            return index
        if character == ";":   # No completion for comments
            return -1
        if index == 0:         # Beginning of a keyword (beginning of the line)
            return index
    return 0


def get_completions(base, line, cursor, mdp_options):
    """
    Suggest possible match.

    :Parameters:
        - base: beginning of the word to complete
        - line: content of the current line
        - cursor: current position of the cursor on the line
        - mdp_options: mdp options definition

    :Return:
        - a list of match depending of the context (keyword or value)
    """
    start = get_start(line, cursor)
    # Clean base
    if len(base) > 0 and base[0] == "=":
        base = base[1:]
    base = base.strip()
    # If we previously figured out that we do not want or that we can not
    # complete, it is not worth to try now
    if start < 0:
        return []

    # Identify the context (keyword or value?)
    if start == 0:
        possibilities = mdp_options.iterkeys()
    else:
        equal_pos = line.find("=")
        if equal_pos < 0:
            return []
        keyword = normalize_name(line[0:equal_pos].strip())
        possibilities = mdp_options.get(keyword, [])

    # Return the match
    return [item for item in possibilities if
            item.startswith(normalize_name(base))]


def vim_complete():
    """
    The function called from vim.
    """
    findstart = int(vim.eval('a:findstart'))
    base = vim.eval('a:base')
    line = vim.eval('getline(".")')
    cursor = int(vim.eval("col('.')")) - 1
    if findstart:
        start = get_start(line, cursor)
        vim.command('let l:result = %d' % start)
    else:
        completions = get_completions(base, line, cursor, MDP)
        vim.command('let l:result = %s' % completions)
autoload/mdpcomplete.vim	[[[1
19
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
