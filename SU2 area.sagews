︠d2a31e3f-2b22-4d6f-b453-1aef85d5d64a︠
#https://sites.google.com/site/theodoregoetz/notes/wignerdfunction

import numpy
import sympy
import pylab as pl
from sympy import symbols
from sympy import pi
from sympy.physics.quantum.spin import Rotation

#using sympy for wigner Dmn matrix
#http://docs.sympy.org/dev/modules/physics/quantum/spin.html
#

#Rotation(pi, 0, pi/2)
#Rotation(0, 0, 0)
#a, b, c = symbols('a b c')
#Rotation(a, b, c)
#Rotation(a, b, c).inverse()

#wigner Dmn matrix
#Symbolic Wigner-D function
#from sympy.physics.quantum.spin import Rotation
#from sympy import pi, symbols
#alpha, beta, gamma = symbols('alpha beta gamma')
#Rotation.D(1, 1, 0,pi, pi/2,-pi)

#Wigner small-d function
##beta = symbols('beta')
#Rotation.d(1, 1, 0, pi/2)

#Wigner-D matrix

#from sympy.physics.quantum.spin import Rotation
#from sympy import pi
#rot1 = Rotation.D(1, 1, 0, pi, pi/2, 0)
#rot1
#rot1.doit()

#rot2 = Rotation.d(1, 1, 0, pi/2)
#rot2
#rot2.doit()
#-sqrt(2)/2

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
#J_data=[]


#for J in range(1,100, pi/2):

  #  rot = Rotation.D(J, 1, 0, pi, pi/2, 0)
    #rot = Rotation.D(1, J, 0, pi, pi/2, 0)
  #  wignerd = rot.doit()
    #print "WignerD =", wignerd
 #   wignerd_data.append(wignerd)
 #   J_data.append(J)

    #print "J =",J
#data=zip(J_data,wignerd_data)
#scatter_plot(data)

#pl.plot(J_data,wignerd_data)
#pl.xlabel('J')
#pl.ylabel('Wigner D')
#pl.title('wigner D matrix vs J')
#pl.show()
︡ef783262-278b-4eb1-aafd-e87ee2d71f29︡
︠3469ca00-f3f8-429e-9a4c-751c64d3839fs︠
import numpy as np
import sympy
import scipy
from scipy import linalg

import pylab as pl
from sympy import symbols
from sympy import pi
from sympy.physics.quantum.spin import Rotation
import itertools
import numpy.linalg

j, m, n = symbols('j m n')

def seq(start, end, step):
    assert(step != 0)
    sample_count = abs(end - start) / step
    return itertools.islice(itertools.count(start, step), sample_count)



j=1
d=2*j+1
print 'd=', d
a = np.empty([d,d])


for i in seq(-j,j,1/2):
    print 'i=', i
    m=i
    print 'm=', m
    for k in seq(-j,j,1/2):
        print 'k=',k
        n=k
        print 'n=', n
        #rot=Rotation.d(j,m,n,pi/2)
        rot=Rotation.D(j,m,n,0, pi/2,0)
        s=rot.doit()
        print 'element',m,n,'=', s
        a[m, n]=s
#print a
#eig=linalg.eigvals(a)
#eig=eigvals(a)
#eig=a.eigenvectors_right()
#print 'eigenvalues=', eig
#print 'Number of eigenvalues=',len(eig)



︡b083f778-be94-4370-bd0b-21997406d18e︡{"stdout":"d= 3\n"}︡{"stdout":"i= -1\nm= -1\nk= -1\nn= -1\nelement -1 -1 = 1/2\nk= -1/2\nn= -1/2\nelement -1 -1/2 = 0\nk= 0\nn= 0\nelement -1 0 = sqrt(2)/2\nk= 1/2\nn= 1/2\nelement -1 1/2 = 0\ni= -1/2\nm= -1/2\nk= -1\nn= -1\nelement -1/2 -1 = sqrt(2)*I*sqrt(factorial(1/2)*factorial(3/2))*binomial(2, 1/2)/4\n"}︡{"stderr":"Error in lines 20-38\nTraceback (most recent call last):\n  File \"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sagemathcloud/sage_server.py\", line 879, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 13, in <module>\n  File \"/projects/sage/sage-6.7/local/lib/python2.7/site-packages/sympy/core/expr.py\", line 224, in __float__\n    raise TypeError(\"can't convert complex to float\")\nTypeError: can't convert complex to float\n"}︡
︠d7b63728-b43f-47cb-926d-5a5815d30cef︠









