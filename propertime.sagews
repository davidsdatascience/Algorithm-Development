︠8540579a-689a-487d-8ce0-0ea3649ca75er︠
import numpy
import sympy
import pylab as pl

vmax=2.999999999999999*10^8
r_data=[]
v_data=[]
gamma_data=[]
gravgamma_data=[]
v=0
r=0

#proper motion ref: https://en.wikipedia.org/wiki/Proper_time
vmin=2.1*10^8
c=3*10^8
gamma=sqrt(1-(v^2/c^2))
gamma=numerical_approx(gamma, digits=14)

for v in range(vmin, vmax, 2*10^7):
    gamma=sqrt(1-(v^2/c^2))
    gamma=numerical_approx(gamma, digits=14)
    v_data.append(v)
    gamma_data.append(gamma_data)




#for stationary in gravitational field using Schwarzschild solution m=GM/c2

m=4.4354*10^-3
rmin=6378137
rmax=638000



for r in range(rmin, rmax, 1000):
    gravgamma= sqrt(1-2*(m/r))
    gravgamma=numerical_approx(gravgamma, digits=14)
    r_data.append(r)
    gravgamma_data.append(gravgamma_data)



#print'gamma',gamma
#print'gravgamma',gravgamma

data=zip(v_data,gamma_data)
data1=zip(v_data,gravgamma_data)

scatter_plot(data)
scatter_plot(data1)




︡99936253-e514-49a8-9c95-243eee31ca68︡









