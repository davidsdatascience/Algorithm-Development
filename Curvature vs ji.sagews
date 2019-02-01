
︠c813c30e-4d08-4259-a62c-a21a3e978987︠
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

#print "Eigenvalue of length for trivalent vertex=",length,"m"
#print "Eigenvalue of length for divalent vertex=",dilength,"m"
#print "Quantum of length in quantum tetrahedron =",quant,"m"




################################################################################
#curvature operator
#curvature operator
ji_data=[]
R_data=[]
ji=0.5
while ji<= 10:
    curveconst=sqrt(8*pi*lp*lp)
    #print "curveconst", numerical_approx(curveconst, digits =4)

#ji=2.0
    jk=0.5
    jik=ji-jk
    #print "ji=", ji
    #print "jik=", jik
    costheta=(jik*(jik+1)-ji*(ji+1)-jk*(jk+1))/(2*sqrt(ji*(ji+1)*jk*(jk+1)))
    #print "costheta=", numerical_approx(costheta, digits =4)
    theta= pi-arccos((jik*(jik+1)-ji*(ji+1)-jk*(jk+1))/(2*sqrt(ji*(ji+1)*jk*(jk+1))))
    #print "theta=", numerical_approx(theta, digits =4),"radian"

#using thiemann divalent vertex
    L=lp*sqrt(sqrt(ji*(ji+1)))
    #print "Length=", numerical_approx(L, digits =4),"m"


    alpha=1
    k=1  #so far
    R=k*(((2*pi/alpha)*L)-(0.5*L*theta)+(theta*L))
    curvatureR=numerical_approx(R, digits =4)
    #print "curvature=", numerical_approx(R, digits =4)

    #print "Curvature in planck units=", numerical_approx(R/curveconst)
    ji_data.append(ji)
    R_data.append(curvatureR)
    ji=ji+0.5

data=zip(ji_data,R_data)
#plot(data)
#point(data, legend_label='curvature vs jo',xmax=10,size=15, figsize=4)
point(data,xmax=10,size=15, figsize=4)



#
#
#
##
︡2d841eb0-d3b6-4d6d-ad9b-fbff26c964e2︡{"once":false,"file":{"show":true,"uuid":"abe4f31e-b2f6-4055-8e98-9510e3334487","filename":"/projects/4dba49b8-22b8-4e2c-b9ba-9311f4fced28/.sage/temp/compute3dc2/1369/tmp_4SEahV.png"}}︡
︠c4bdb5d3-e444-4da4-8542-8093d038c722︠
︡2f21208e-3e63-4c14-9ff0-0cec494e9790︡
︠b90779a1-1a06-471d-88a8-018b874122e3︠
︡5582106f-d5ba-4ed2-aeec-8ac06bb18029︡
︠5eef6066-ba30-4c77-a58a-ac082f9a9fd1︠









