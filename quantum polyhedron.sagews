︠a741ba14-ab9b-4735-9659-c0e12553b76d︠
#In this notebook I calculate the angle, area and volume for a quantum tetrahedron
#The angle is found using the expression:
# theta = arccos((j3*(j3+1)-(j1*(j1+j1)-j2*(j2+1))/(2*sqrt(j1*(j1+j1)*j2*(j2+1))))
#The area is found using the expression:
# A=sqrt(j1*(j1+1))
#The volume is fund using the expression
##V^2 =M = 2/9(real antisymmetrix matrix)
#

#Values of constants
#gamma is Immirzi parameter
#sage: gamma =numerical_approx( ln(2)/(pi*sqrt(2)))
#sage: G = 6.63*10^-11
#sage: hbar= (1.61619926*10^-35)/(2*pi)
#lp is the planck length
#sage: lp3=6*10^-104
︡1e4117f5-7d2f-442e-9227-beac6e229f26︡
︠48e84dc4-48ad-4e16-bb8a-cac7a33bbd9b︠
sage: import numpy
sage: j1=0.5
sage: j2=0.5
sage: j3=0.5
sage: j4=0.5
#set up J values

sage: print'j1=',j1
sage: print'j2=',j2
sage: print'j3=',j3
sage: print'j4=',j4

#calculate volume loop
sage: kmin = int(max(abs(j1-j2),abs(j3 -j4)))
sage: kmax = int(min((j1+j2),(j3 +j4)))
sage: d = kmax -kmin + 1

sage: print'kmin=',kmin
sage: print'kmax=',kmax
sage: print'd=',d

sage: y=numpy.arange(kmin,kmax+1,1)
#sage: print y

sage: kmatrix = matrix(CDF,int(d), int(d))
#sage: print kmatrix


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
    #print q


sage: for j in range(d-1):
        kmatrix[[j],[j+1]]=r[j+1]
        kmatrix[[j+1],[j]]=-r[j+1]
#...:     print kmatrix

sage: M = (2/9)*kmatrix
#sage: print M
sage: s=M.eigenvalues()
#sage: print s

sage: gamma =numerical_approx( ln(2)/(pi*sqrt(2)))
sage: G = 6.63*10^-11
sage: hbar= numerical_approx((1.61619926*10^-35)/(2*pi), digits = 4)
#y is Immirzi parameter
sage: lp3=6*10^-104
sage: lp=1.61619926*10^-35
#sage: const1 = sqrt((8*pi*G*hbar*y)^3)
sage: for j in range(d):
        e= sqrt(s[j])
        vol=lp3*e
        volume= numerical_approx(vol, digits=10)
        if e.imag() ==0:
            print "volume of tetrahedron =", volume, 'm3'


#main sequence Area eigenvalues

sage: main1=numerical_approx(sqrt(j1*(j1+1)),digits=4)
sage: areamain1 =0.5*lp^2*main1
sage: print 'Area of face 1=', areamain1, 'm2'

sage: main2=numerical_approx(sqrt(j2*(j2+1)),digits=4)
sage: areamain2 =0.5*lp^2*main2
sage: print 'Area of face 2=', areamain2, 'm2'

sage: main3=numerical_approx(sqrt(j3*(j3+1)),digits=4)
sage: areamain3 =0.5*lp^2*main3
sage: print 'Area of face 3=', areamain3, 'm2'

sage: main4=numerical_approx(sqrt(j4*(j4+1)),digits=4)
sage: areamain4 =0.5*lp^2*main4
sage: print 'Area of face 4=', areamain4, 'm2'
sage: area = areamain1 + areamain3 +areamain3+areamain4
sage: print 'Total area of quantum tetrahedron =', area, 'm2'

#calculate angle
sage: d2=j3*(j3+1)
sage: d3=j1*(j1+1)
sage: d4=j2*(j2+1)
sage: d5=d2-d3-d4
sage: d6=2*sqrt(d3*d4)
sage: d7=d5/d6
sage: d8=arccos(d7)
sage: d8a=numerical_approx(d8, digits=4)
sage: angle = numerical_approx(d8*180/pi, digits=4)
#sage: print d2
#sage: print d3
#sage: print d4
#sage: print d5
#sage: print d6
#sage: print d7
sage: print 'angle between faces 1 and 2 in quantum tetrahedron = ',d8a, 'radians'
sage: print 'angle between faces 1 and 2 in quantum tetrahedron = ',angle, 'degrees'


sage: kmin = int(max(abs(j1-j2),abs(j3 -j4)))
sage: kmax = int(min((j1+j2),(j3 +j4)))
sage: d = kmax -kmin + 1

#Heron function
def heron(a,b,c):
    area =(1/4)*sqrt(((a+b)**2-c**2)*(c**2-(a-b)**2))
    return area

#def even(n):
#    v = []
 #   for i in range(3,n):
#        if i % 2 == 0:
 #           v.append(i)
 #   return v

#sage: even(6)
#quantum and classical polygons

sage: areaheron = heron(j1,j2,j3)
print "heron formula area =", areaheron

#p1=sum(A)

sage: x = PolynomialRing(QQ, 'x').gen()
sage: n=3
sage: hermite(n,x)
sage: psi=(1/(factorial(n))*(2**n))*hermite(n,x)
print "wavefunction = ", psi


︡bbf2a44b-0467-4a28-8903-f49c441b2e3b︡{"stdout":"j1= 0.500000000000000\n"}︡{"stdout":"j2= 0.500000000000000\n"}︡{"stdout":"j3= 0.500000000000000\n"}︡{"stdout":"j4= 0.500000000000000\n"}︡{"stdout":"kmin= 0\n"}︡{"stdout":"kmax= 1\n"}︡{"stdout":"d= 2\n"}︡{"stdout":"volume of tetrahedron = 1.861209718e-104 m3\n"}︡{"stdout":"Area of face 1= 1.131e-70 m2\n"}︡{"stdout":"Area of face 2= 1.131e-70 m2\n"}︡{"stdout":"Area of face 3= 1.131e-70 m2\n"}︡{"stdout":"Area of face 4= 1.131e-70 m2\n"}︡{"stdout":"Total area of quantum tetrahedron = 4.524e-70 m2\n"}︡{"stdout":"angle between faces 1 and 2 in quantum tetrahedron =  2.094 radians\n"}︡{"stdout":"angle between faces 1 and 2 in quantum tetrahedron =  120.0 degrees\n"}︡{"stdout":"heron formula area = 0.108253175473055\n"}︡{"stdout":"8*x^3 - 12*x\n"}︡{"stdout":"wavefunction =  32/3*x^3 - 16*x\n"}︡
︠67d3f303-04a1-43c8-b340-38c06cc18cab︠









