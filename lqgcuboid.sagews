︠f80d440d-7268-4df7-923d-0a2b659c9fc6s︠
from operator import mul
import pprint

sage: mat1 = matrix([[0,1],[1,0]]) #creates a pauli matrix1
pprint.pprint(mat1)
sage: mat2 = matrix([[0,-I],[I,0]]) #creates a pauli matrix2
sage: mat3 = matrix([[1,0],[0,-1]]) #creates a pauli matrix3

sage: u1 = exp(i*mat1) # creates an unitary matrix
sage: u2 = exp(i*mat2)
sage: u3 = exp(i*mat3)

#check unitary
sage: show(((u1.conjugate_transpose())*u1).n()) # u*u evaluated numerically
sage: show(((u2.conjugate_transpose())*u2).n()) # u*u evaluated numerically
sage: show(((u3.conjugate_transpose())*u3).n()) # u*u evaluated numerically

#Allow spins in EPRL-FK model are 1/2 integer
#Immirzi parameter gamma = numerical_approx( ln(2)/(pi*sqrt(2)))
gamma = numerical_approx( ln(2)/(pi*sqrt(2)))
print 'gamma = ', gamma
jf=0.5
jfplus =jf+gamma/2
jfminus=jf-gamma/2

#face amplitudes Af
Af=2*jf + 1
print 'Af =', Af
Af1=(2*jfplus + 1)*(2*jfminus + 1)
print 'Af1 =', Af1

#Egde amplitudes
Ae=1



#lp is the planck length
lp=1.6*10^(-35)
area=jf*lp^2
print 'area of face =', area
####################################################
#Volume of hypercuboid with side lengths a,b,c,d = (2+ax)(2+bx)(2+cx)(2+dx)
#####################################################
axy=1
azt=1
axz=1
ayt=1
axt=1
ayz=1
#geometricity constraint
#axy*azt=axz*ayt
#axz**ayt=axt*ayz

#volume of hypercube
v4=(axy*azt*axz*ayt*axt*ayz)^(1/3)
print 'V4=', v4




#non-geometricity
eta=matrix([[axt*azt-axz*ayt],[axz*ayt-axt*ayz],[axy*azt-axt*ayz]])
print 'eta=', eta

pprint.pprint(eta)


#large limit squared norm phi
j1=0.5
j2=0.5
j3=0.5

phi=(8*(1-gamma^2)^(-3/2))/((j1+j2)*(j2+j3)*(j1+j3))
print'phi=',phi

#sigma1 values
g1=exp(i*pi*mat1/4)
g2=exp(i*pi*mat2/4)
g3=exp(i*pi*mat3/4)
g4=exp(-i*pi*mat3/4)
g5=exp(-i*pi*mat2/4)
g6=exp(-i*pi*mat1/4)
g7=exp(i*pi*mat1/2)

print'g1=', g1
print'g2=', g2
print'g3=', g3
print'g4=', g4
print'g5=', g5
print'g6=', g6
print'g7=', g7


#sigma2 values
g12=exp(-i*pi*mat1/4)
g22=exp(-i*pi*mat2/4)
g32=exp(-i*pi*mat3/4)
g42=exp(i*pi*mat3/4)
g52=exp(i*pi*mat2/4)
g62=exp(i*pi*mat1/4)
g72=exp(i*pi*mat1/2)

pprint.pprint(g12)

print'g12=', g12
print'g22=', g22
print'g32=', g32
print'g42=', g42
print'g52=', g52
print'g62=', g62
print'g72=', g72



#path integral Zf ref[1] equ 1
#Zg=Af+Av+Ae


je=[0.5,1.0,1.5,2.0,2.5,3.0, 3.5, 4.0]
#af=[1*jf,2*jf,3*jf]
av=[4,5,6]
ae=[7,8,9]
inter=[1,2,3]



def faceamplitude():
    af=[]
    for jf in[1.0..10.0, step=0.5]:
        af.append(sum([1*jf,2*jf,3*jf]))
    return af


a1=reduce(mul, av)
a2=reduce(mul, ae)
print 'a2=', a2
print 'a1=', a1


face=faceamplitude()
print face
sumamp=sum(face)

print 'Af=', sumamp

##state sum i in the large j limit
alpha =1
av=((1+gamma)/2)^(21/2)
Z=(((1-gamma^2)/4)^((6*alpha -9/2)*v4))*(av)
print 'Action z=', Z

