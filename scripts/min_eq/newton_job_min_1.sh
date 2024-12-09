#!/bin/bash -l

module load amber24

#export CUDA_VISIBLE_DEVICES=__FILL___

pmemd.cuda -O -i scripts/min_eq/min_1.in -o minimization/min_1/min_1.out -p force_field/box_kcl/solvated_box.prmtop -c force_field/box_kcl/solvated_box.inpcrd  -ref force_field/box_kcl/solvated_box.inpcrd -r minimization/min_1/min_1.ncrst -inf minimization/min_1/min_1.mdinfo
 
# -O - Overwrite output files
# -i   input file (md.in, which can be found above)
# -p   topology file (RAMP .prmtop)
# -c   the starting coordinate file (RAMP1_equil.rst7)
# -ref reference coordinates; use the same as the starting coordinates#
# -o   output file (RAMP1_md.out)
# -r   restart file (last set of xyz coordinates from the simulation)
# -x   file with trajectory (RAMP1_md.nc)