︠9ed46fb2-9526-4904-bfa5-9efe52008e57︠

︠21608084-bb79-4a01-8106-dccb5d4b2722︠
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

def spacetime_plotter(rangefig) :
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
    return plotter




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



N=0
M=0

def intial_spacetime(N,M):
    for a in range(0,N):
        for b in range(0,M):
            j=a
            i=b
            vertexpast0 =(0+j,0+i)
            vertexpast1=(0.5+j,1+i)
            vertexpast2=(1+j, 0+i)
            vertexfuture0=(0.5+j,1+i)
            vertexfuture1=(1+j, 0+i)
            vertexfuture2=(1.5+j, 1+i)
            trianglepast.append((vertexpast0[i],vertexpast1[i],vertexpast2[i]))
            trianglefuture.append((vertexfuture0[i],vertexfuture1[i],vertexfuture2[i]))
            past.append(trianglepast)
            future.append(trianglefuture)
            gpast.append(polygon(trianglepast[i]))
            gfuture.append(polygon(trianglefuture[i],color='red'))
    vertex=trianglepast+trianglefuture
    plotter=gpast+gfuture
    space=past+future
    return plot(plotter,axes=False, aspect_ratio=2)

#intial_spacetime(5,5)











def spacetime_vertex_list(rangefig):
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
     space=past+future
     plotter=gpast+gfuture
     return plot(plotter,axes=False, aspect_ratio=2)
        #return space










def random_between(j,k) :
   a=int(random()*(k-j+1))+j
   return a


#pachner moves
#pachner moves
#def pachner_move(rangefig):
   # span = len(spacetime_vertex_list(rangefig))/6
   # r=random_between(0,span)#6xrangefig
    #r1=random_between(0,2)
   # changevertex=spacetime_vertex_list(rangefig)[r]
    ##changevertex=vertex[r]
    #sel=changevertex[r1]
    #if sel[1]==0:
            #move1to2newtriangle=((sel[0],sel[1]),(sel[0]+0.5,sel[1]+1),(sel[0]+1,sel[1]+0))
           # pnew=polygon(move1to2newtriangle)
            #p=plot(pnew)
            #case= 'past add'
   # else:
           # move1to2newtriangle=((sel[0],sel[1]),(sel[0]+0.5,sel[1]-1),(sel[0]+1,sel[1]+0))
            #pnew=polygon(move1to2newtriangle,color='red')
            #p=plot(pnew)
            #case = 'future add'

    #return case

def pachner_move(rangefig):
    span = len(spacetime_vertex_list(rangefig))/6
    r=random_between(0,span)#6xrangefig
    r1=random_between(0,2)
    changevertex=spacetime_vertex_list(rangefig)[r]
    #changevertex=vertex[r]
    sel=changevertex[r1]
    if sel[1]==0:
            move1to2newtriangle=((sel[0],sel[1]),(sel[0]+0.5,sel[1]+1),(sel[0]+1,sel[1]+0))
            pnew=polygon(move1to2newtriangle)
            p=plot(pnew)
            case= 'past add'
    else:
            move1to2newtriangle=((sel[0],sel[1]),(sel[0]+0.5,sel[1]-1),(sel[0]+1,sel[1]+0))
            pnew=polygon(move1to2newtriangle,color='red')
            p=plot(pnew)
            case = 'future add'

    return case




def inverse_pachner_move(rangefig):
    span = len(spacetime_vertex_list(rangefig))/6
    r=random_between(0,span)#6xrangefig
    r1=random_between(0,2)
    changevertex=spacetime_vertex_list(rangefig)[r]
    #changevertex=vertex[r]
    sel=changevertex[r1]
    if sel[1]==0:
        #
        #
        #add methods
        case='loss past'
    else:
        #
        #
        #
        case='loss future'
    return case


def create_spacetime_cell():
    return create_spacetime(1)

def new_space_at(x):
        i=x
        vertexpast0 =(0+i,0)
        vertexpast1=(0.5+i,1)
        vertexpast2=(1+i, 0)
        vertexfuture0=(0.5+i,1)
        vertexfuture1=(1+i, 0)
        vertexfuture2=(1.5+i, 1)
        trianglepast=(vertexpast0,vertexpast1,vertexpast2)
        trianglefuture=(vertexfuture0,vertexfuture1,vertexfuture2)
        past.append(trianglepast)
        future.append(trianglefuture)
        gpast.append(polygon(trianglepast))
        gfuture.append(polygon(trianglefuture,color='red'))
        vertex=trianglepast+trianglefuture
        space=past+future
        plotter=gpast+gfuture
        return plot(plotter,axes=False, aspect_ratio=2)
        #return space

def spacestrip_at(=(0.5+j,1+i)
        vertexpast2=(1+j, 0+i)
        vertexfuture0=(0.5+j,1+i)
        vertexfuture1=(1+j, 0+i)
        vertexfuture2=(1.5+j, 1+i)
        trianglepast=(vertexpast0,vertexpast1,vertexpast2)
        trianglefuture=(vertexfuture0,vertexfuture1,vertexfuture2)
        past.append(trianglepast)
        future.append(trianglefuture)
        gpast.append(polygon(trianglepast))
        gfuture.append(polygon(trianglefuture,color='red'))
        vertex=trianglepast+trianglefuture
        space=past+future
        plotter=gpast+gfuture
        return plot(plotter, aspect_ratio=2)
        #return space



def subtract_cell_at_i(i,a):
    vertex=a
    del vertex[i]
    return vertex

new_space_at(5)


#L = [new_space_at(n) for n in range(0,30)]
#plot(L[:30],axes=False, aspect_ratio=2)
#print  L[:10]


#new_time_at(0)
#a=new_time_at(0)
#a=0
#b=0
#n1=3
#n2=5
#for a in range(0,n1):
   # for b in range(0,n2):
     #spacestrip_at(a,b)








#subtract_cell_at_i(2,a)
#pachner_move()
#create_spacetime_cell()
︡39f5c58d-bf73-4cb6-b20b-795e68e10fe5︡{"stderr":"Error in lines 80-96\nTraceback (most recent call last):\n  File \"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sagemathcloud/sage_server.py\", line 671, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"<string>\", line 13\n    vertex=trianglepast+trianglefuture\n                                     ^\nIndentationError: unindent does not match any outer indentation level\n"}︡
︠860a8a8a-b23d-4609-8b05-5342faa5f566︠
︡ef1c23f2-963b-469d-8ea8-edfdc7aa9a37︡
︠c5e1e191-4232-4a87-bf44-959641f5ef6e︠
︡a00c311e-e1af-4050-b954-7069df94af84︡
︠0f47b7a6-5dac-45cb-be3a-d5666c5bf7ac︠









