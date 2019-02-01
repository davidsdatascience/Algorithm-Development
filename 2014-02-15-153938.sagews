︠2ab6edfe-13dc-4ee5-ad5d-574eb46e2e50︠

# -*- coding: utf-8 -*-
#"""
#Created on Mon Feb 10 20:05:11 2014

#@author: David Horgan
#"""

from scipy.optimize import fsolve
import math

pt1=0.8
pt2=0.4



#sage: f(x,y) = (sin(x) + y, sin(x) - y)
#sage: minimize(norm(f), (5,4), disp = 0)
f(x,y) = (2*pt2/(1 + pt1)^2 + ((pt2)^2)  +  ((3 + x)/(1 - x))*y/sqrt(3),(1-pt1^2)- pt2^2/(1 + pt1)^2+ pt2^2 -(sqrt(1 + x)/(1 - x))*2*sqrt(2)*sqrt(1-y^2)/sqrt(3))

minimize(norm(f), (0.5,0.6), disp = 0)
#var("x, y")

#solve([2*pt2/(1 + pt1)^2 + ((pt2)^2)  +  ((3 + x)/(1 - x))*y/sqrt(3)==0,
#       (1-pt1^2)- pt2^2/(1 + pt1)^2+ pt2^2 -(sqrt(1 + x)/(1 - x))*2*sqrt(2)*sqrt(1-y^2)/sqrt(3) ==0], x, y)


#solve([sin(x)==x,y^2==x],x,y)


︡1ebc15bb-d2b5-4ed2-a6c3-aab0e3edc41b︡{"stdout":"(-9391.9419146, -847.231566319)\n"}︡
︠a797d73d-24df-41a3-9f0d-51b812c9a368︠
︡ffa96c86-32b4-43df-b9c6-ee4c9e24f0e6︡
︠e6397c31-75b2-466a-930e-abeda2d6b22f︠
︡97982417-74ac-4a7e-af03-bb0e55dc011a︡
︠590c2999-65fa-4e49-8204-394f09f9589b︠
︡2c92d4c5-2afc-4754-b083-1b7360e82fc0︡
︠934d3925-0e44-4b18-a608-bac7581d51be︠
︡dee22203-d54f-47d9-9955-f1fa31894a6a︡
︠63f18ea6-533c-4bc0-bfac-98c2f4c9ae3c︠









