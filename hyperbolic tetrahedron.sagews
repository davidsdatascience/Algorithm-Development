︠b4f2478b-1487-4d69-808f-da39554616d3s︠
import numpy
#for sequences see http://a-little-book-of-sage.readthedocs.org/en/latest/src/iteration.html
 #Based on Maple programs in '6j Symbols for Uq and non-eucledean Tetrahedra'by Taylor and Woodward.


#set up J values
j12=40
j23=48
j13=50
j34=52
j14=54
j24=106
n=106
u=2*max(j12,j23,j13,j34,j14)
print "u=", u

#6jsymbol(j12,j23,j13,j34,j14,j24) have j24=j which varies
sixjsymbol_data=[]
j_data=[]
for i in range(0,108):
    wig=wigner_6j(j12,j23,j13,j34,j14,i)
    j_data.append(i)
    sixjsymbol_data.append(wig)
    #print "j=", j, "Wigner6j=", wig
data1=zip(j_data, sixjsymbol_data )
wigplot=scatter_plot(data1, markersize=5, title='6j symbol vs j')
wigplot.axes_labels([r'$j$', r'$6j$'])
wigplot.show()

#quantum integer n
r=200
qi_data=[]
n_data=[]
for n in range(0,108):
    quantum_integern = sin(pi*n/r)/sin(pi/r)
    qi_data.append(quantum_integern)
    n_data.append(n)
data2=zip(n_data, qi_data)
qiplot=scatter_plot(data2,markersize=5,title='Quantum Number n vs n')
qiplot.axes_labels([r'$n$', r'$Quantum Integer n $'])
qiplot.show()

#quantum triangle
threejsymbol_data=[]
threej_data=[]
j1=1
j2=1
j3=j1+j2
m1=1
m2=1
m3=-(m1+m2)
wig3=wigner_3j(j1,j2,j3,m1,m2,m3)
print "wigner3j=", wig3

for i in range(0,108):
    j1=j1+i
    j2=j2+i
    j3=j1+j2
    m1=m1+i
    m2=m2+i
    m3=-(m1+m2)
    wig3=wigner_3j(j1,j2,j3,m1,m2,m3)
    threej_data.append(i)
    threejsymbol_data.append(wig3)
data3=zip(threej_data, threejsymbol_data )
wig3plot=scatter_plot(data3, markersize=5, title='Wigner3j symbol vs j3')
wig3plot.axes_labels([r'$j3$', r'$Wigner 3j$'])
wig3plot.show()

# The Gram matrix, its determinant and inverse
Gnum=matrix([[1, numerical_approx(cos(j12)),numerical_approx(cos(j23)),numerical_approx(cos(j34))],[numerical_approx(cos(j12)),1, numerical_approx(cos(j23)),numerical_approx(cos(n))],[numerical_approx(cos(j23)),numerical_approx(cos(j12)),1, numerical_approx(cos(j34))],[numerical_approx(cos(j14)),numerical_approx(cos(n)),numerical_approx(cos(j34)),1] ])

#quantum integer n
# length corresponding to a dominant weight (integer)
def length(j):
    r=200
    return pi*(j/2+1)/r

#amplitude prediction
# The amplitude of the asymptotic formula
amp_data=[]
leni_data=[]
for y in range(0,108):
    Glennum=matrix([[1, numerical_approx(cos(length(j12))),numerical_approx(cos(length(j23))),numerical_approx(cos(length(j34)))],[numerical_approx(cos(length(j12)) ),1, numerical_approx(cos(length(j23))  ),numerical_approx(cos(length(y))   )],[numerical_approx(cos(length(j23))  ),numerical_approx(cos(length(j12))),1, numerical_approx(cos(length(j34)) )],[numerical_approx(cos(length(j14)) ),numerical_approx(cos(length(y)) ),numerical_approx(cos(length(j34)) ),1] ])
    detglen=Glennum.determinant()
    amppredict=numerical_approx(((r/pi)^3*1.5*pi*(abs(detglen/(36))^(1/2))^(-1/2)))
    amp_data.append(amppredict)
    leni_data.append(y)
data4=zip(leni_data,amp_data)
ampplot=scatter_plot(data4,markersize=5, title='Amplitude vs j3')
ampplot.axes_labels([r'$j3$', r'$Amplitude$'])
ampplot.show()


invGlen=Glennum.inverse()
print "invGlen=",invGlen

#print "Gram matrix=", G
print "Gram matrix=", Gnum

detg=Gnum.determinant()
print "Determinant of Gram matrix=", detg

invG=Gnum.inverse()
print "Inverse of Gram matrix", invG


#Dihedral angles
#preangle
index1=0
index2=0
pre_data=[]
for d in range(0,2):
    for d1 in range(0,2):
        print index1
        print index2
        pre= pi-arccos(-invGlen[index1][index2]/(invGlen[index1][index1]*invGlen[index2][index2])^(1/2))
        pre_data.append(pre)

        print "arcos=",arccos(-invGlen[index1][index2]/(invGlen[index1][index1]*invGlen[index2][index2])^(1/2))
        print "invGlen[index1][index2]=",invGlen[index1][index2]
        print "invGlen[index1][index1]=",invGlen[index1][index1]
        print "invGlen[index1][index2]=",invGlen[index2][index2]
        print "pre_data=",pre_data
        print "pre=", pre
        index1=index1+1
        index2=index2+1


