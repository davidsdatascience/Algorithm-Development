︠79df33eb-c232-41b8-a455-4fd8320114f5︠
#In this file we compute the expectation values of R on "Carlo-Speziale" semi-classical states, for different values of the spins in the case of a simple graph : a monochromatic 4 - valent node dual to an equilateral tetrahedron.

import numpy

j0=1.0

i,j,k = var('i,j,k')

#(*Angles of the classical configuration*)
#Theta1=arccos(sqrt(2)/3)
#Phi1= arccos(sqrt(6/7))
#Theta2 =arccos(sqrt(2)/3)
##Phi2=arccos(-sqrt(6/70))
#Theta3 =arccos(1/3) + pi/2
#Phi3= pi/2
#Theta4 = pi/2
#Phi4 = 3*pi/2


#a1=sin(Theta1)* cos(Phi1)
#a2=sin(Theta1)* sin(Phi1),
#a3=cos(Theta1) + sin(Theta2)* cos(Phi2)
#a4=sin(Theta2)* sin(Phi2)
#a5=cos(Theta2) + sin(Theta3)*cos(Phi3)
#a6=sin(Theta3)*sin(Phi3)
#a7=cos(Theta3) + sin(Theta4)*cos(Phi4)
#a8= sin(Theta4)*sin(Phi4)
#a9=cos(Theta4)


Q=matrix(CDF,[[sum((I/(sqrt(4*k^2 - 1)))*(k^2)*(2*j0+1+k)*(2*j0+1-k)*(kronecker_delta(i, k)*kronecker_delta(k - 1,j)-kronecker_delta(i, k - 1)*kronecker_delta(k, j)), k, 1, 2*j0+1)  for i in range(0,2*j0+1)] for j in range(0,2*j0+1)])




Eva=Q.eigenvalues()
Eve=vector(CC,Q.eigenvectors_left())
#normEve=Eve.norm()


numQ=numerical_approx(Q, digits=6)
EvaQ=numQ.eigenvalues()
EveQ=Q.eigenvectors_right()


B=matrix([[kronecker_delta(i, j)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])




H=matrix([[kronecker_delta(i,j)*((j0^2)*(j0 + 1)^2 - (i*(i + 1) - 2*j0*(j0 + 1))^2/4 - (i*(i + 1) - 2*j0*(j0 + 1))/2)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

#develope scalr product
nbcols=B.ncols()
nbrows=B.nrows()
bcols=B.columns()
brows=B.rows()


sca=sum((vector(EvaQ)).dot_product(vector(brows[i])) for i in range(0, 2*j0))

print "Eva=", Eva
print "Eve=", Eve
print "Number of B columns =", B.ncols()
print "Number of B rows =", B.nrows()
print "B column=", B.columns()
print "B rows=", B.rows()
print vector(brows[0])
print EveQ
print "scalar product=", sca








def sumEvaQ(EvaQ):
    d=len(EvaQ)
    v=list()
    for x in range(d):
        if EvaQ[x]!=0:
            v.append(1/(sqrt(abs(EvaQ[x]))))
            #print "k=", x, "v=",v
    s=sum([v[k] for k in range(0,d-1)])
    return s
ss=sumEvaQ(EvaQ)




lamb = matrix([[ss*kronecker_delta(i,j)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])
lsquared=matrix(lamb)*matrix(H)*kronecker_delta(i,j)
#print "L squared = ", lsquared
e=matrix([[kronecker_delta(i, j)*arccos(i*(i + 1)/(2*j0*(j0 + 1)) - 1)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])
Le = (1/2)*(lsquared*e + e*lsquared)# Le is the Ricci operator for one edge of the tetrahedron

R=matrix(CDF,[[2*Le[(i,j)]+2*sum(sqrt(2*i+1)*sqrt(2*j+1)*sqrt(2*h + 1)*sqrt(2*t +1)* ((-1)^(t + h) + (-1)^(i + j + t + h))*wigner_6j(j0,j0, i,j0, j0, t)*wigner_6j(j0, j0, j,j0, j0, h)*Le[(h,t)] for h in range(0,2*j0+1)for t in range(0,2*j0+1))for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])


  #      #i + 1]], {i, 0, x}]/(Pi x/Sqrt[3])^(1/4)]];

#print "Theta1=", Theta1
#print "Phil=", Phi1
#print "Theta2=", Theta2
#print "Phi2=", Phi2
#print "Theta3=", Theta3
#print "Phi3=", Phi3
#print "Theta4=", Theta4
#print "Phi4=", Phi4

#print "a1=", a1
#print "a2=", a2
#print "a3=", a3
#print "a4=", a4
#print "a5=", a5
#print "a6=", a6
#print "a7=", a7
#print "a8=", a8
#print "a9=", a9


print "B=", B
print "Q=", Q
print "numQ=",numQ
print "EvaQ=", EvaQ
print "EveQ=", EveQ[2]
print "lambda=", lamb
print "L squared = ", lsquared
print "R=", R



︡608c094c-77c4-416b-a08c-03e006612300︡{"stderr":"Error in lines 25-26\nTraceback (most recent call last):\n  File \"/projects/4dba49b8-22b8-4e2c-b9ba-9311f4fced28/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"free_module_element.pyx\", line 496, in sage.modules.free_module_element.vector (sage/modules/free_module_element.c:4831)\n  File \"free_module_element.pyx\", line 593, in sage.modules.free_module_element.prepare (sage/modules/free_module_element.c:5322)\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/structure/sequence.py\", line 300, in Sequence\n    return Sequence_generic(x, universe, check, immutable, cr, cr_str, use_sage_types)\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/structure/sequence.py\", line 504, in __init__\n    x = [universe(t) for t in x]\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/rings/complex_field.py\", line 351, in __call__\n    return Parent.__call__(self, x)\n  File \"parent.pyx\", line 1070, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:8858)\n  File \"coerce_maps.pyx\", line 95, in sage.structure.coerce_maps.DefaultConvertMap_unique._call_ (sage/structure/coerce_maps.c:4206)\n  File \"coerce_maps.pyx\", line 90, in sage.structure.coerce_maps.DefaultConvertMap_unique._call_ (sage/structure/coerce_maps.c:4113)\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/rings/complex_field.py\", line 393, in _element_constructor_\n    return complex_number.ComplexNumber(self, x)\n  File \"complex_number.pyx\", line 176, in sage.rings.complex_number.ComplexNumber.__init__ (sage/rings/complex_number.c:3866)\nValueError: too many values to unpack (expected 2)\n"}︡
︠df509d23-c7ec-4ee6-bfa9-51c634416188︠
︡dccf328b-dbe3-42b5-9982-912ab087e5c8︡
︠80e6e445-b8a3-452f-ad34-4b3bc09637db︠









