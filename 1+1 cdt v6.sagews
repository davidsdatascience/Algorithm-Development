︠fbe06d1f-a20c-44d2-a1bf-513c3adbc878︠
from sage.plot.disk import Disk




space=[]
time=[]
st=[]



h=32;t=32
G = Graphics()
p=Graphics()
for x in srange(0,h-1):
    for y in srange(0,t):
            x=x+0.5
            l = [[0+x,0+(sqrt(0.75)*y)],[0.5+x,sqrt(0.75)+(sqrt(0.75)*y)],[1.0+x,0+(sqrt(0.75)*y)]]
            f = [[0.5+x,sqrt(0.75)+(sqrt(0.75)*y)],[1.5+x,sqrt(0.75)+(sqrt(0.75)*y)],[1.0+x,0+(sqrt(0.75)*y)]]
            space.append(l)
            space.append(f)
            G+=polygon(l)+polygon(f, color='red')
G.show(figsize=[h,t])
print 'no of triangles=',len(space)
print 'space0=',space[0]
print 'space1=',space[1]
print 'space2=',space[2]
p=polygon(space[5])
p.show (figsize=[2,2])
#d=disk((0,0), 1, (0, pi/2)).plot3d(z=2)
#d.show()
︡d40a6ea2-307f-45ea-84a7-5a1b1fd2fd16︡{"once":false,"file":{"show":true,"uuid":"4c1f761d-e5af-472c-82f4-a028b29693f7","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/9303/tmp_zjKcxS.png"}}︡{"stdout":"no of triangles= 1984\n"}︡{"stdout":"space0= [[0.500000000000000, 0.000000000000000], [1.00000000000000, 0.866025403784439], [1.50000000000000, 0.000000000000000]]\n"}︡{"stdout":"space1= [[1.00000000000000, 0.866025403784439], [2.00000000000000, 0.866025403784439], [1.50000000000000, 0.000000000000000]]\n"}︡{"stdout":"space2= [[1.00000000000000, 0.866025403784439], [1.50000000000000, 1.73205080756888], [2.00000000000000, 0.866025403784439]]\n"}︡{"once":false,"file":{"show":true,"uuid":"8bd78310-b126-49c5-a625-5b0f5642cc19","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7a/9303/tmp_MborDM.png"}}︡
︠528a70cf-6833-4149-80d0-415e0e305c78︠









