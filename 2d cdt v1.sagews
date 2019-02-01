︠5dc5c1fb-cbd1-4b33-a1c5-b85146e8608a︠
import random
import matplotlib.pyplot as plt



spacelist=[]
type1list=[]
type2list=[]
space=[]
time=[]
st=[]
count=0
index=[]
triangle = []
h=0
t=0
#boundary=3
#boundarytype='none'

#functions
#spacetime_create(h,t) - done
#spacelist_create(h,t) - done
#spaceslice_create(spacetime)-done
#display_slice(spaceslice) -done
#move(spaceslice)


def spacetime_create(h,t):
    G = Graphics()
    for y in srange(0,t):
        for x in srange(0,h):
            type1 = [[0+x,0+y],[1+x,0+y],[0+x,1+y]]
            type2 = [[1+x,0+y],[0+x,1+y],[1+x,1+y]]
            spacelist.append(type1)
            spacelist.append(type2)
            type1list.append(type1)
            type2list.append(type2)
            G+=polygon(type1)+polygon(type2, color='red')
            #print 'no of triangles=',len(spacelist)
            #print'Number of space elements=', h
            #print 'Number of timeslices=', t
            a=len(spacelist)
            #print 'val=(i, type,time,vertex0, vertex1, vertex2,neighbour0,neighbour1,neighbour2,r1, r2)'
    for i in range(a):  # i will be particular triangle in spacetime triangulation
    #find neighbours
        if spacelist[i]in type1list:
            type=1 #type of triangle 1
            neighbour0=i+1
            neighbour1=i-1
            neighbour2=i-(2*h-1)
        if spacelist[i]in type2list:
            type=2 #type of triangle 2
            neighbour0=i+(2*h-1)
            neighbour1=i+1
            neighbour2=i-1
            #testing boundaries
        #if i % (2*h) == 0:
            #print i,'=','lhs'
        #if (i<2*h)and (i%2==0):
            #print i, '=','bottom'
        #if (i>((2*h*t)-(2*h)-1))and ((i%2)!=0):
            #print i, '=','top'
        #if ((i+1)%(2*h))==0:
            #print i,'=','rhs'
        #corner boundaries
        if i==0:
            neighbour0=i+1 #ok
            neighbour1=2*h-1 #ok
            neighbour2=((t*2*h)-(2*h)+1)#ok
            #print i,'=','bottom lhs corner'
        if i==(2*h-1):
            neighbour0=i+(2*h-1) #ok
            neighbour1=0 #ok
            neighbour2=i-1#ok
            #print i,'=','bottom rhs corner'
        if i==(t*2*h)-(2*h):
            neighbour0=i+1 #ok
            neighbour1=i+(2*h-1) #ok
            neighbour2=i-2*h#ok
            #print i,'=','top lhs corner'
        if i==(t*2*h)-1:
            neighbour0=h-2 #ok
            neighbour1=((t*2*h)-(2*h)) #ok
            neighbour2=i-1#ok
            #print i,'=','top rhs corner'
        vertex0=spacelist[i][0]
        vertex1=spacelist[i][1]
        vertex2=spacelist[i][2]
        time=spacelist[i][0][1]
        r1 =i%(2*h)#position along row
        r2=time%t#position up column
        #if spacelist[i]in type1list:
        #type=1 #type of triangle 1
        # neighbour0=i+1
        # neighbour1=i-1
        # neighbour2=i-(2*h-1)
        # if spacelist[i]in type2list:
        # type=2 #type of triangle 2
        # neighbour0=i+(2*h-1)
        # neighbour1=i+1
        # neighbour2=i-1
        val=(i,type,time,vertex0, vertex1, vertex2,neighbour0,neighbour1,neighbour2)
        #val[0]=triangle number from 0 ...h-1
        #val[1] =triangle type 1 or 2 : 1 up , 2 down
        #val[2]=time from 0 ..t-1
        #val[3]=vertex0
        #val[4]=vertex1
        #val[5]=vertex2
        #val[6]=neighbour0
        #val[7]=neighbour1
        #val[8]=neighbour2
    st.append(val)
    #print st[199]
    dis=G.show(figsize=[h,t])
    return dis


