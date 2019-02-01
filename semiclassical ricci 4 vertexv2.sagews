︠79df33eb-c232-41b8-a455-4fd8320114f5︠
#In this file we compute the expectation values of R on "Carlo-Speziale" semi-classical states, for different values of the spins in the case of a simple graph : a monochromatic 4 - valent node dual to an equilateral tetrahedron.
import numpy
import scipy

j0=2.0
print "j0=", j0
x=2*j0
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


EvaQ,EveQ=numpy.linalg.eig(Q)
print "Q=", Q
print "EvaQ=", EvaQ
print "EveQ=", EveQ
normEveQ=numpy.linalg.norm(EveQ[0])
normalisedEveQ=EveQ[0]/normEveQ
conjugateEveQ=conjugate(normalisedEveQ)
print "normalised EveQ=",normalisedEveQ

print "conjugate EveQ=",conjugateEveQ


B=matrix([[kronecker_delta(i, j)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

def lamb(EvaQ, EveQ, j0):
    d=len(EvaQ)
    v=list()
    for x in range(d):
        if abs(EvaQ[x])>0.0001:
            v.append(12/(sqrt(abs(EvaQ[x]))))
            ##print "k=", x, "v=",
            s=sum([v[k] for k in range(0,len(v))])
    return s



s=lamb(EvaQ, EveQ, j0)
print s

for row in B:
  print str(row)


lamda=matrix(CDF,[[sum( s*(numpy.dot(B.rows()[i],EveQ[k]/numpy.linalg.norm(EveQ[k])*conjugate(numpy.dot(EveQ[k]/numpy.linalg.norm(EveQ[k]),B.rows()[j]))))*kronecker_delta(i, j) for k in range(0,2*j0+1))for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

print "lamba=", lamda

H=matrix([[kronecker_delta(i,j)*((j0^2)*(j0 + 1)^2 - (i*(i + 1) - 2*j0*(j0 + 1))^2/4 - (i*(i + 1) - 2*j0*(j0 + 1))/2)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])
print "H=", H

lsquared=matrix(lamda)*matrix(H)*matrix(lamda)
print "lsquared=", lsquared

e=matrix([[kronecker_delta(i, j)*arccos(i*(i + 1)/(2*j0*(j0 + 1)) - 1)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])
print "e=", e

EvaL2,EveL2=numpy.linalg.eig(lsquared)


L=matrix(CDF,[[sum(sqrt(EvaL2[k])*(numpy.dot(B.rows()[i],EveL2[k]/numpy.linalg.norm(EveL2[k])*conjugate(numpy.dot(EveL2[k]/numpy.linalg.norm(EveL2[k]),B.rows()[j]))))*kronecker_delta(i, j) for k in range(0,2*j0+1))for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

print "L=", L

Le = (1/2)*(numpy.dot(L,e) + numpy.dot(e,L))
print "Le=", Le

#u.inner_product(v)

R=matrix(CDF,[[2*Le[(i,j)]+2*sum(sqrt(2*i+1)*sqrt(2*j+1)*sqrt(2*h + 1)*sqrt(2*t +1)* ((-1)^(t + h) + (-1)^(i + j + t + h))*wigner_6j(j0,j0, i,j0, j0, t)*wigner_6j(j0, j0, j,j0, j0, h)*Le[(h,t)] for h in range(0,2*j0+1)for t in range(0,2*j0+1))for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

print "R=", R

Riccicurvature=R.eigenvalues()
print "eigenvalues of curvature =",Riccicurvature



def curve(Riccicurvature):
    d=len(Riccicurvature)
    v=list()
    for x in range(d):
        if abs(Riccicurvature[x])>0.0001:     #suppress small values
            v.append(Riccicurvature[x])
            ##print "k=", x, "v=",

    return v


curve(Riccicurvature)

SC = (sum(exp(-(3/(4/sqrt(3)*x))*(i - x/sqrt(3))^2 + I*i*(pi/2))for  i in range(0, x)) /((pi*x)/(sqrt(3)^(1/4)))).normalize()
print "SC=", numerical_approx(SC, digits=6)


RC = numerical_approx((conjugate(SC)*SC*R), digits =6)
print "RC=", RC





︡78f8874b-beae-49f6-9292-d4f7eec68b89︡{"stdout":"j0= 2.00000000000000\n"}︡{"stdout":"Q= [             0.0  13.8564064606*I              0.0              0.0              0.0]\n[-13.8564064606*I              0.0  21.6887067388*I              0.0              0.0]\n[             0.0 -21.6887067388*I              0.0  24.3404425362*I              0.0]\n[             0.0              0.0 -24.3404425362*I              0.0  18.1422947044*I]\n[             0.0              0.0              0.0 -18.1422947044*I              0.0]\n"}︡{"stdout":"EvaQ= [  3.65456985e+01+0.j  -3.65456985e+01+0.j   1.57610888e+01+0.j\n   2.56746131e-15+0.j  -1.57610888e+01+0.j]\n"}︡{"stdout":"EveQ= [[-0.16544106 +0.00000000e+00j -0.16544106 -0.00000000e+00j\n   0.00000000 +4.89178824e-01j  0.68313005 +0.00000000e+00j\n  -0.00000000 -4.89178824e-01j]\n [ 0.00000000 +4.36343951e-01j -0.00000000 -4.36343951e-01j\n   0.55642066 +0.00000000e+00j  0.00000000 +2.37426829e-16j\n   0.55642066 +0.00000000e+00j]\n [ 0.62954772 +0.00000000e+00j  0.62954772 +0.00000000e+00j\n   0.00000000 -9.18235892e-02j  0.43643578 +0.00000000e+00j\n   0.00000000 +9.18235892e-02j]\n [ 0.00000000 -5.56420665e-01j -0.00000000 +5.56420665e-01j\n   0.43634395 +0.00000000e+00j  0.00000000 +2.73424265e-16j\n   0.43634395 +0.00000000e+00j]\n [-0.27622260 +0.00000000e+00j -0.27622260 -0.00000000e+00j\n   0.00000000 -5.02267366e-01j  0.58554004 +0.00000000e+00j\n   0.00000000 +5.02267366e-01j]]\n"}︡{"stdout":"normalised EveQ= [-0.16544106+0.j         -0.16544106+0.j          0.00000000+0.48917882j\n  0.68313005+0.j         -0.00000000-0.48917882j]\n"}︡{"stdout":"conjugate EveQ= [-0.16544106-0.j         -0.16544106-0.j          0.00000000-0.48917882j\n  0.68313005-0.j         -0.00000000+0.48917882j]\n"}︡{"stdout":"10.0153276193\n"}︡{"stdout":"(1, 0, 0, 0, 0)\n(0, 1, 0, 0, 0)\n(0, 0, 1, 0, 0)\n(0, 0, 0, 1, 0)\n(0, 0, 0, 0, 1)\n"}︡{"stdout":"lamba= [10.0153276193           0.0           0.0           0.0           0.0]\n[          0.0 10.0153276193           0.0           0.0           0.0]\n[          0.0           0.0 10.0153276193           0.0           0.0]\n[          0.0           0.0           0.0 10.0153276193           0.0]\n[          0.0           0.0           0.0           0.0 10.0153276193]\n"}︡{"stdout":"H= [ 6.00000000000000 0.000000000000000 0.000000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000  16.0000000000000 0.000000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000  30.0000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  36.0000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000 0.000000000000000  16.0000000000000]\n"}︡{"stdout":"lsquared= [ 601.840723934929 0.000000000000000 0.000000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000  1604.90859715981 0.000000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000  3009.20361967464 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  3611.04434360957 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000 0.000000000000000  1604.90859715981]\n"}︡{"stdout":"e= [ 3.14159265358979 0.000000000000000 0.000000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000  2.55590711013264 0.000000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000  2.09439510239320 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  1.57079632679490 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000 0.000000000000000 0.841068670567930]\n"}︡{"stdout":"L= [24.5324422742           0.0           0.0           0.0           0.0]\n[          0.0 40.0613104773           0.0           0.0           0.0]\n[          0.0           0.0 54.8562085791           0.0           0.0]\n[          0.0           0.0           0.0  60.091965716           0.0]\n[          0.0           0.0           0.0           0.0 40.0613104773]\n"}︡{"stdout":"Le= [[  77.07094042+0.j    0.00000000+0.j    0.00000000+0.j    0.00000000+0.j\n     0.00000000+0.j]\n [   0.00000000+0.j  102.39298829+0.j    0.00000000+0.j    0.00000000+0.j\n     0.00000000+0.j]\n [   0.00000000+0.j    0.00000000+0.j  114.89057458+0.j    0.00000000+0.j\n     0.00000000+0.j]\n [   0.00000000+0.j    0.00000000+0.j    0.00000000+0.j   94.39223902+0.j\n     0.00000000+0.j]\n [   0.00000000+0.j    0.00000000+0.j    0.00000000+0.j    0.00000000+0.j\n    33.69431314+0.j]]\n"}︡{"stdout":"R= [ 461.773443987            0.0 -65.6019619209            0.0 -4.02001283981]\n[           0.0  477.800442261            0.0 -53.2444204952            0.0]\n[-65.6019619209            0.0  566.383000719            0.0 -35.2430592227]\n[           0.0 -53.2444204952            0.0   581.31464281            0.0]\n[-4.02001283981            0.0 -35.2430592227            0.0  447.374802972]\n"}︡{"stdout":"eigenvalues of curvature = [603.812278026, 416.416162606, 455.302807046, 455.302807046, 603.812278026]\n"}︡{"stdout":"[603.812278026, 416.416162606, 455.302807046, 455.302807046, 603.812278026]\n"}︡{"stdout":"SC= -0.0723456 - 0.0258792*I\n"}︡{"stdout":"RC= [  2.72613 + 5.96046e-8*I                 0.000000 -0.387289 + 7.45058e-9*I                 0.000000               -0.0237326]\n[                0.000000   2.82075 + 5.96046e-8*I                 0.000000                -0.314335                 0.000000]\n[-0.387289 + 7.45058e-9*I                 0.000000                  3.34371                 0.000000                -0.208062]\n[                0.000000                -0.314335                 0.000000                  3.43186                 0.000000]\n[              -0.0237326                 0.000000                -0.208062                 0.000000                  2.64113]\n"}︡
︠df509d23-c7ec-4ee6-bfa9-51c634416188︠
︡ce7248a0-483b-4229-994a-41643d151a92︡
︠4f6722fa-47e9-4604-b990-e5f6522fef5c︠

︡8c44be31-1e9f-4681-b440-485a24fefee2︡
︠80e6e445-b8a3-452f-ad34-4b3bc09637db︠
︡a4c16ac3-80ab-4cea-84fe-643a33d44cbc︡
︠c33d8b42-e211-4da1-96b4-b78b2cfa8b6c︠
︡ca78336f-4d39-4db0-bec8-1893b811cc41︡
︠dd47a6f8-be77-475b-b895-d4e0932c4e48︠

︠9cd3ad67-120f-4495-a882-da31bda7dc8e︠









