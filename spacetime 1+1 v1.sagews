︠9a80b2f9-a7c2-4613-8882-b026c8b44205︠
from sage.plot.graphics import GraphicsArray
import numpy



x=0
y=0
time=[]
point=[]
point0=[]
point1=[]
point2=[]
vertex=[]
vertexpast0=[]
vertexpast1=[]
vertexpast2=[]
vertexfuture0=[]
vertexfuture1=[]
vertexfuture2=[]
trianglepast=[]
trianglefuture=[]
plotter=[]
gpast=[]
gfuture=[]
past=[]
future=[]
space=[]
spacetime=[]
rangefig=0
time=0
timeslice=[]

def create_spacetime(rangefig) :
    for i in range(rangefig):
        vertexpast0.append((0+i,0))
        vertexpast1.append((0.5+i,1))
        vertexpast2.append((1+i, 0))
        vertexfuture0.append((0.5+i,1))
        vertexfuture1.append((1+i, 0))
        vertexfuture2.append((1.5+i, 1))
        trianglepast.append((vertexpast0[i],vertexpast1[i],vertexpast2[i]))
        trianglefuture.append((vertexfuture0[i],vertexfuture1[i],vertexfuture2[i]))
        gpast.append(polygon(trianglepast[i]))
        gfuture.append(polygon(trianglefuture[i],color='red'))
    vertex=trianglepast+trianglefuture
    plotter=gpast+gfuture
    return plot(plotter,aspect_ratio=2)

def create_timeslice(rangefig,time) :
    j=time
    for i in range(rangefig):
        vertexpast0.append((0+i,0+j))
        vertexpast1.append((0.5+i,1+j))
        vertexpast2.append((1+i, 0+j))
        vertexfuture0.append((0.5+i,1+j))
        vertexfuture1.append((1+i, 0+j))
        vertexfuture2.append((1.5+i, 1+j))
        trianglepast.append((vertexpast0[i],vertexpast1[i],vertexpast2[i]))
        trianglefuture.append((vertexfuture0[i],vertexfuture1[i],vertexfuture2[i]))
        gpast.append(polygon(trianglepast[i]))
        gfuture.append(polygon(trianglefuture[i],color='red'))
    vertex=trianglepast+trianglefuture
    plotter=gpast+gfuture
    return plot(plotter,aspect_ratio=2)



timeslice.append(create_timeslice(10,0))
timeslice.append(create_timeslice(10,1))
timeslice.append(create_timeslice(10,2))
timeslice.append(create_timeslice(10,3))
timeslice.append(create_timeslice(10,4))
timeslice.append(create_timeslice(10,5))






G = GraphicsArray([timeslice])
G.show()



︡7cee743d-e5eb-461e-bec3-d4e3b323d8dd︡{"once":false,"file":{"show":true,"uuid":"43b96e60-54e5-4b51-9800-27dce8dacc6d","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute5a/21820/tmp_ORnEmz.png"}}︡
︠869c5a8e-1fc5-49a0-bf39-90d8a37c983c︠


︡08717b83-6832-4746-bd9b-3c5bec1baff0︡
︠a27df6e0-c811-4d3c-b83b-0084d4678e75︠
︡5a57c3fa-a7df-47a3-9f07-bd67b1d49dd5︡
︠bccd654b-e117-4eab-903a-81e65dfc974e︠









