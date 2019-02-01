︠79df33eb-c232-41b8-a455-4fd8320114f5︠
#In this file we compute the expectation values of R on "Carlo-Speziale" semi-classical states, for different values of the spins in the case of a simple graph : a monochromatic 4 - valent node dual to an equilateral tetrahedron.

import numpy
import scipy

j0=1.0

i,j,k = var('i,j,k')

#(*Angles of the classical configuration*)
Theta1=arccos(sqrt(2)/3)
Phi1= arccos(sqrt(6/7))
Theta2 =arccos(sqrt(2)/3)
Phi2=arccos(-sqrt(6/70))
Theta3 =arccos(1/3) + pi/2
Phi3= pi/2
Theta4 = pi/2
Phi4 = 3*pi/2


a1=sin(Theta1)* cos(Phi1)
a2=sin(Theta1)* sin(Phi1),
a3=cos(Theta1) + sin(Theta2)* cos(Phi2)
a4=sin(Theta2)* sin(Phi2)
a5=cos(Theta2) + sin(Theta3)*cos(Phi3)
a6=sin(Theta3)*sin(Phi3)
a7=cos(Theta3) + sin(Theta4)*cos(Phi4)
a8= sin(Theta4)*sin(Phi4)
a9=cos(Theta4)


Q=matrix(CDF,[[sum((I/(sqrt(4*k^2 - 1)))*(k^2)*(2*j0+1+k)*(2*j0+1-k)*(kronecker_delta(i, k)*kronecker_delta(k - 1,j)-kronecker_delta(i, k - 1)*kronecker_delta(k, j)), k, 1, 2*j0+1)  for i in range(0,2*j0+1)] for j in range(0,2*j0+1)])

D,V=scipy.linalg.eig(Q)
print "D=", D
normD=numpy.linalg.norm(D)
numpy.linalg.eig(Q)
npQ=numpy.matrix(Q)
print "normD=", normD


numQ=numerical_approx(Q, digits=6)
EvaQ=numQ.eigenvalues()
EveQ=Q.eigenvectors_right()
#diaQ=Q.diagonalize()