def spacelist_create(h,t):
    G = Graphics()
    for y in srange(0,t):
        for x in srange(0,h):
            type1 = [[0+x,0+y],[1+x,0+y],[0+x,1+y]]
            type2 = [[1+x,0+y],[0+x,1+y],[1+x,1+y]]
            spacelist.append(type1)
            spacelist.append(type2)
            type1list.append(type1)
            type2list.append(type2)
            G+=polygon(type1)+polygon(type2, color='red')
            #print 'no of triangles=',len(spacelist)
            #print'Number of space elements=', h
            #print 'Number of timeslices=', t
            a=len(spacelist)
            #print 'val=(i, type,time,vertex0, vertex1, vertex2,neighbour0,neighbour1,neighbour2,r1, r2)'
    for i in range(a):  # i will be particular triangle in spacetime triangulation
    #find neighbours
        if spacelist[i]in type1list:
            type=1 #type of triangle 1
            neighbour0=i+1
            neighbour1=i-1
            neighbour2=i-(2*h-1)
        if spacelist[i]in type2list:
            type=2 #type of triangle 2
            neighbour0=i+(2*h-1)
            neighbour1=i+1
            neighbour2=i-1
            #testing boundaries
        #if i % (2*h) == 0:
            #print i,'=','lhs'
        #if (i<2*h)and (i%2==0):
            #print i, '=','bottom'
        #if (i>((2*h*t)-(2*h)-1))and ((i%2)!=0):
            #print i, '=','top'
        #if ((i+1)%(2*h))==0:
            #print i,'=','rhs'
        #corner boundaries
        if i==0:
            neighbour0=i+1 #ok
            neighbour1=2*h-1 #ok
            neighbour2=((t*2*h)-(2*h)+1)#ok
            #print i,'=','bottom lhs corner'
        if i==(2*h-1):
            neighbour0=i+(2*h-1) #ok
            neighbour1=0 #ok
            neighbour2=i-1#ok
            #print i,'=','bottom rhs corner'
        if i==(t*2*h)-(2*h):
            neighbour0=i+1 #ok
            neighbour1=i+(2*h-1) #ok
            neighbour2=i-2*h#ok
            #print i,'=','top lhs corner'
        if i==(t*2*h)-1:
            neighbour0=h-2 #ok
            neighbour1=((t*2*h)-(2*h)) #ok
            neighbour2=i-1#ok
            #print i,'=','top rhs corner'
        vertex0=spacelist[i][0]
        vertex1=spacelist[i][1]
        vertex2=spacelist[i][2]
        time=spacelist[i][0][1]
        r1 =i%(2*h)#position along row
        r2=time%t#position up column
        #if spacelist[i]in type1list:
        #type=1 #type of triangle 1
        # neighbour0=i+1
        # neighbour1=i-1
        # neighbour2=i-(2*h-1)
        # if spacelist[i]in type2list:
        # type=2 #type of triangle 2
        # neighbour0=i+(2*h-1)
        # neighbour1=i+1
        # neighbour2=i-1
        val=(i,type,time,vertex0, vertex1, vertex2,neighbour0,neighbour1,neighbour2)
        #val[0]=triangle number from 0 ...h-1
        #val[1] =triangle type 1 or 2 : 1 up , 2 down
        #val[2]=time from 0 ..t-1
        #val[3]=vertex0
        #val[4]=vertex1
        #val[5]=vertex2
        #val[6]=neighbour0
        #val[7]=neighbour1
        #val[8]=neighbour2
    st.append(val)
    #print st[199]
    #dis=G.show(figsize=[h,t])
    return spacelist




#display_slice(spacelice)
def display_slice(spaceslice1):
        a=len(spaceslice1)
        spacelist1=[]
        G1 = Graphics()
        for i in range(a):
                #spacelist1.append(x)
               if i%2==0:
                    colour='red'
               if i%2 !=0:
                    colour='blue'
               G1+=polygon(spaceslice1[i], color=colour)
        dis=G1.show()
        return a




#list.insert(index, obj)









#slice1=spacelist[0:(2*h)-1]
#print 'slice1=',slice1
#move12=move(slice1)
#print mv


#display moe
#Gr = Graphics()
#slist=[]
#for i in range(0,len(move12)):
       #slist.append(move12[i])
       #print 'i=',i, 'triangle',i,'=',move12[i]
       #print slist
       #if i%2==0:
            #colour='red'
       #Gr+=polygon(move12[i], color=colour)
#print slist
#Gr.show(figsize=[len(move12),2])


#functions
#spacetime_create(h,t)
#spaceslice_create(spacetime) - use spacetime_create(h,t)
#display_slice(spaceslice)
#move(spaceslice)
#move_at_time_t(spaceslice, t)
#antimove(spaceslice)

def antimove(spaceslice):
    Graph = Graphics()
    a=len(spaceslice)
    b=randint(0,a-1)
    c=randint(0,1)
    d=spaceslice[b]
    t=0
    del spaceslice[a-1]
    del spaceslice[a-2]
    e=d[0]
    f=d[1]
    t=1
    #print spaceslice
    return spaceslice











#shift function
def shift(l, n):
    return l[n:] + l[:n]

