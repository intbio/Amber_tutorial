#!/bin/bash -l

module load amber24

# export CUDA_VISIBLE_DEVICES=__FILL__

pmemd.cuda -O -i scripts/min_eq/min_2.in -o minimization/min_2/min_2.out -p force_field/box_kcl/solvated_box.prmtop -c force_field/box_kcl/solvated_box.inpcrd  -ref force_field/box_kcl/solvated_box.inpcrd -r minimization/min_2/min_2.ncrst -inf minimization/min_2/min_2.mdinfo
pmemd.cuda -O -i scripts/min_eq/heat.in -o minimization/heat/heat.out -p force_field/box_kcl/solvated_box.prmtop -c minimization/min_2/min_2.ncrst  -ref minimization/min_2/min_2.ncrst -r minimization/heat/heat.ncrst -x minimization/heat/heat.nc -inf minimization/heat/heat.mdinfo
pmemd.cuda -O -i scripts/min_eq/equil.in -o minimization/equil/equil.out -p force_field/box_kcl/solvated_box.prmtop -c minimization/heat/heat.ncrst -ref minimization/heat/heat.ncrst -r minimization/equil/equil.ncrst -x minimization/equil/equil.nc -inf minimization/equil/equil.mdinfo

# -O - Overwrite output files
# -i   input file (md.in, which can be found above)
# -p   topology file (RAMP1.prmtop)
# -c   the starting coordinate file (RAMP1_equil.rst7)
# -ref reference coordinates; use the same as the starting coordinates#
# -o   output file (RAMP1_md.out)
# -r   restart file (last set of xyz coordinates from the simulation)
# -x   file with trajectory (RAMP1_md.nc)
