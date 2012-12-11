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