B=matrix([[kronecker_delta(i, j)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])




H=matrix([[kronecker_delta(i,j)*((j0^2)*(j0 + 1)^2 - (i*(i + 1) - 2*j0*(j0 + 1))^2/4 - (i*(i + 1) - 2*j0*(j0 + 1))/2)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

#develope scalr product


print "EveQ[0]=", EveQ[0]

#vector(EveQ[0]).norm()

nbcols=B.ncols()
nbrows=B.nrows()
bcols=B.columns()
brows=B.rows()






sca=sum((vector(EvaQ)).dot_product(vector(brows[i])) for i in range(0, 2*j0))


print "Number of B columns =", B.ncols()
print "Number of B rows =", B.nrows()
print "B column=", B.columns()
print "B rows=", B.rows()
print vector(brows[0])
print EvaQ
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


#SC = sum[ exp^(-(3/(4/sqrt(3)*x)) (i - x/Sqrt[3])^2 + I i (Pi/2)) B[[
        #i + 1]], {i, 0, x}]/(Pi x/Sqrt[3])^(1/4)]];

x=5
SC = sum(exp(-(3/(4/sqrt(3)*x))*(i - x/sqrt(3))^2 + I*i*(pi/2))for  i in range(0, x)) /((pi*x)/(sqrt(3)^(1/4)))

      #   /((pi*x)/(sqrt(3)^(1/4))))


         #(3^-2)# (1/sqrt(3])^2 + I i (Pi/2)) B[[
  #      #i + 1]], {i, 0, x}]/(Pi x/Sqrt[3])^(1/4)]];

print "Theta1=", Theta1
print "Phil=", Phi1
print "Theta2=", Theta2
print "Phi2=", Phi2
print "Theta3=", Theta3
print "Phi3=", Phi3
print "Theta4=", Theta4
print "Phi4=", Phi4

print "a1=", a1
print "a2=", a2
print "a3=", a3
print "a4=", a4
print "a5=", a5
print "a6=", a6
print "a7=", a7
print "a8=", a8
print "a9=", a9

print "Q=", Q
print "numQ=",numQ
print "EvaQ=", EvaQ
print "EveQ=", EveQ[2]
print "lambda=", lamb
print "L squared = ", lsquared
print "R=", R

print "SC=", numerical_approx(SC, digits =4)

︡7f736627-f02f-4a69-8099-77bbc5e4e2f5︡{"stdout":"D= [  6.92820323e+00+0.j  -5.06789870e-17+0.j  -6.92820323e+00+0.j]\n"}︡{"stdout":"(array([  6.92820323e+00+0.j,  -5.06789870e-17+0.j,  -6.92820323e+00+0.j]), array([[ 0.00000000 +4.71404521e-01j,  0.74535599 +0.00000000e+00j,\n        -0.00000000 -4.71404521e-01j],\n       [ 0.70710678 +0.00000000e+00j,  0.00000000 -4.46236946e-17j,\n         0.70710678 +0.00000000e+00j],\n       [-0.00000000 -5.27046277e-01j,  0.66666667 +0.00000000e+00j,\n         0.00000000 +5.27046277e-01j]]))\n"}︡{"stdout":"normD= 9.79795897113\n"}︡{"stdout":"EveQ[0]= (6.92820323028, [(0.471404520791*I, 0.707106781187, -0.527046276695*I)], 1)\n"}︡{"stdout":"Number of B columns = 3\n"}︡{"stdout":"Number of B rows = 3\n"}︡{"stdout":"B column= [(1, 0, 0), (0, 1, 0), (0, 0, 1)]\n"}︡{"stdout":"B rows= [(1, 0, 0), (0, 1, 0), (0, 0, 1)]\n"}︡{"stdout":"(1, 0, 0)\n"}︡{"stdout":"[6.92820, -0.000000, -6.92820]\n"}︡{"stdout":"scalar product= 6.92820\n"}︡{"stdout":"Theta1= arccos(1/3*sqrt(2))\n"}︡{"stdout":"Phil= arccos(sqrt(6/7))\n"}︡{"stdout":"Theta2= arccos(1/3*sqrt(2))\n"}︡{"stdout":"Phi2= arccos(-sqrt(3/35))\n"}︡{"stdout":"Theta3= 1/2*pi + arccos(1/3)\n"}︡{"stdout":"Phi3= 1/2*pi\n"}︡{"stdout":"Theta4= 1/2*pi\n"}︡{"stdout":"Phi4= 3/2*pi\n"}︡{"stdout":"a1= 1/3*sqrt(7)*sqrt(6/7)\n"}︡{"stdout":"a2= (1/3*sqrt(7)*sqrt(1/7),)\n"}︡{"stdout":"a3= -1/3*sqrt(7)*sqrt(3/35) + 1/3*sqrt(2)\n"}︡{"stdout":"a4= 4/3*sqrt(7)*sqrt(2/35)\n"}︡{"stdout":"a5= 1/3*sqrt(2)\n"}︡{"stdout":"a6= sin(1/2*pi + arccos(1/3))\n"}︡{"stdout":"a7= cos(1/2*pi + arccos(1/3))\n"}︡{"stdout":"a8= -1\n"}︡{"stdout":"a9= 0\n"}︡{"stdout":"Q= [             0.0  4.61880215352*I              0.0]\n[-4.61880215352*I              0.0  5.16397779494*I]\n[             0.0 -5.16397779494*I              0.0]\n"}︡{"stdout":"numQ= [  0.000000  4.61880*I   0.000000]\n[-4.61880*I   0.000000  5.16398*I]\n[  0.000000 -5.16398*I   0.000000]\n"}︡{"stdout":"EvaQ= [6.92820, -0.000000, -6.92820]\n"}︡{"stdout":"EveQ= (-6.92820323028, [(-0.471404520791*I, 0.707106781187, 0.527046276695*I)], 1)\n"}︡{"stdout":"lambda= [0.759836 0.000000 0.000000]\n[0.000000 0.759836 0.000000]\n[0.000000 0.000000 0.759836]\n"}︡{"stdout":"L squared =  [ 1.51967 0.000000 0.000000]\n[0.000000  3.03934 0.000000]\n[0.000000 0.000000  1.51967]\n"}︡{"stdout":"R= [ 23.6941204071            0.0 -3.95385493784]\n[           0.0  28.1146640778            0.0]\n[-3.95385493784            0.0  24.5782318115]\n"}︡{"stdout":"SC= 0.001771 - 0.04383*I\n"}︡
︠df509d23-c7ec-4ee6-bfa9-51c634416188︠
︡dccf328b-dbe3-42b5-9982-912ab087e5c8︡
︠80e6e445-b8a3-452f-ad34-4b3bc09637db︠
︡fea1932d-085e-4c29-8db2-adba5405de2c︡
︠c33d8b42-e211-4da1-96b4-b78b2cfa8b6c︠









