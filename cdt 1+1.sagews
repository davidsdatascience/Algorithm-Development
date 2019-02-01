︠6ccd5f07-49da-46ac-91d3-ecca054fce4a︠
import numpy


#Refs: quatum gravity on a laptop: 1+1 cdt from Normal S Israel and John F Linder
#Refs: Two Dimensional Causal Dynamical Triangulation by Normal S Israel
#L = dT timelike side - diagonal of light cone
#minkowski 1+1 light cone: sides dT=L,  height = dt, base dx = L/2
#Am = area of a light cone triangle
# Ser = Euclidean Regge action 1+1, chi = Eular characteristic = 2 for torus,
#cosmo= rescaled cosmological const: cosmoprime=cosmoxAe/(8pi)
#Na= number of triangles, Nv=number of vertices, note= Na=2Nv



#Basic input into 1+1 CDT
L=1
dT=L
dx=L/2
#dt = L*sqrt(3)/2
dt =sqrt(dT^2+dx^2)
dy =sqrt(L^2-dx^2)
Am = 0.5*dx*dt
Ae= 0.5*dx*dt
chi =2
cosmoprime=log(2)
Na=2
Nv=6
Ser = (1/8*pi)*(2*pi*chi - Na*Ae*cosmoprime)
#Zp = sum over vertices()
Zp = (1/factorial(Nv))*exp(-2*cosmoprime*Nv)

print 'dt=',dt
print 'Minkowski Area=',Am
print 'dy=',dy
print 'Euclidean Area=',Ae
print 'Eucliean regge action =', Ser
print 'Regge partition function =', Zp

#Monte carlo analysis
#alexander move for 1+1 splits vertex in two and adds two triangles  at same time slice,
#inverse alexander move fused two vertices and deletes two triangles
#np = no of past time-like edges
#nf=no  future time-like edges
#example from paper fig 6
np=3
npprime=1
nf=2
nfprime=1
ProbM=(Nv/Nv+1)*((np*nf)/(npprime*nfprime))*exp(-cosmoprime)
ProbRevM = (1/(npprime+nfprime))*exp(cosmoprime)
print 'ProbM=', ProbM
print 'ProbRevM=',ProbRevM

#toy model values
#Zs = sum from N=1 to N=infinity ()

Zs=1/(exp(cosmoprime)-1)

#averages  <O> =(Sum (O*exp(-cosmoprime*Na))/(sum(exp(-cosmoprime*Na)))
#N=no of distinct triangles
#aveNk = average of N^k
#N=5 in example
N=5
k=2
aveNk =(1/Zs)*(N^k)*exp(-cosmoprime*N)

print 'Zs=', Zs
print 'Average of N^k =', aveNk

#set up initial universe








︡8d8e76a4-3df6-4a4d-a48b-ff3972d60f99︡{"stdout":"dt= 1/2*sqrt(5)\n"}︡{"stdout":"Minkowski Area= 0.125000000000000*sqrt(5)\n"}︡{"stdout":"dy= 1/2*sqrt(3)\n"}︡{"stdout":"Euclidean Area= 0.125000000000000*sqrt(5)\n"}︡{"stdout":"Eucliean regge action = 1/8*pi*(4*pi - 0.250000000000000*sqrt(5)*log(2))\n"}︡{"stdout":"Regge partition function = 1/720*e^(-12*log(2))\n"}︡{"stdout":"ProbM= 12*e^(-log(2))\n"}︡{"stdout":"ProbRevM= 1\n"}︡{"stdout":"Zs= 1\n"}︡{"stdout":"Average of N^k = 25*e^(-5*log(2))\n"}︡
︠03a2bc5d-f4f9-4d5c-a3e0-742b698a7f6f︠
︡ef3581d9-bece-4ee6-ad01-6890252923b2︡
︠5168e332-fc79-41b1-89a3-b83cf961289c︠
### This script estimates pi by shooting randomly at a circle inscribed in a square
var ('x y r n'); r = 1; inside = 0; points = []
n = 100  ## Try changing this! This is the number of shots the estimate is based on

### Shoot randomly into the square:
for i in range(0,n):
    [x,y]=[random(),random()]
    points.append([x,y])