#moves
def move(spaceslice):  # pachner move 1-2 in 1+1 CDT space=trangle lsit of vertex triplets
    Graph = Graphics()
    a=len(spaceslice)
    b=randint(0,a-1)
    c=randint(0,1)
    d=spaceslice[b]
    t=0
    spaceslice.append([[0+a/2,0+t],[1+a/2,0+t],[0+a/2,1+t]])
    spaceslice.append([[1+a/2,0+t],[0+a/2,1+t],[1+a/2,1+t]])
    e=d[0]
    f=d[1]
    t=1
    #print spaceslice
    return spaceslice


def move_at_time_t(spaceslice, t):  # pachner move 1-2 in 1+1 CDT space=trangle lsit of vertex triplets
    Graph = Graphics()
    a=len(spaceslice)
    b=randint(0,a-1)
    c=randint(0,1)
    d=spaceslice[b]
    newslice=[]
    y=t
    for x in srange(0,a/2):
            type1 = [[0+x,0+y],[1+x,0+y],[0+x,1+y]]
            type2 = [[1+x,0+y],[0+x,1+y],[1+x,1+y]]
            newslice.append(type1)
            newslice.append(type2)
    newslice.append([[0+a/2,0+t],[1+a/2,0+t],[0+a/2,1+t]])
    newslice.append([[1+a/2,0+t],[0+a/2,1+t],[1+a/2,1+t]])
    e=d[0]
    f=d[1]
    #print spaceslice
    return newslice


def antimove_at_time_t(spaceslice, t):
    Graph = Graphics()
    a=len(spaceslice)
    b=randint(0,a-1)
    c=randint(0,1)
    d=spaceslice[b]
    newslice=[]
    y=t
    for x in srange(0,a/2):
            type1 = [[0+x,0+y],[1+x,0+y],[0+x,1+y]]
            type2 = [[1+x,0+y],[0+x,1+y],[1+x,1+y]]
            newslice.append(type1)
            newslice.append(type2)
    del newslice[a-1]
    del newslice [a-2]
    e=d[0]
    f=d[1]
    #print spaceslice
    return newslice



#spacetime_create(10,10)
#spacelist_create(10,10)

def test():
    spacetime_create(10,10)
    spacelist_create(10,10)

#st1=spacelist_create(10,1)
#st1=spacelist_create(10,1)
#print st1
#move(spacelist_create(10,1))

#display_slice(st1)

#display_slice(st1)
#move(st1)
#display_slice(st1)
#move(st1)

#bc=move(ab)
#display_slice(bc)

#functions
#spacetime_create(h,t)
#spaceslice_create(spacetime) - use spacetime_create(h,t)
#display_slice(spaceslice)
#move(spaceslice)
#move_at_time_t(spaceslice, t)

#st=spacelist_create(10,1)
#print st
#display_slice(st)
#st1=move(st)
#display_slice(st1)
#antimove(st)
#display_slice(st)
#move(st)
#move(st)

#randomst

####################Euclidean action Se
#k=    #c^4/8*pi*G
#k2=
#N2=numberoftriangles
#cosmo=
#chi = 2# Euler characteristic
#lambda=k*cosmo
#Action =2*pi*chi -(k2*lambda*N2)
#dS=eta*abs(N2-V) #V=vol of universe  ~ small number - add to action terms used #to control extreme growth
#Pmove=exp(-delta*action)            #n->n+1 if, deltaS >0
#Pmove =1           #n->n+1 if,  deltaS =<0
#Pantimove=  Pmove*exp(deltaS)        #  n+1->n
#deltaS= #changeinaction
###############################
######test group1#################
#st=spacelist_create(10,1)
#h=[]
#for f in range(0,10):
#   ## b=randint(0,19)
#    #if b<15:
#        #antimove(st)
#    #if b>=15:
#       #move(st)
#
#    #g=len(st)
#    #h.append.g
#display_slice(st)
##################################

#############################
#st=spacelist_create(10,1)
#triangle=[]
#for t in range (0,10):
#    new=move_at_time_t(st, t)
#    display_slice(new)
###############################
#st=spacelist_create(10,1)
##
#for t in range (0,10):
#    new=antimove_at_time_t(st, t)
#    display_slice(new)
#######################################
#PERFECT COPY

st=spacelist_create(10,1)
sp=[]
value=[]
timeslice=[]
b=randint(0,19)
st1=st
for f in range (0,100):
    b=randint(0,19)
    timeslice.append(f)
    t=f
    if b<7:
        st1=antimove_at_time_t(st1,t)
        #print 'antimove'
        sp.append(st1)
        #display_slice(st1)
    if b>=7:
        st1=move_at_time_t(st1,t)
        #print 'move'
        sp.append(st1)
        #display_slice(st1)
