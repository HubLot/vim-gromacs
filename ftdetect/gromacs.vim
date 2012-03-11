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
