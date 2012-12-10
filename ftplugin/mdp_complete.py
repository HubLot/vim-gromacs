#!/usr/bin/env python

"""
This is a prototype for completeion suggestion in the context of a GROMACS mdp
file. The final purpose is to propose autocompletetion for mdp files in vim.
"""

import sys
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
    'pbd': ['xyz', 'no', 'xy'],
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
    #base = line[start:cursor+1]
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
    findstart = int(vim.eval('a:findstart'))
    base = vim.eval('a:base')
    line = vim.eval('getline(".")')
    cursor = int(vim.eval("col('.')")) - 1
    if findstart:
        start = get_start(line, cursor)
        #print >> open("vimlog", "a"), findstart, base, line, cursor, start
        vim.command('let l:result = %d' % start)
    else:
        completions = get_completions(base, line, cursor, MDP)
        #print >> open("vimlog", "a"), findstart, base, line, cursor, completions
        vim.command('let l:result = %s' % completions)


def test_cli():
    """
    Read a fake line from the command line and suggest the rest.
    """
    line = sys.argv[1]
    print line
    cursor = len(line) - 1
    base = line[get_start(line, cursor):cursor + 1]
    complete = get_completions(base, line, cursor, MDP)
    if len(complete) == 0:
        print "No completion"
    for item in complete:
        print "*", item


def hello_world(name):
    vim.command("let l:return = 'hello %s'" % name)


#if __name__ == "__main__":
#    test_cli()
