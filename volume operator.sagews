#Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard
#The dimension d of the Hilbert space H4,  d = kmax - kmin + 1
#k values k ranges from kmin to kmax in integer steps
#kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)
# the the dimension of the hilbert space is given by d = kmax -kmin + 1
#V^2 =M = 2/9(real antisymmetrix matrix)
︡c7097e69-6e0c-4faa-8cd5-db81ac37ba6b︡
︠56c94415-7f9a-4de0-af84-4f8a974fb8e5︠
import numpy
j1=1
j2=1
j3=1
j4=1
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
    c1 = -I*k
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
︡f54a66bd-cac3-4a42-b8f4-b42317073809︡{"stdout":"j1= 1\n"}︡{"stdout":"j2= 1\n"}︡{"stdout":"j3= 1\n"}︡{"stdout":"j4= 1\n"}︡{"stdout":"kmin= 0\n"}︡{"stdout":"kmax= 2\n"}︡{"stdout":"d= 3\n"}︡{"stdout":"[0 1 2]\n"}︡{"stdout":"[0.0 0.0 0.0]\n[0.0 0.0 0.0]\n[0.0 0.0 0.0]\n"}︡{"stdout":"[0]\n[0, -2/3*I*sqrt(3)]\n[0, -2/3*I*sqrt(3), -1/3*I*sqrt(15)]\n"}︡{"stdout":"[             0.0 -1.15470053838*I              0.0]\n[ 1.15470053838*I              0.0              0.0]\n[             0.0              0.0              0.0]\n[             0.0 -1.15470053838*I              0.0]\n[ 1.15470053838*I              0.0 -1.29099444874*I]\n[             0.0  1.29099444874*I              0.0]\n"}︡{"stdout":"[              0.0  -0.25660011964*I               0.0]\n[  0.25660011964*I               0.0 -0.286887655275*I]\n[              0.0  0.286887655275*I               0.0]\n"}︡{"stdout":"[0.38490017946, 2.33376116733e-17, -0.38490017946]\n"}︡{"stdout":"eigenvalue is  0.620403239401\nvolume of tetrahedron = 3.722419436e-104\neigenvalue is  4.83090174536e-09\nvolume of tetrahedron = 2.898541047e-112\n"}︡
︠0f7a1fcd-0dc7-404e-8948-f6bfffbde26c︠

︡8a01048f-9e1e-4212-b658-51d7503b4925︡
︠f42c51fe-887a-4d3a-9b01-77ed003d3186︠









