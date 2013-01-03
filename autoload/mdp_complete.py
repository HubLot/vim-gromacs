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
    'refcoord_scaling': ['no', 'all', 'com'],
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
