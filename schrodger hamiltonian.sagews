︠410dd368-b50d-4033-9fc6-f48d8f7086e0︠
#Hamiltonian dynamics of a quantum of space: arxiv 1301.1949

import numpy
j1=100
j2=110
j3=130
j4=140
lmin=j2-j1
lmax=j1+j2+1
l=lmax-3
l_data=[]
alphaL_data=[]
H0_data=[]
Hpi_data=[]

#Heron function
def heron(a,b,c):
    area =(1/4)*sqrt(((a+b)**2-c**2)*(c**2-(a-b)**2))
    return area

sage: print'j1=',j1
sage: print'j2=',j2
sage: print'j3=',j3
sage: print'j4=',j4

#calculate volume loop
sage: kmin = int(max(abs(j1-j2),abs(j3 -j4)))
sage: kmax = int(min((j1+j2),(j3 +j4)))
sage: d = kmax -kmin + 1

#sage: print'kmin=',kmin
#sage: print'kmax=',kmax
#sage: print'd=',d

#print "Lmax=", lmax
#print "Lmin=", lmin
sage: y1=numpy.arange(lmin,lmax,1)
#sage: print"Possible l values", y1

for j in range(lmax-lmin):
    l=int(y1[j])
    l_data.append(l)
    #print "l=",l
    alphaL=(heron(l,j1+0.5,j2+0.5)*heron(l,j3+0.5,j4+0.5))/(sqrt((2*l+1)*(2*l-1)))
    alphaL_data.append(alphaL)
    #print  "alphaL=",numerical_approx(alphaL, digits=5)
#classical H0
#psi=0
    psi=0
    H=2*alphaL*cos(psi)
    H0_data.append(H)
    #print"For psi=0 H=",numerical_approx(H, digits=5)
#psi=pi
    psi=pi
    H=2*alphaL*cos(psi)
    Hpi_data.append(H)
    #print"For psi = pi H=",numerical_approx(H, digits=5)


#k values
sage: y=numpy.arange(kmin,kmax+1,1)
#sage: print"Possible k values", y

sage: kmatrix = matrix(CDF,int(d), int(d))
#sage: print "kmatrix=",kmatrix

#classical H
#psi=0
#H=2*alphaL*cos(psi)
#print"H=",numerical_approx(H, digits=5)
#sage: areaheron =heron(j1,j2,j3)
#print "heron formula area =", areaheron
#eigenvalue of volume
#sage: alphaL=(heron(l,j1+0.5,j2+0.5)*heron(l,j3+0.5,j4+0.5))/(sqrt((2*l+1)*(2*l-1)))
#print  "alphaL=",alphaL
#Legend: Add a label="Fancy plot" argument to the calls of plot and create the legend with legend()



#Data plot
#data=zip(l_data,alphaL_data)
#Hplot=scatter_plot(data)
#Hplot.axes_labels([r'$l$', r'$H$'])
#Hplot.show()

data1=zip(l_data,H0_data)
data2=zip(l_data,Hpi_data)
H1plot=scatter_plot(data1, markersize=5)
H2plot=scatter_plot(data2, markersize=5)
Hdataplot=H1plot+H2plot

Hdataplot.axes_labels([r'$l$', r'$H$'])
Hdataplot.show()


#load("ops.sage")

























︡67661689-5916-4466-b0e8-265454b4ecc5︡{"stdout":"j1= 100\n"}︡{"stdout":"j2= 110\n"}︡{"stdout":"j3= 130\n"}︡{"stdout":"j4= 140\n"}︡{"once":false,"file":{"show":true,"uuid":"4dd5922d-275c-4e31-b942-bf6d77c3c679","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/14215/tmp_gN7aXD.svg"}}︡
︠de9f95ee-cdf0-4e38-95f0-cd2c1b28a3a6︠
︡ca54bcf4-1538-4134-b154-1d156f885860︡
︠4d4bd746-c2da-4f86-9fe2-efd032d9e9c9︠
︡a0da6bee-9a50-4674-9946-9903c342aa4d︡
︠5a91b5ba-996e-4c54-bfab-afcc0019a85a︠










