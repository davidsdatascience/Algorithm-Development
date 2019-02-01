︠00bcfeb7-cd2a-465a-b1c0-cbca660780bes︠
import numpy
import sympy
import pylab as pl
from sympy import symbols
from sympy import pi
from sympy.physics.quantum.spin import Rotation

J=0
wignerd_data=[]
J_data=[]


for J in range(1,100, pi/2):
    rot = Rotation.D(J, 1, 0, pi, pi/2, 0)
    wignerd = rot.doit()
    wignerd_data.append(wignerd)
    J_data.append(J)


pl.plot(J_data,wignerd_data)
pl.xlabel('J')
pl.ylabel('Wigner D')
pl.title('wigner D matrix vs J')
pl.show()
︡dab05642-fe5d-41ae-9df2-bbbcc8f47194︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f70e925e490>]\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e8962bd0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e9304690>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e92bb150>\n"}︡{"once":false,"file":{"show":true,"uuid":"1c013114-df58-49fd-8e22-4cc60e33459f","filename":"9410bc64-e221-4b8c-ace1-d8da30934d8a.svg"}}︡
︠8874c9b3-e8f1-4b7b-9503-6cdf76d5c865s︠
#spectrum of the area operator for U(1)

Bh=1
hbar= 1
mu=1
k=1

u1area_data=[]
k_data=[]

for k in range(1,100):
    u1area =numerical_approx((Bh*hbar/mu)*numpy.absolute((2-2*cos(k*mu))), digits=5)
    #print u1area
    k_data.append(k)
    u1area_data.append(u1area)


pls=pl.plot(k_data,u1area_data)
pl.xlabel('k')
pl.ylabel('U(1) area')
pl.title('U(1) area  vs k')
pl.show(pls)
︡3aa44d44-b33c-40c0-a1df-d5655c0ca010︡{"stdout":"<matplotlib.text.Text object at 0x7f70e8a20450>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e91e0ed0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e8a39e10>\n"}︡{"once":false,"file":{"show":true,"uuid":"673737f5-4f69-4a7c-bf2f-9519a72dab5c","filename":"bb52269a-d4ab-48b2-8918-49e8a8eb74de.svg"}}︡
︠016ebed4-3853-432b-bfd9-1f3cd38a4074s︠
#spectrum of the area operator for U(1)


def my_range(start, end, step):
    while start <= end:
        yield start
        start += step


Bh=1
hbar= 1
#mu=0.3
k=0.1

u1area_data=[]
k_data=[]

u1area_data1=[]
k_data1=[]

u1area_data2=[]
k_data2=[]

for k in my_range(0,10,0.1):
    mu=0.1
    u1area =sqrt(numerical_approx((Bh*hbar/mu)*numpy.absolute((2-2*cos(k*mu))), digits=5))
    #print u1area
    k_data.append(k)
    u1area_data.append(u1area)

for k in my_range(0,10,0.1):
    mu=0.3
    u1area =sqrt(numerical_approx((Bh*hbar/mu)*numpy.absolute((2-2*cos(k*mu))), digits=5))
    #print u1area
    k_data1.append(k)
    u1area_data1.append(u1area)


for k in my_range(0,10,0.1):
    mu=0.5
    u1area =sqrt(numerical_approx((Bh*hbar/mu)*numpy.absolute((2-2*cos(k*mu))), digits=5))
    #print u1area
    k_data2.append(k)
    u1area_data2.append(u1area)


pls=pl.plot(k_data,u1area_data, 'r')
pls=pl.plot(k_data1,u1area_data1, 'b')
pls=pl.plot(k_data2,u1area_data2, 'g')
pl.xlabel('k')
pl.ylabel('U(1) area')
pl.title('U(1) area  vs k')
pl.show(pls)
︡4518e4f9-eb95-4863-9a25-99ed89adea1c︡{"stdout":"<matplotlib.text.Text object at 0x7f70e8b76750>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e8b4b910>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7f70e8ac1350>\n"}︡{"once":false,"file":{"show":true,"uuid":"b8dfe546-f048-4079-ad66-230a613da594","filename":"6dbbbee0-b18d-42da-ba39-02a93da36930.svg"}}︡
︠7f0574f1-a8d7-4f1b-af74-8589b54d4776︠









