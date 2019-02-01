︠eae10e4f-3ee5-406a-9a6d-0ed829164ffe︠
#Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard
#The dimension d of the Hilbert space H4,  d = kmax - kmin + 1
#k values k ranges from kmin to kmax in integer steps
#kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)
# the the dimension of the hilbert space is given by d = kmax -kmin + 1
#V^2 =M = 2/9(real antisymmetrix matrix)
︡c7097e69-6e0c-4faa-8cd5-db81ac37ba6b︡
︠56c94415-7f9a-4de0-af84-4f8a974fb8e5︠
import numpy
j1=1.5
j2=1.5
j3=1.5
j4=2.5
kmin = int(max(abs(j1-j2),abs(j3 -j4)))
kmax = int(min((j1+j2),(j3 +j4)))
d = kmax -kmin + 1
print'j1=',j1
print'j2=',j2
print'j3=',j3
print'j4=',j4
print'kmin=',kmin
print'kmax=',kmax
print'd=',d


y=numpy.arange(kmin,kmax+1,1)
print y



kmatrix = matrix(CDF,int(d), int(d))
print kmatrix

r=list()
for j in range(d):
    k=int(y[j])
    c1 = -i*k
    c2 = sqrt(4*k*k - 1)
    c3 = sqrt(j1*(j1+1))
    c4 = sqrt((2*j1+1))
    c5 = sqrt(j3*(j3+1))
    c6 = sqrt((2*j3+1))
    c7 = wigner_6j(j1,1,j1,k,j2,k-1)
    c8 = wigner_6j(j3,1,j3,k,j4,k-1)
    a = c1*c2*c3*c4*c5*c6*c7*c8
    r.append(a)
    q=numerical_approx(a, digits=10)
    print r

for j in range(d-1):
    kmatrix[[j],[j+1]]=r[j+1]
    kmatrix[[j+1],[j]]=-r[j+1]
    print kmatrix



M = (2/9)*kmatrix
print M
s=M.eigenvalues()
print s

gamma =numerical_approx( ln(2)/(pi*sqrt(2)))
G = 6.63*10^-11
hbar= (1.61619926*10^-35)/(2*pi)
#gamma is Immirzi parameter
lp3=6*10^-104
#sage: const1 = sqrt((8*pi*G*hbar*gamma)^3)
for j in range(d):
    e= sqrt(s[j])
    if imag(e)==0:
        print "eigenvalue is ", (e)
        vol=lp3*e
        volume= numerical_approx(vol, digits=10)
        print "volume of tetrahedron =", volume


︡83004161-f008-4f43-8a85-b6e5f967bf8b︡{"stdout":"j1= 1.50000000000000\n"}︡{"stdout":"j2= 1.50000000000000\n"}︡{"stdout":"j3= 1.50000000000000\n"}︡{"stdout":"j4= 2.50000000000000\n"}︡{"stdout":"kmin= 1\n"}︡{"stdout":"kmax= 3\n"}︡{"stdout":"d= 3\n"}︡{"stdout":"[1 2 3]\n"}︡{"stdout":"[0.0 0.0 0.0]\n[0.0 0.0 0.0]\n[0.0 0.0 0.0]\n"}︡{"stdout":"[0]\n[0, 21.0000000000000*I*sqrt(15)*sqrt(1/5)*sqrt(1/105)]\n[0, 21.0000000000000*I*sqrt(15)*sqrt(1/5)*sqrt(1/105), 1260.00000000000*I*sqrt(35)*sqrt(1/5)*sqrt(1/35)*sqrt(1/105)*sqrt(1/210)]\n"}︡{"stdout":"[             0.0  3.54964786986*I              0.0]\n[-3.54964786986*I              0.0              0.0]\n[             0.0              0.0              0.0]\n[             0.0  3.54964786986*I              0.0]\n[-3.54964786986*I              0.0   3.7947331922*I]\n[             0.0  -3.7947331922*I              0.0]\n"}︡{"stdout":"[              0.0  0.788810637747*I               0.0]\n[-0.788810637747*I               0.0  0.843274042712*I]\n[              0.0 -0.843274042712*I               0.0]\n"}︡{"stdout":"[1.15470053838, 4.34585381223e-17, -1.15470053838]\n"}︡{"stdout":"eigenvalue is  1.07456993182\nvolume of tetrahedron = 6.447419591e-104\neigenvalue is  6.59230901296e-09\nvolume of tetrahedron = 3.955385408e-112\n"}︡
︠5d489c50-96c8-4266-833a-f2778f6198d4︠
︡4aa8ce9a-b340-4a4b-87a0-d25ba717af20︡
︠557e17be-3ea1-402a-b3c6-4d2bd07785f0︠
︡9459013f-692b-4af5-8892-0b777f6f0db9︡
︠23eda0ed-7a2b-4b65-8d55-b3ef8d95a896︠









