︠5f071f0d-56cc-4142-97c4-f87a6b68c2a2︠
import numpy





#wigner symbol calculations
#wigner_3j(j_1, j_2, j_3, m_1, m_2, m_3
#wigner1 =wigner_3j(2, 6, 4, 0, 0, 0)
#wigner2=wigner_3j(2, 6, 4, 0, 0, 1)
#wigner3=wigner_6j(3,3,3,3,3,3)
#wigner4=wigner_6j(30,30,30,30,30,30)
#wigner5=wigner_9j(1,1,1, 1,1,1, 1,1,0 ,prec=64)

#print "wigner_3j(2, 6, 4, 0, 0, 0) =", wigner1
#print "wigner_3j(2, 6, 4, 0, 0, 1) =", wigner2
#print "wigner_6j(3,3,3,3,3,3) =", wigner3
#print "wigner_6j(30,30,30,30,30,30) =", wigner4
#print "wigner_9j(1,1,1, 1,1,1, 1,1,0 ,prec=64) =", wigner5




###################################################################################################
#calculations based on Matrix Elements of Thiemann’s Hamiltonian Constraint in Loop Quantum Gravity #arxiv 9703090
#single trivalent vertex with edges ei, ej , ek
#trivalent vertices (r, p, q)

#W(a, b, c, d from equ A.14 of arxiv 9703090
#w(a, a, 1, 1) from equ A.15 of arxiv 9703090
#w(a, b, c, a + b + c − 2)from equ A.16 of arxiv 9703090
#w(a, b, c, 1) = w1 from equ A.17 of arxiv 9703090
#e = (I −J)/2
#e default values -1, +1
#t = (I − J)/2
#equ B.7 of arxiv 9703090
#m = (a + b − c)/2
#n = (b + c − a)/2
#p = (c + a − b)/2
########################################################################################################


#w1 from equ A.17 of arxiv 9703090
def w1(a,b,c):
    c1=(a + b + c + 3)
    c2=(1 + a + b - c)
    c3=(1 + c - a + b)
    c4=(1 + c + a - b)
    c0=c1*c2*c3*c4
    c00=c0/16
    if c00>=0:
        w=0.5*sqrt(c00)
    else:
        w=0
    return w
    #if imag(w)==0:
        #return w
    #else:
       #w=0
        #return w




#r1 from equ 5.8 of arxiv 9703090
def r1(e):
    return e*(r/(r+1))

#r2 from equ 5.9 of arxiv 9703090



def r2value(etilda, ebar, p, q, r):
        if r==0: #prevent zero divide
            r2=0
        elif ebar ==1 and etilda==1:
            r2 = (p-q)/(2*r)
        elif ebar ==-1 and etilda == 1:
            r2 = (-1)*(q-p+r)*(2+p+q)/(4*r*(1 + q))
        elif ebar == 1 and etilda== -1:
            r2 = (p-q+r)*(2 + p + q)/(4*r*(1 + p))
        elif ebar ==-1 and etilda==-1:
            r2 =(p - q)*(p + q -r)*(2 + p + q + r)/(8*r*(1 + p)*(1 + q))
        else:
            r2=NaN
        return  r2


#set (p,q,r) values
p=1
q=0
r=1
a=p
b=q
c=r
#set e values
e=1
ebar=1
etilda =1





print "p= ",p
print "q= ",q
print "r= ",r



#A1 in equ 6.4
A1eplus=0.25*sqrt(w1(p, q, r + 1))*r1(1)*r2value(etilda, ebar, p, q, r)
A1eminus=0.25*sqrt(w1(p, q, r - 1))*r1(-1)*r2value(etilda, ebar, p, q, r)
A1=A1eplus+A1eminus  #sum for e=1 and e=-1


#A1 in equ 6.4
A2eplus=0.25*sqrt(w1(p+ebar, q+etilda, r + 1))*r1(1)*r2value(etilda, ebar, p, q, r)
A2eminus=0.25*sqrt(w1(p+ebar, q+etilda, r - 1))*r1(-1)*r2value(etilda, ebar, p, q, r)
A2=A2eplus+A2eminus  #sum for e=1 and e=-1






vol1= w1(a,b,c)
r2value=r2value(etilda, ebar, p, q, r)

print "w1 =", numerical_approx(vol1, digits=4)
print "r1 =", r1(e)
print "r2 =", r2value
print "e=", e
print "ebar=", ebar
print "etilda=", etilda
print "w for e=1 is", numerical_approx(w1(p, q, r + 1),digits=4)
print "w for e=-1 is",numerical_approx(w1(p, q, r - 1),digits=4)

print "A1eplus =", numerical_approx(A1eplus, digits=4)
print "A1eminus =", numerical_approx(A1eminus, digits=4)
print "A1 =", numerical_approx(A1, digits=4)
print "A2eplus =", numerical_approx(A2eplus, digits=4)
print "A2eminus =", numerical_approx(A2eminus, digits=4)
print "A2 =", numerical_approx(A2, digits=4)

︡556edf5b-0fe9-40b4-b6e3-3296607e41b2︡{"stdout":"p=  1\n"}︡{"stdout":"q=  0\n"}︡{"stdout":"r=  1\n"}︡{"stdout":"w1 = 0.4841\n"}︡{"stdout":"r1 = 1/2\n"}︡{"stdout":"r2 = 1/2\n"}︡{"stdout":"e= 1\n"}︡{"stdout":"ebar= 1\n"}︡{"stdout":"etilda= 1\n"}︡{"stdout":"w for e=1 is 0.0000\n"}︡{"stdout":"w for e=-1 is 0.0000\n"}︡{"stdout":"A1eplus = 0.0000\n"}︡{"stdout":"A1eminus = -0.0000\n"}︡{"stdout":"A1 = 0.0000\n"}︡{"stdout":"A2eplus = 0.07433\n"}︡{"stdout":"A2eminus = -0.0000\n"}︡{"stdout":"A2 = 0.07433\n"}︡
︠826e96c6-ab85-4042-9b99-c21541769a49︠
︡c566b7bf-84c2-42fc-b832-c1f6865568e7︡
︠8cb32f76-81b7-48a0-b1a3-8bbf4773ba9b︠
︡2f865a71-a0a5-4aa5-8477-3cf9e631a047︡
︠8e19e27d-41ee-4901-aa44-7c9438b6e537︠









