#!/usr/bin/python3
# ----------------------------------------------- COPYRIGHT --------------------------------------
# Copyright 2020-2022
# Ugis Lacis, ugis.lacis@gmail.com
# Shervin Bagheri, shervin.bagheri@mech.kth.se
# -------------------------------------------- LICENSE LGPLv3 ------------------------------------
# This file is part of FreeFEM-NS-CH.
#
# Porous_full_bc2ifScales is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# FreeFEM-NS-CH is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with FreeFEM-NS-CH. If not, see <http://www.gnu.org/licenses/>.

import numpy as np

Nrep = 14

f = open("include_surface_def.idp", "w")
for i in range(Nrep):
    f.write("border bnd1%02da(t=0,ph/sin(pa))            {x=xmin+%d*pd+t*cos(pa);     y=ymin+t*sin(pa); label=1; }\n"%(i+1,i+2))
    f.write("border bnd1%02db(t=0,pw)                    {x=xmin+%d*pd+ph/tan(pa)+t;  y=ymin+ph;        label=1; }\n"%(i+1,i+2))
    f.write("border bnd1%02dc(t=ph/sin(pa),0)            {x=xmin+%d*pd+t*cos(pa)+pw;  y=ymin+t*sin(pa); label=1; }\n"%(i+1,i+2))
    f.write("border bnd1%02dd(t=xmin+%d*pd+pw,xmin+%d*pd){x=t;                        y=ymin;           label=1; }\n"%(i+1,i+2,i+3))
f.close()

f = open("include_surface_msh.idp", "w")
f.write("mesh Th = buildmesh(bnd100(2)+")
for i in range(Nrep):
    f.write("bnd1%02da(1)+bnd1%02db(1)+bnd1%02dc(1)+bnd1%02dd(1)+"%(i+1,i+1,i+1,i+1))
f.write("bnd199(2)+bnd2(n*(ymax-ymin))+bnd3(n*(xmax-xmin))+bnd4(n*(ymax-ymin)) );")
f.close()