#the dihedral angles
#angpredict := [ seq([y*stepsize,diangle(r,i,j,k,l,m,y*stepsize)[2]],y=0..u/stepsize) ];



#        pre= pi-arccos(-invG[index1][index2]/(invG[index1][index1]*invG[index2][index2])^(1/2))
#print "pre=", pre

#index1=0
#index2=0
#pre= pi-arccos(-invG[index1][index2]/(invG[index1][index1]*invG[index2][index2])^(1/2))
#print "pre=", pre
#diangle:=(r,i,j,k,l,m,n)->evalf(preangle(len(i),len(j),len(k),len(l),len(m),len(n)));



︡440961df-502a-4031-b20a-e6cc90a531a2︡{"stdout":"u= 108\n"}︡{"once":false,"file":{"show":true,"uuid":"d5e0644e-4a0d-4f86-a73f-9a9367bc6cd0","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/12268/tmp_qvWU2r.svg"}}︡{"html":"<div align='center'></div>"}︡{"once":false,"file":{"show":true,"uuid":"08ced9d8-ff4a-4006-bb8c-a3f00971dd6a","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/12268/tmp_lNll09.svg"}}︡{"html":"<div align='center'></div>"}︡{"stdout":"wigner3j= sqrt(1/5)\n"}︡{"once":false,"file":{"show":true,"uuid":"ad53eac8-751b-4b40-97ac-9193360ae700","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/12268/tmp_YRNPIC.svg"}}︡{"html":"<div align='center'></div>"}︡{"once":false,"file":{"show":true,"uuid":"275e507a-ff38-4062-b0e7-fcafe6b882bf","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/12268/tmp_SA41Jf.svg"}}︡{"html":"<div align='center'></div>"}︡{"stdout":"invGlen= [ 2.70864492835487  4.16106190031150 -9.51486756652884  3.47605293330339]\n[ 4.29316574425436 -3.20428740471573  3.81543811790953 -5.29011761621380]\n[-10.4284262561892  4.16106190031150  3.62220361801525  3.47605293330340]\n[ 4.23990509080463 -5.45735631191312  2.80738253414568 -1.84616877321772]\n"}︡{"stdout":"Gram matrix= [  1.00000000000000 -0.666938061652262 -0.640144339469200 -0.162990780795705]\n[-0.666938061652262   1.00000000000000 -0.640144339469200  0.982779582041221]\n[-0.640144339469200 -0.666938061652262   1.00000000000000 -0.162990780795705]\n[-0.829309832863150  0.982779582041221 -0.162990780795705   1.00000000000000]\n"}︡{"stdout":"Determinant of Gram matrix= -0.264738342789691\n"}︡{"stdout":"Inverse of Gram matrix [ 0.793177980774542  -3.13951420191656  -1.00471352375844   3.05097211185505]\n[-0.861089940626294  -1.22741979645012  -1.19495555294524  0.871166654195654]\n[ 0.183475544266039  -3.13951420191656 -0.395011087249937   3.05097211185505]\n[  1.53395673283231  -1.90905875460813  0.276775948884074   3.17131669855116]\n"}︡{"stdout":"0\n0\narcos= 3.14159265358979\ninvGlen[index1][index2]= 2.70864492835487\ninvGlen[index1][index1]= 2.70864492835487\ninvGlen[index1][index2]= 2.70864492835487\npre_data= [pi - 3.14159265358979]\npre= pi - 3.14159265358979\n1\n1\narcos= 0.000000000000000\ninvGlen[index1][index2]= -3.20428740471573\ninvGlen[index1][index1]= -3.20428740471573\ninvGlen[index1][index2]= -3.20428740471573\npre_data= [pi - 3.14159265358979, pi]\npre= pi\n2\n2\narcos= 3.14159265358979\ninvGlen[index1][index2]= 3.62220361801525\ninvGlen[index1][index1]= 3.62220361801525\ninvGlen[index1][index2]= 3.62220361801525\npre_data= [pi - 3.14159265358979, pi, pi - 3.14159265358979]\npre= pi - 3.14159265358979\n3\n3\narcos= 0.000000000000000\ninvGlen[index1][index2]= -1.84616877321772\ninvGlen[index1][index1]= -1.84616877321772\ninvGlen[index1][index2]= -1.84616877321772\npre_data= [pi - 3.14159265358979, pi, pi - 3.14159265358979, pi]\npre= pi\n"}︡
︠9d010f1e-960a-4f9e-8591-94b129b9fc3d︠
︡37b81fd3-3a58-44d3-b4b9-08ca71861df8︡
︠faac61f4-aed5-464b-a459-cbdecbfd5ef6︠
︡bed8c9dc-78c8-40b5-afa1-fa82aca42748︡
︠487b3d91-380c-422c-b1fb-0068490f2db1︠
︡ee50b852-81f8-4691-b19f-9c78d20da28a︡
︠6856beb6-93be-47df-97da-ea1d1d5fdf57︠
︡1b370337-1dc7-44e1-896d-645f48b98bd3︡
︠78b22e9d-a14b-4a99-a44b-1f3ded48f2f9︠
︡42f2a939-3c3e-4939-a871-5879cfaa174f︡
︠11d97c6c-f27c-4073-b93d-5d34ef08f4be︠









