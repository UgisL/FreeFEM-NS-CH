This is README file of software FreeFEM-NS-CH sheared drop example.

It is recommended to run the software in Linux or WSL environment.
Make sure that you have access to up to date FreeFEM installation.
The published results were obtained with FreeFEM v4.6.

To execute the simulation, enter the following in the command line:
> FreeFem++ -ne PFsolver_NSandCH_shearedDrop.edp

The simulation will outout some statistics for each time step on screen,
as well as saved to file "stats.txt". Each 0.02 time units (variable tout)
the FEM mesh, data and VTK file is outputted to "data" directory. If
directory "data" is missing, create it before launching the simulation.
Note that smaller Ca (Sp), Cn (Tn) and Pe numbers typically require
smaller time step to ensure numerical stability. Experiment by reducing
the variable dt if your simulation is not stable.

The moving wall speed is controlled by variable Sp and the interface
thickness by variable Tn in the preable of script. Furthermore, there
are 4 different groups of parameters connected to calibrated parameters
for 4 different contact angles. Note that the weak form for the Navier-
Stokes equation has to be modified (lines 301-302) depending on value
of ls. If simulations has been stopped, it can be restarted from
previous FEM output by changing variable "bNew" (line 86)
from 1 to 0.

There are two additional files:
1. include_postProc.idp -- some useful post-processing routines
2. postProc_steadySol_extrIntf_MD.edp -- routines to extract interface shape for comparison with MD

Note that the user is responsible to match parameters
defined in "postProc_steadySol_extrIntf_MD.edp" with those
in "PFsolver_NSandCH_shearedDrop.edp".