#print timeslice
b1=len(sp)
for i in range(0, b1):
    value.append(len(sp[i]))
#print len(sp[i])
#print sp
#print timeslice
print value
#statistics of model:
cdtmean = numerical_approx(mean(value), digits=4)
cdtstd=numerical_approx(std(value, bias=False), digits=4)
cdtvariance= numerical_approx(variance(value, bias=False), digits=4)
print 'Mean volume of universe=',cdtmean,'after', len(value),'timesteps'
print 'Standard deviation of  volume of universe=',cdtstd,'over', len(value),'timesteps'
print 'variance of  volume of universe=',cdtvariance,'over', len(value),'timesteps'

#Display model:
universe=zip(timeslice,value)

#scatter_plot(universe,axes_labels=['$timeslice$ axis','$Volume$ axis']   )
line(universe,axes_labels=['$timeslice$ axis','$Volume$ axis']   )









︡3a0f6b73-f533-45c5-86d5-72c604c0080b︡{"stdout":"[18, 16, 14, 12, 14, 16, 14, 12, 10, 8, 10, 8, 6, 4, 6, 8, 10, 8, 6, 4, 6, 8, 10, 12, 14, 16, 18, 16, 18, 16, 14, 16, 18, 16, 18, 20, 18, 20, 18, 20, 22, 24, 22, 24, 22, 24, 22, 20, 18, 20, 22, 24, 26, 24, 26, 24, 26, 28, 30, 28, 30, 32, 34, 36, 34, 32, 30, 28, 30, 28, 30, 32, 34, 32, 30, 32, 34, 36, 38, 40, 42, 40, 38, 40, 42, 44, 46, 48, 50, 48, 50, 48, 50, 52, 54, 56, 58, 60, 58, 56]\n"}︡{"stdout":"Mean volume of universe= 26.24 after 100 timesteps\n"}︡{"stdout":"Standard deviation of  volume of universe= 14.40 over 100 timesteps\n"}︡{"stdout":"variance of  volume of universe= 207.2 over 100 timesteps\n"}︡{"once":false,"file":{"show":true,"uuid":"4e153579-7744-4974-a9bc-230077fa6876","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/1567/tmp_ZPCh81.png"}}︡
︠69dfcda1-f089-49fc-8848-09c56d128c7e︠

︡47116630-ca05-405c-bd30-28e58be901b1︡
︠9567a2af-4655-461a-ad3b-e778da1a4781︠

︡0e6feca1-b654-4dd7-abfd-e4755c100d4d︡
︠51f7bed2-d292-4ebf-ada4-a77888c1f2bc︠

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
##see http://docs.python.org/2/tutorial/datastructures.html

###sttrigles = {: 'future', : 'past}
#tel['guido'] = 4127
#predict size of universe/std in size = sqrt(2)
#crital lambda=1
︡b83a90ee-8233-4555-8a3a-df9b8abc9add︡{"stdout":"dt= 1/2*sqrt(5)\n"}︡{"stdout":"Minkowski Area= 0.125000000000000*sqrt(5)\n"}︡{"stdout":"dy= 1/2*sqrt(3)\n"}︡{"stdout":"Euclidean Area= 0.125000000000000*sqrt(5)\n"}︡{"stdout":"Eucliean regge action = 1/8*pi*(4*pi - 0.250000000000000*sqrt(5)*log(2))\n"}︡{"stdout":"Regge partition function = 1/720*e^(-12*log(2))\n"}︡{"stdout":"ProbM= 12*e^(-log(2))\n"}︡{"stdout":"ProbRevM= 1\n"}︡{"stdout":"Zs= 1\n"}︡{"stdout":"Average of N^k = 25*e^(-5*log(2))\n"}︡
︠27cf0aaa-3611-4426-93be-19222679462d︠


︡83bae883-df19-4daa-9e92-05735b00646f︡
︠0866db05-7a13-457b-9eb4-187ea54a1987︠

︡f100ace3-d44e-4647-a4ed-18a7b7936c42︡
︠9f18a374-b25d-4707-80b2-41ad42f822b9︠
︡d0d48fd9-3a70-44a2-828f-8740eff34dba︡
︠6a7b2dd9-ca86-44ea-bd64-73f96cd8b4d6︠
︡2e08d133-370d-4490-b2d7-d0aac9fb095c︡
︠4292b877-2a68-4b24-a3d7-86f591f4776a︠
︡563fb6a6-142b-45ba-adab-0d0b228f3110︡
︠5edcfc09-7ec7-4b26-8f39-f838c2d9bd55︠
︡e3ee78bc-a39c-4752-8ef1-14df77014868︡
︠3f9e53dd-666f-400d-be4a-a926160a31d1︠









