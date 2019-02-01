︠7da9062a-a667-476e-8cb8-95515e0f7eb0︠
#Hamiltonian dynamics of a quantum of space: arxiv 1301.1949

import numpy
j1=120
j2=120
j3=120
j4=120
lmin=j2-j1
lmax=j1+j2+1
l=lmax-3
l_data=[]
alphaL_data=[]
H0_data=[]
Hpi_data=[]

#Heron function for area of triangle
def heron(a,b,c):
    area =(1/4)*sqrt(((a+b)**2-c**2)*(c**2-(a-b)**2))
    return area

sage: print'j1=',j1
sage: print'j2=',j2
sage: print'j3=',j3
sage: print'j4=',j4
sage: y1=numpy.arange(lmin,lmax,1)


for j in range(lmax-lmin):
    l=int(y1[j])
    l_data.append(l)
    alphaL=(heron(l,j1+0.5,j2+0.5)*heron(l,j3+0.5,j4+0.5))/(sqrt((2*l+1)*(2*l-1)))
    alphaL_data.append(alphaL)

#classical H0
#psi=0
    psi=0
    H=2*alphaL*cos(psi)
    H0_data.append(H)

#psi=pi
    psi=pi
    H=2*alphaL*cos(psi)
    Hpi_data.append(H)


#Plotting results
data1=zip(l_data,H0_data)
data2=zip(l_data,Hpi_data)
H1plot=scatter_plot(data1, markersize=5)
H2plot=scatter_plot(data2, markersize=5)
Hdataplot=H1plot+H2plot

Hdataplot.axes_labels([r'$l$', r'$H$'])
Hdataplot.show()help()


︡7a5a73fc-6bd4-4e6b-8d7c-21846fe11f36︡{"stdout":"j1= 120\n"}︡{"stdout":"j2= 120\n"}︡{"stdout":"j3= 120\n"}︡{"stdout":"j4= 120\n"}︡{"once":false,"file":{"show":true,"uuid":"a0007c9d-8f6a-4ee7-b8a8-81ce921b0e35","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/18009/tmp_HtSIPe.svg"}}︡
︠a9b981eb-5f30-4aaa-a378-0f32d7c210c0︠









