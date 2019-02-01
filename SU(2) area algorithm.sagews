︠a3c5af4b-a6b1-4570-ba9f-8778967dc0efs︠
import numpy
import sympy
import pylab as pl
from sympy import symbols
from sympy import pi
from sympy.physics.quantum.spin import Rotation

#using sympy for wigner Dmn matrix
#http://docs.sympy.org/dev/modules/physics/quantum/spin.html
#

Rotation(pi, 0, pi/2)
Rotation(0, 0, 0)
a, b, c = symbols('a b c')
Rotation(a, b, c)
Rotation(a, b, c).inverse()

#wigner Dmn matrix
#Symbolic Wigner-D function
from sympy.physics.quantum.spin import Rotation
from sympy import pi, symbols
alpha, beta, gamma = symbols('alpha beta gamma')
Rotation.D(1, 1, 0,pi, pi/2,-pi)

#Wigner small-d function
beta = symbols('beta')
Rotation.d(1, 1, 0, pi/2)

#Wigner-D matrix

from sympy.physics.quantum.spin import Rotation
from sympy import pi
rot = Rotation.D(1, 1, 0, pi, pi/2, 0)
rot
rot.doit()

rot = Rotation.d(1, 1, 0, pi/2)
rot

rot.doit()
-sqrt(2)/2

#wigner Dmn matrix
#Symbolic Wigner-D function
#N=320
#M=320
#n=0
#m=0
#l=20
#L=0
#Lmax
#Lmax=640
J=0
wignerd_data=[]
J_data=[]


for J in range(1,100, pi/2):

    rot = Rotation.D(J, 1, 0, pi, pi/2, 0)
    #rot = Rotation.D(1, J, 0, pi, pi/2, 0)
    wignerd = rot.doit()
    #print "WignerD =", wignerd
    wignerd_data.append(wignerd)
    J_data.append(J)

    #print "J =",J
data=zip(J_data,wignerd_data)
scatter_plot(data)

pl.plot(J_data,wignerd_data)
pl.xlabel('J')
pl.ylabel('Wigner D')
pl.title('wigner D matrix vs J')
pl.show()
︡9c82e62f-f3fe-4145-a22c-b01ac06d382c︡{"stdout":"R(pi,0,pi/2)\n"}︡{"stdout":"R(0,0,0)\n"}︡{"stdout":"R(a,b,c)\n"}︡{"stdout":"R(-c,-b,-a)\n"}︡{"stdout":"WignerD(1, 1, 0, pi, pi/2, -pi)\n"}︡{"stdout":"WignerD(1, 1, 0, 0, pi/2, 0)\n"}︡{"stdout":"WignerD(1, 1, 0, pi, pi/2, 0)\n"}︡{"stdout":"sqrt(2)/2\n"}︡{"stdout":"WignerD(1, 1, 0, 0, pi/2, 0)\n"}︡{"stdout":"-sqrt(2)/2\n"}︡{"stdout":"-1/2*sqrt(2)\n"}︡{"once":false,"file":{"show":true,"uuid":"ee1a4962-74c6-4a73-b44b-b95453f66aed","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute1-us/12834/tmp_E2QHOF.svg"}}︡{"html":"<div align='center'></div>"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f026642d150>]\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f02662a93d0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f02662c5050>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f02662eef50>\n"}︡{"once":false,"file":{"show":true,"uuid":"1c013114-df58-49fd-8e22-4cc60e33459f","filename":"4f43f23a-abd9-41ba-8f84-18cf014c10a9.svg"}}︡
︠f74b0b79-2c9b-4d27-b0ab-6b088d242613︠









