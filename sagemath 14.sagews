︠1f2e2538-2cad-4c44-a28d-9be1bf8d1d91︠

︠02f23a8b-ace2-4971-b008-310473841f81︠
########################################################################################
#Ref: Holomorphic Factorization for a Quantum Tetrahedron by Freidel,Krasnov,and Livine#
#The dimension d of the Hilbert space H4,  d = kmax - kmin + 1                         #
#k values k ranges from kmin to kmax in integer steps                                  #
#kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)                                 #
#The the dimension of the hilbert space is given by d = kmax -kmin + 1                 #
#                                                                                      #
#modulus of the equi-area case state as a function of the spin label k,                #
# modulus of the j = 20 equi-area state Ck for increasing cross-ratios Z               #
#                                                                                      #
########################################################################################
import numpy
j0=0.5
j1=j0
j2=j0
j3=j0
j4=j0
#set up J values
print'j0=',j0
print'j1=',j1
print'j2=',j2
print'j3=',j3
print'j4=',j4

#lp=1.61619926*10^-35 #plancks const
#A0=lp^2*(2*j0+1)


#for a regular 4-simplex
Amp=Aqr=j0
print "A=", Amp
i0=(2/sqrt(3))*j0
print "i0=",numerical_approx(i0, digits=4)
Theta=arccos(-0.25)
print "theta =",theta



alpha=0
iN=Amp^2 + Aqr^2+2*Amp*Aqr*cos(alpha)
print "i =", iN

jnm=0
t=1
di=2*i0+1
N=1
sigma=3/(4*j0)
theta=pi/2

psijnm=exp((-1/t)*(jnm-j0)^2+Theta)
print "psijnm=", psijnm
psii=N*sqrt(di)*exp((-1/sigma)*(i-i0)^2+theta)
print "psii=", numerical_approx(psii, digits=4)


def holo(jvalue):
    j=jvalue
    j1=j
    j2=j
    j3=j
    j4=j
    kmax = min(j1+j2,j3 +j4)
    kmin = max(j1-j2,j3 -j4)
    d = kmax -kmin + 1
    z=exp(I*pi/3)
    #z=1.8*I
    rootz=sqrt(z)
    phiz=arccosh(rootz)
    realphiz =phiz.real()
    psi=pi/2
    #kc=sqrt(j1^2+j2^2+2*j1*j2*cos(theta12))
    dj=2*j+1
    kc = 2*j/sqrt(3)# 2*j*tanh(realphiz)
    k=kmin
    k_data=[]
    ck_data=[]

   # print 'a=',a
    #print 'b=',b
    #print 'c=',c
    #print 'ck=',ck
    #print 'd=',d
    #print 'kmin=',kmin
    #print 'kmax=',kmax

    for k in range(0,50):
        k_data.append(k)
        a=1/(1-(kc^2/4*j^2)^2*j)
        b=(-2*j)*((k-kc)^2)/(4*j^2 -kc^2)
        c= -I*kc*psi
        ck=a*exp(b+c)
        absck=numerical_approx(abs(ck), digits=4)
        ck_data.append(absck)
        #print 'k=',k, 'absck=',absck


    data=zip(k_data,ck_data)
    return data


def cross_ratio(jvalue, zvalue):
    j=jvalue
    j1=j
    j2=j
    j3=j
    j4=j
    kmax = min(j1+j2,j3 +j4)
    kmin = max(j1-j2,j3 -j4)
    d = kmax -kmin + 1
    z=zvalue
    #z=1.8*I
    rootz=sqrt(z)
    phiz=arccosh(rootz)
    realphiz =phiz.real()
    psi=pi/2
    #kc=sqrt(j1^2+j2^2+2*j1*j2*cos(theta12))
    dj=2*j+1
    kc =2*j*tanh(realphiz)
    k=kmin
    k_data=[]
    ck_data=[]

   # print 'a=',a
    #print 'b=',b
    #print 'c=',c
    #print 'ck=',ck
    #print 'd=',d
    #print 'kmin=',kmin
    #print 'kmax=',kmax

    for k in range(0,50):
        k_data.append(k)
        a=1/(1-(kc^2/4*j^2)^2*j)
        b=(-2*j)*((k-kc)^2)/(4*j^2 -kc^2)
        c= -I*kc*psi
        ck=a*exp(b+c)
        absck=numerical_approx(abs(ck), digits=4)
        ck_data.append(absck)
        #print 'k=',k, 'absck=',absck


    data=zip(k_data,ck_data)
    return data



########s1=cross_ratio(20, 0.1*I)
########s2=cross_ratio(20, 0.8*I)
########s3=cross_ratio(20, 1.8*I)

#########line(s1,axes_labels=['$k$ axis','$Ck$ axis'],title='z=0.1i'   )
#########line(s2,axes_labels=['$k$ axis','$Ck$ axis'],title='z=0.8i'   )
#########line(s3,axes_labels=['$k$ axis','$Ck$ axis'],title='z=1.8i'   )




#p1=holo(5)
#p2=holo(10)
#p3=holo(15)
#p4=holo(20)
#p5=holo(25)
#p6=holo(30)
#p7=holo(35)
#p8=holo(40)

#scatter_plot(p1,axes_labels=['$k$ axis','$Ck$ axis']   )
#line(p1,axes_labels=['$k$ axis','$Ck$ axis'],title='j=5'   )
#line(p2,axes_labels=['$k$ axis','$Ck$ axis'] ,title='j=10'  )
#line(p3,axes_labels=['$k$ axis','$Ck$ axis'] ,title='j=15'  )
#line(p4,axes_labels=['$k$ axis','$Ck$ axis'],title='j=20'   )
#line(p5,axes_labels=['$k$ axis','$Ck$ axis'],title='j=25'   )
#line(p6,axes_labels=['$k$ axis','$Ck$ axis'] ,title='j=30'  )
#line(p7,axes_labels=['$k$ axis','$Ck$ axis'],title='j=35'   )
#line(p8,axes_labels=['$k$ axis','$Ck$ axis'] ,title='j=40'  )


#combined = plot1 + plot2#+plot3+plot4+plot5+plot6+plot7+plot8
#combined.show()



︡29ab45c6-ffbd-4a12-ac03-96a5fdfd9ba7︡{"stdout":"j0= 0.500000000000000\n"}︡{"stdout":"j1= 0.500000000000000\n"}︡{"stdout":"j2= 0.500000000000000\n"}︡{"stdout":"j3= 0.500000000000000\n"}︡{"stdout":"j4= 0.500000000000000\n"}︡{"stdout":"A= 0.500000000000000\n"}︡{"stdout":"i0= 0.5773\n"}︡{"stdout":"theta = 1.82347658193698\n"}︡{"stdout":"i = 1.00000000000000\n"}︡{"stdout":"psijnm= 4.82338798182481\n"}︡{"stdout":"psii= 7.908 + 7.665*I\n"}︡
︠329418d2-9938-435a-b58d-5b3173c9a850︠
︡dac8df30-1444-461a-84f8-3af62ab0958c︡
︠b62d002d-f2bb-47ce-888d-bd1805885aab︠
︡3b33a0ea-8870-49ec-b730-4979e4638784︡
︠214eda52-1f07-439d-ba19-3b4f1e80e6fb︠









