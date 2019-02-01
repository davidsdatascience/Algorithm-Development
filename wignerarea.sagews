︠c0d929f5-3ca3-45d2-8da5-f5a5140aa548s︠
import numpy
import sympy
import pylab as pl
from sympy import symbols
from sympy import pi
from sympy.physics.quantum.spin import Rotation

J=0
wignerd_data=[]
J_data=[]


for J in range(1,100, 1):
    rot = Rotation.D(J, 1, 0, 0, pi/2, 0)
    wignerd = rot.doit()
    wignerd_data.append(wignerd)
    J_data.append(J)


data=zip(J_data,wignerd_data)
scatter_plot(data)

pl.plot(J_data,wignerd_data)
pl.xlabel('J')
pl.ylabel('Wigner D')
pl.title('wigner D matrix vs J')
pl.show()
︡68cbff6d-4a80-46c8-aafd-29997369ba76︡{"once":false,"file":{"show":true,"uuid":"3beeffcd-2e17-46ca-9cc2-d817351dce10","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute1-us/15152/tmp_RuRvcy.svg"}}︡{"html":"<div align='center'></div>"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f0daaef5b90>]\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f0daaf24990>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f0daaf05cd0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f0daae87a50>\n"}︡{"once":false,"file":{"show":true,"uuid":"a5ab654f-7179-4bfe-9916-1ab0d94eaed9","filename":"f88fa67b-d36e-40c4-a976-9215181e1d79.svg"}}︡
︠ca7f8e6d-cf9d-4358-bcbe-5531ce3e6bb0︠









