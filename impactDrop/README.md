This is README file of software FreeFEM-NS-CH drop impact example.

It is recommended to run the software in Linux or WSL environment.
Make sure that you have access to up to date FreeFEM installation.
The published results were obtained with FreeFEM v4.6.

To execute the simulation, enter the following in the command line:
> FreeFem++ -ne PFsolver_NSandCH_dropImpact.edp

The simulation will outout some statistics for each time step on screen,
as well as saved to file "stats.txt". Each 0.02 time units (variable tout)
the FEM mesh, data and VTK file is outputted to "data" directory. If
directory "data" is missing, create it before launching the simulation.

The impact speed can be adjusted by changing variable "Uimp" on
line . If simulations has been stopped, it can be restarted from
previous FEM output by changing variable "bNew" (line 88)
from 1 to 0.

There are three include files:
1. include_postProc.idp -- some useful post-processing routines
2. include_surface_def.idp -- surface definition of all rough surface segments
3. include_surface_msh.idp -- mesh definition including all rough surface segments

The last two include files are generated with python script "gen_bndDef.sh".
It can be used to regenerate the surface definition, if number of rough
pillars is changed. Note that the user is responsible to match parameters
defined in "gen_bndDef.sh" with those in "PFsolver_NSandCH_dropImpact.edp".
