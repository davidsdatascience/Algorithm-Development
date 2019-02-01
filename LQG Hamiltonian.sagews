︠6390ce79-9f2a-4c0f-9ae6-62283ee6beee︠
#In this notebook I calculate the length eigenvalues for a quantum tetrahedron
#Ref: A length operator for canonical quantum gravity by T. Thiemann

#Values of constants
#gamma is Immirzi parameter
#sage: gamma =numerical_approx( ln(2)/(pi*sqrt(2)))
#sage: G = 6.63*10^-11
#sage: hbar= (1.61619926*10^-35)/(2*pi)
#lp is the planck length
#sage: lp3=6*10^-104



import numpy
j1=0.5
j2=0.5
j3=0.5
j4=0.5
lp=1.61619926*10^-35
#set up J values

#print'j1=',j1
#print'j2=',j2
#print'j3=',j3
#sage: print'j4=',j4

#calculate trivalent vertex length


c0 = sqrt(j3+0.5)
c1 = j3+1
c2 = j1+j2+j3+2
c3 = j1+j2-j3
c4 = j2+j3-j1+1
c5 = j1+j2+j3+1
c6 = j1+j2-j3+1
c7 = j2+j3-j1
c8 = j3+j1-j2
c9 = sqrt(c2*c3*c4)
c10= sqrt(c5*c6*c7*c8)
c11=c1*c9
c12=j3*c10
c13=c12+c11
const = lp/c0
a=const*c13
length = numerical_approx( a, digits=10)
#divalent vertex
dilength=lp*sqrt(sqrt(j1*(j1+1)))
# quantum of length
quant = numerical_approx(lp*(1/sqrt(2))*(sqrt(sqrt(3))))
#sage: monochromatic four valent vertex

print "Eigenvalue of length for trivalent vertex=",length,"m"
print "Eigenvalue of length for divalent vertex=",dilength,"m"
print "Quantum of length in quantum tetrahedron =",quant,"m"

#curvature operator
#curvature operator


curveconst=sqrt(8*pi*lp*lp)
print "curveconst", numerical_approx(curveconst, digits =4)

ji=2.0
jk=0.5
jik=ji-jk
print "ji=", ji
print "jk=", jk
print "jik=", jik

costheta=(jik*(jik+1)-ji*(ji+1)-jk*(jk+1))/(2*sqrt(ji*(ji+1)*jk*(jk+1)))
print "costheta=", numerical_approx(costheta, digits =4)

theta= pi-arccos((jik*(jik+1)-ji*(ji+1)-jk*(jk+1))/(2*sqrt(ji*(ji+1)*jk*(jk+1))))
print "theta=", numerical_approx(theta, digits =4),"radian"

#using thiemann divalent vertex
L=lp*sqrt(sqrt(ji*(ji+1)))
print "Length=", numerical_approx(L, digits =4),"m"


alpha=1
k=1  #so far
R=k*(((2*pi/alpha)*L)-(0.5*L*theta)+(theta*L))
print "curvature=", numerical_approx(R, digits =4)

print "Curvature in planck units=", numerical_approx(R/curveconst)




︡c4c0aa1b-aad8-4fc2-b0f9-252313e08506︡{"stdout":"Eigenvalue of length for trivalent vertex= 4.710252223e-35 m\n"}︡{"stdout":"Eigenvalue of length for divalent vertex= 1.50404288463322e-35 m\n"}︡{"stdout":"Quantum of length in quantum tetrahedron = 1.50404288463322e-35 m\n"}︡{"stdout":"curveconst 8.102e-35\n"}︡{"stdout":"ji= 2.00000000000000\n"}︡{"stdout":"jk= 0.500000000000000\n"}︡{"stdout":"jik= 1.50000000000000\n"}︡{"stdout":"costheta= -0.7071\n"}︡{"stdout":"theta= 0.7854 radian\n"}︡{"stdout":"Length= 2.529e-35 m\n"}︡{"stdout":"curvature= 1.689e-34\n"}︡{"stdout":"Curvature in planck units= 2.08413904469412\n"}︡
︠8f2a95e0-5186-43ba-960d-3e207352eb7f︠
︡99c1313a-2e2d-4840-9df1-1ebf9fca32c5︡
︠4f49beea-37b4-4a82-b9e9-0d525c0bc988︠
︡9e454776-c085-414a-ab29-a90a84fe8f0f︡
︠67488042-2c78-48ab-8da6-7f1b81fd941d︠
︡593d6fb2-e4b1-4b5d-b489-79d492ba4de8︡
︠c8ae1bb2-dcb8-4250-b902-6707b6cc3905︠
︡96ea3208-ce4b-41a5-96fe-becda77a656c︡
︠a2887cb5-aa38-450a-84b2-6cca0277d6c7︠