### If a shot lands inside the circle, make a note of it
    if (y <= sqrt((r^2)-(x^2))):
        inside += 1

### Approximate pi based on the fraction of shots that landed in the circle
### Area of circle = pi*r^2; Area of square = (2*r)^2 = 4*r^2
### Shots in circle / Shots in square = (pi*r^2)/(4*r^20 = pi()/4
piapprox = 4*(inside / n)
estimate = "Based on "
estimate += str(n)
estimate += " shots, pi is ~= "
estimate += str(piapprox.n())
show(estimate)

### Graph the solution
circle = []
for i in range(0,1000):
    x = i/1000
    y = sqrt((r^2)-(i/1000)^2)
    circle.append([x,y])

graph = list_plot(points)
graph += list_plot(circle,color='red',figsize=[5,4],plotjoined=true)
show(graph)
︡b11c53d1-ff97-44a1-89fa-7f365e43bc13︡{"stdout":"(x, y, r, n)\n"}︡{"tex":{"tex":"Based on 100 shots, pi is ~= 0.0400000000000000","display":true}}︡{"once":false,"file":{"show":true,"uuid":"f88fa2cf-af58-437e-bc55-bb52b7ff4a4e","filename":"/mnt/home/gl8suFlY/.sage/temp/compute1a/29065/tmp_EaMhwb.png"}}︡
︠832ecf57-3f73-4ff9-ba52-01c98f38bd79︠


r = [(random(),random()) for _ in range(5)]
#sage: list_plot(r,color='red')
points = PointConfiguration(r)
triang = points.triangulate()
#points.bistellar_flips()

Tpos, Tneg = points.bistellar_flips()[2]
Tpos.plot(axes=False)
Tneg.plot(axes=False)

#triang.plot(axes=False)
︡af0add7f-8a55-42b5-afa3-3950c3facdc3︡{"once":false,"file":{"show":true,"uuid":"924efbae-dbe5-4cad-99f6-793707f1aa16","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/3659/tmp_T9VpH6.png"}}︡{"once":false,"file":{"show":true,"uuid":"0bbc15cb-fa8f-449c-9a46-ecfd38484f39","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/3659/tmp_GBlmmb.png"}}︡
︠ba7d5d77-b436-434a-96d2-3bc9fe57d957︠

︡ab12572a-72be-4abc-a212-285264f2a1d1︡
︠12fb1fd7-a14a-4c72-88f3-a7f88b8a8264i︠

︡7b02485f-4875-4efd-8342-7d57764fa24d︡
︠ebc53c4a-8707-4c2f-bbe9-616267150b81︠
## the preferred way if your GUI has a similar method
#goto(x ,y)
x=0
y=0
triangle=[]
plotter=[]


## offset the postion otherwise

v1=[0,0]
v2=[0.5,1]
v3=[1,0]
v4=[1,0]
v5=[1.5,1]
v6=[2,0]
triangle1=polygon([v1,v2,v3])
triangle2=polygon([v4,v5,v6])
g1=plot(triangle1,  aspect_ratio=1)
g2=plot(triangle2,  aspect_ratio=1)
plot(g1+g2)

count=0
while count <= 3:
    print 'count=',count
    plotter[count]=plot(triangle[count], aspect_ratio=1)
    plot(g[count])

#g = triangle.plot()
#x=x+1
#y=y+1
#count=count+1



︡180d25a0-16dd-4842-8735-982d84c4540f︡{"once":false,"file":{"show":true,"uuid":"b247586a-21ca-4a5d-b327-f26bbcba233f","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/3659/tmp_7nidaX.png"}}︡{"stdout":"count= 0\n"}︡{"stderr":"Error in lines 20-23\nTraceback (most recent call last):\n  File \"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sagemathcloud/sage_server.py\", line 680, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 3, in <module>\nIndexError: list index out of range\n"}︡
︠95a2662e-29a0-4aca-83e5-66fe15e6f1e2︠
︡b2bfbb1d-77bf-4f8a-8f48-e17fd5f892e8︡
︠13be4481-df4c-4684-8a41-c98d2620b54a︠









