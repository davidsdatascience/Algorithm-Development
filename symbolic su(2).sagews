︠08aa614c-6a45-49cf-b173-f2dc312a775ds︠
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

rot=Rotation.D(j,m,n,0, pi/2,0)
s=rot.doit()
print 'element',m,n,'=', s


#j=j
#d=2*j+1
#print 'd=', d
#a = np.empty([d,d])


#for i in seq(-j,j,1):
 #   print 'i=', i
 #   m=i
  #  print 'm=', m
  #  for k in seq(-j,j,1):
  #      print 'k=',k
   #     n=k
   #     print 'n=', n
    #    #rot=Rotation.d(j,m,n,pi/2)
    #    rot=Rotation.D(j,m,n,0, pi/2,0)
     #   s=rot.doit()
     #   print 'element',m,n,'=', s
        #a[m, n]=s
#print a
#eig=linalg.eigvals(a)
#eig=eigvals(a)
#eig=a.eigenvectors_right()
#print 'eigenvalues=', eig
#print 'Number of eigenvalues=',len(eig)
︡bf08306b-68de-4418-9a32-5ebff223b5ba︡{"stderr":"Error in lines 17-17\nTraceback (most recent call last):\n  File \"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sagemathcloud/sage_server.py\", line 879, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/sage/sage-6.7/local/lib/python2.7/site-packages/sympy/physics/quantum/spin.py\", line 852, in doit\n    return WignerD(*self.args, **hints)\n  File \"/projects/sage/sage-6.7/local/lib/python2.7/site-packages/sympy/physics/quantum/spin.py\", line 778, in __new__\n    return Expr.__new__(cls, *args)._eval_wignerd()\n  File \"/projects/sage/sage-6.7/local/lib/python2.7/site-packages/sympy/physics/quantum/spin.py\", line 863, in _eval_wignerd\n    'j parameter must be numerical to evaluate, got %s' % j)\nValueError: j parameter must be numerical to evaluate, got j\n"}︡
︠1d0002c1-4594-4ed0-bf10-d51177c3c6c7︠









