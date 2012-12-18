if exists("b:loaded_gro_plugin")
  finish
endif
let b:loaded_gro_plugin = 1

function! Number_of_atoms()
    let line_idx = line('$')
    while len(getline(line_idx)) == 0
        let line_idx -= 1
    endwhile
    let natoms = line_idx - 3
    return natoms
endfunction

function! Declared_number_of_atoms()
    return substitute(getline(2), ' ', '', 'g')
endfunction

function! Update_number_of_atoms()
    if Declared_number_of_atoms() - Number_of_atoms() != 0
        call setline(2, Number_of_atoms())
        echo "Number of atoms updated!"
    endif
endfunction

function! Translate_one(line_num, dx, dy, dz)
    let coord_index = [[20, 27], [28, 35], [36, 43]]
    let coordinates = [0, 0, 0]
    let dcoordinates = [a:dx, a:dy, a:dz]
    let line = getline(a:line_num)
    for i in [0, 1, 2]
        let coordinates[i] = str2float(substitute(
            \ line[coord_index[i][0]:coord_index[i][1]], ' ', '', 'g'))
        let coordinates[i] += dcoordinates[i]
        let line = substitute(line,
            \ '^\(.\{'.(coord_index[i][0]+1).'\}\)\(.\{7\}\)\(.*\)$',
            \ '\1'.printf('%7.3f', coordinates[i]).'\3', 'g')
    endfor
    call setline(a:line_num, line)
endfunction

function! Translate(dx, dy, dz) range
    let i = a:firstline
    while i <= a:lastline
        call Translate_one(i, a:dx, a:dy, a:dz)
        let i += 1
    endwhile
endfunction

command! Unatoms call Update_number_of_atoms()