︡72e4a5b1-8c46-4abc-8b52-e8e31a39eeeb︡{"stdout":"[0 1]\n[1 0]\n"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rr}\n1.00000000000000 &amp; 0.000000000000000 \\\\\n0.000000000000000 &amp; 1.00000000000000\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rr}\n1.00000000000000 &amp; 0.000000000000000 \\\\\n0.000000000000000 &amp; 1.00000000000000\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rr}\n1.00000000000000 &amp; 0.000000000000000 \\\\\n0.000000000000000 &amp; 1.00000000000000\n\\end{array}\\right)$</div>"}︡{"stdout":"gamma =  0.156012929039104\n"}︡{"stdout":"Af = 2.00000000000000\n"}︡{"stdout":"Af1 = 3.97565996597264\n"}︡{"stdout":"area of face = 1.28000000000000e-70\n"}︡{"stdout":"V4= 1\n"}︡{"stdout":"eta= [0]\n[0]\n[0]\n"}︡{"stdout":"[0]\n[0]\n[0]\n"}︡{"stdout":"phi= 8.30122641614987\n"}︡{"stdout":"g1= [  1/2*sqrt(2) 1/2*I*sqrt(2)]\n[1/2*I*sqrt(2)   1/2*sqrt(2)]\n"}︡{"stdout":"g2= [ 1/2*sqrt(2)  1/2*sqrt(2)]\n[-1/2*sqrt(2)  1/2*sqrt(2)]\n"}︡{"stdout":"g3= [ (1/2*I + 1/2)*sqrt(2)                      0]\n[                     0 -(1/2*I - 1/2)*sqrt(2)]\n"}︡{"stdout":"g4= [-(1/2*I - 1/2)*sqrt(2)                      0]\n[                     0  (1/2*I + 1/2)*sqrt(2)]\n"}︡{"stdout":"g5= [ 1/2*sqrt(2) -1/2*sqrt(2)]\n[ 1/2*sqrt(2)  1/2*sqrt(2)]\n"}︡{"stdout":"g6= [   1/2*sqrt(2) -1/2*I*sqrt(2)]\n[-1/2*I*sqrt(2)    1/2*sqrt(2)]\n"}︡{"stdout":"g7= [0 I]\n[I 0]\n"}︡{"stdout":"[   1/2*sqrt(2) -1/2*I*sqrt(2)]\n[-1/2*I*sqrt(2)    1/2*sqrt(2)]\n"}︡{"stdout":"g12= [   1/2*sqrt(2) -1/2*I*sqrt(2)]\n[-1/2*I*sqrt(2)    1/2*sqrt(2)]\n"}︡{"stdout":"g22= [ 1/2*sqrt(2) -1/2*sqrt(2)]\n[ 1/2*sqrt(2)  1/2*sqrt(2)]\n"}︡{"stdout":"g32= [-(1/2*I - 1/2)*sqrt(2)                      0]\n[                     0  (1/2*I + 1/2)*sqrt(2)]\n"}︡{"stdout":"g42= [ (1/2*I + 1/2)*sqrt(2)                      0]\n[                     0 -(1/2*I - 1/2)*sqrt(2)]\n"}︡{"stdout":"g52= [ 1/2*sqrt(2)  1/2*sqrt(2)]\n[-1/2*sqrt(2)  1/2*sqrt(2)]\n"}︡{"stdout":"g62= [  1/2*sqrt(2) 1/2*I*sqrt(2)]\n[1/2*I*sqrt(2)   1/2*sqrt(2)]\n"}︡{"stdout":"g72= [0 I]\n[I 0]\n"}︡{"stdout":"a2= 504\n"}︡{"stdout":"a1= 120\n"}︡{"stdout":"[6.00000000000000, 9.00000000000000, 12.0000000000000, 15.0000000000000, 18.0000000000000, 21.0000000000000, 24.0000000000000, 27.0000000000000, 30.0000000000000, 33.0000000000000, 36.0000000000000, 39.0000000000000, 42.0000000000000, 45.0000000000000, 48.0000000000000, 51.0000000000000, 54.0000000000000, 57.0000000000000, 60.0000000000000]\n"}︡{"stdout":"Af= 627.000000000000\n"}︡{"stdout":"Action z= 0.000381198378931356\n"}︡{"done":true}︡
︠572f9b40-69b3-480c-b2ce-7c49152592a7︠









