︠445dd5d2-6152-4494-94c7-dde701686211︠

# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 20:05:11 2014

@author: David Horgan
"""

from scipy.optimize import fsolve
import math



#scene.range = 10

#cylinder(pos=(0,0,0), radius=1.0,axis=(0,0,1), color=color.white)

#scene2 = display(title='Examples of Tetrahedrons',
    # x=0, y=0, width=600, height=600,
    # center=(0,0,0), background=(1,1,1))

#scene2.visible = True
#scene2.range = 10




#unit circle plot
C = circle((0,0), 1)





#input points from unit circle

p1=0.6
p2=0.7


#face1
a1=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
a2=(((1 - p2**2)/(2*(1 + p1)))**(1/4),  (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0 )
a3=(((1/2)*( (1 + p1)**3)* (1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
a=[a1,a2,a3]


#face2

b1=(0, 0, 0)
b2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
b3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1-p1**2)*((1-p2**2)/(2*(1+p1)))**(1/4)  )
b=[b1,b2,b3]

#face3
c1=(0, 0, 0)
c2=( ((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
c3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4), p2*((2*(1 + p1))/(1 - p2**2))**(1/4),  sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
c=[c1,c2,c3]


#face4
d1=(0, 0, 0)
d2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
d3 =(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
d=[d1,d2,d3]

#printresults
print 'a1=', a1
print 'a2=', a2
print 'a3=', a3

print 'b1=', b1
print 'b2=', b2
print 'b3=', b3

print 'c1=', c1
print 'c2=', c2
print 'c3=', c3

print 'd1=', d1
print 'd2=', d2
print 'd3=', d3



G = Graphics()

#tetrahedron faces - coloured
P1=polygon([a1,a2, a3], color='red')
P2=polygon([b1,b2, b3],color='yellow')
P3=polygon([c1,c2, c3],color='blue')
P4=polygon([d1,d2, d3],color='green')

#polygon faces
#P1=polygon([a1,a2, a3])
#P2=polygon([b1,b2, b3])
#P3=polygon([c1,c2, c3])
#P4=polygon([d1,d2, d3])

#polygon([a1,a2, a3])
#polygon([b1,b2, b3])
#polygon([c1,c2, c3])
#polygon([d1,d2, d3])

g=G+P1+P2+P3+P4
show(g, title='tet(w)')
show(C, title='w plane')






︡a0023f6d-2860-4c2f-bef0-1eb1f02e0e95︡{"stdout":"'\\nCreated on Mon Feb 10 20:05:11 2014\\n\\n@author: David Horgan\\n'\n"}︡{"stdout":"a1= (0.631836992876155, 1.34528368801383, 0)\n"}︡{"stdout":"a2= (0.631836992876155, -0.237403003767146, 0)\n"}︡{"stdout":"a3= (1.01093918860185, 1.10788068424668, 0.505469594300924)\n"}︡{"stdout":"b1= (0, 0, 0)\n"}︡{"stdout":"b2= (0.631836992876155, -0.237403003767146, 0)\n"}︡{"stdout":"b3= (1.01093918860185, 1.10788068424668, 0.505469594300924)\n"}︡{"stdout":"c1= (0, 0, 0)\n"}︡{"stdout":"c2= (0.631836992876155, 1.34528368801383, 0)\n"}︡{"stdout":"c3= (1.01093918860185, 1.10788068424668, 0.505469594300924)\n"}︡{"stdout":"d1= (0, 0, 0)\n"}︡{"stdout":"d2= (0.631836992876155, 1.34528368801383, 0)\n"}︡{"stdout":"d3= (0.631836992876155, -0.237403003767146, 0)\n"}︡{"html":"<div id=cdd84ff5-01dc-4bc7-a0c1-0b8d346f423a style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 2.6905673760276523, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#cdd84ff5-01dc-4bc7-a0c1-0b8d346f423a').salvus_threejs(obj)"},"once":false}︡{"once":false,"file":{"show":true,"uuid":"263a6b11-4a6c-4501-a09b-61fc5c83b3b8","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/19375/tmp_XrT7W6.png"}}︡
︠7eae2c13-b822-48d6-aca8-d0dfb2908334︠
︡13b021f7-dee0-4f05-b17f-d3bec4a6cabf︡
︠fddf1bda-eee2-4bf0-a17f-505279ab30c0︠
︡bded08b5-c55e-4cf4-8eb9-068fd5660b32︡
︠689fb073-e550-44c3-b76e-25055f879f19︠
︡a028c495-88e9-45f1-8fab-48787019bf90︡
︠215e349a-c5bf-4d59-914f-c8fbebb93d0d︠
︡aab3648a-88fb-42b9-b729-c9e1fb92fe58︡
︠daa0a36f-c7bc-4f32-9ba5-9f20ee44a6d2︠
︡4320f9ae-1265-4fe0-8455-0e53b901eb87︡
︠18e97bc5-73ac-4226-8b3f-d60b86e1c868︠
︡84ff2aa6-b5e3-48a6-926e-bb292f90e568︡
︠2a333e63-bee6-43c6-9b8b-878e8b50259a︠









