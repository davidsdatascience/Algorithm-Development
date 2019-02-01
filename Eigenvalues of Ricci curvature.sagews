︠a1afa190-3672-430e-8d0f-f8450a99c1b6︠
import numpy

g = Graphics()
eigen_data0=[]
eigen_data1=[]
eigen_data2=[]
#j0_data=(1,2,3,4,5,6,7,8,9,10)

#j0=1
j1 = sorted([20.1576861805, 28.1146660381, 28.1146640778],reverse=1) #values of curvature j0=1



#j0=2
j2 = sorted([270.460743592, 127.085984119, 148.188486522, 148.188478256, 270.460752701],reverse=1)

#j0=3
j3 = sorted([1091.55040181, 806.935082102, 392.519690128, 413.535139678, 1047.62743, 806.93506034, 413.535135393],reverse=1)

#j0=4
j4 = sorted([2378.56605385, 855.383921284, 2930.75401717, 868.101419219, 1873.67182236, 2930.7540546, 2129.10288174, 1873.67194726, 868.101487484],reverse=1)

#j0=5
j5 = sorted([4606.74986746, 1543.91657105, 6446.3330304, 5212.249148, 6446.33268331, 1549.98937441, 5212.24874424, 3629.19596864, 3629.19600928, 3827.96291558, 1549.98938392],reverse=1)

#j0=6
j6 = sorted([12325.1856882, 6156.30576354, 10247.890531, 8083.35798093, 8697.79712352, 2488.8313406, 2491.42576171, 12311.3751055, 2491.42605869, 10247.8911863, 8697.79735173, 6156.30587173, 6275.85237521],reverse=1)

#j0=7
j7 = sorted([21337.5829065, 3720.69335586, 3721.71955023, 18191.1256612, 13055.9208879, 21337.5818673, 3721.71925346, 15727.6639363, 18075.0963804, 15727.6633961, 13622.0781294, 13622.0788615, 9516.66894167, 9577.45460541, 9516.66881947],reverse=1)

#j0=8
j8 = sorted([5264.2585067, 5264.59621606, 34353.8630614, 26228.9233099, 19641.7933763, 29716.924672, 34353.8627143, 5264.59582423, 13778.8525975, 20067.4742474, 13778.8538376, 13807.2091495, 29716.9221033, 23384.3447746, 20067.4729355, 25724.5183223, 23384.3434337],reverse=1)

#j0=9
j9 = sorted([52441.3123793, 37158.9710861, 7163.74004232, 7163.76113267, 46018.6532367, 52439.6746808, 7163.75927499, 27947.2019303, 46018.6535836, 40695.7702608, 19073.3786685, 19086.4112014, 19073.3792118, 40695.7714404, 35672.6321665, 33675.8502935, 33675.8513422, 28203.0821612, 28203.0790124],reverse=1)

#j0=10
j10 = sorted([9847.51777253, 9847.37267737, 70990.7885932, 9847.37371234, 53767.0941348, 79932.0113091, 79932.0134012, 70971.0239406, 39659.8986264, 26570.2921089, 26576.8288593, 26570.2935315, 63380.2782577, 63380.2798987, 57207.2071253, 57207.2073818, 48766.7660308, 39796.8134029, 39796.8158672, 50260.2435195, 48766.7675443],reverse=1)

#eigen_data=[]
j0_data=[1,2,3,4,5,6,7,8,9,10]

#print j0_data[0]

eigen_data0.append(j1[0]/10000)
eigen_data0.append(j2[0]/10000)
eigen_data0.append(j3[0]/10000)
eigen_data0.append(j4[0]/10000)
eigen_data0.append(j5[0]/10000)
eigen_data0.append(j6[0]/10000)
eigen_data0.append(j7[0]/10000)
eigen_data0.append(j8[0]/10000)
eigen_data0.append(j9[0]/10000)
eigen_data0.append(j10[0]/10000)

eigen_data1.append(j1[2]/10000)
eigen_data1.append(j2[2]/10000)
eigen_data1.append(j3[2]/10000)
eigen_data1.append(j4[2]/10000)
eigen_data1.append(j5[2]/10000)
eigen_data1.append(j6[2]/10000)
eigen_data1.append(j7[2]/10000)
eigen_data1.append(j8[2]/10000)
eigen_data1.append(j9[2]/10000)
eigen_data1.append(j10[2]/10000)

eigen_data2.append(j1[-1]/10000)
eigen_data2.append(j2[-1]/10000)
eigen_data2.append(j3[-1]/10000)
eigen_data2.append(j4[-1]/10000)
eigen_data2.append(j5[-1]/10000)
eigen_data2.append(j6[-1]/10000)
eigen_data2.append(j7[-1]/10000)
eigen_data2.append(j8[-1]/10000)
eigen_data2.append(j9[-1]/10000)
eigen_data2.append(j10[-1]/10000)


evalues=[]
evalues.append(j1)
evalues.append(j2)
evalues.append(j3)
evalues.append(j4)
evalues.append(j5)
evalues.append(j6)
evalues.append(j7)
evalues.append(j8)
evalues.append(j9)
evalues.append(j10)


print evalues

#print j1[0]


#print eigen_data
#print j0_data


mono1=zip(j0_data,eigen_data0)
mono2=zip(j0_data,eigen_data1)
mono3=zip(j0_data,eigen_data2)
#print mono1
sp1=scatter_plot(mono1)
sp2=scatter_plot(mono2)
sp3=scatter_plot(mono3)
x = text('spin',(11,-1))
y = text('eigenvalue',(-1,10))
#point(mono1,xmax=10,size=15, figsize=4)
g=sp1+sp2+sp3+x+y
g.show(title='Eigenvalues vs spin for a monochromatic 4-valent vertex')






︡9360f487-e2e8-4b88-8bc2-6b4b4f599eb3︡{"stdout":"[[28.1146660381000, 28.1146640778000, 20.1576861805000], [270.460752701000, 270.460743592000, 148.188486522000, 148.188478256000, 127.085984119000], [1091.55040181000, 1047.62743000000, 806.935082102000, 806.935060340000, 413.535139678000, 413.535135393000, 392.519690128000], [2930.75405460000, 2930.75401717000, 2378.56605385000, 2129.10288174000, 1873.67194726000, 1873.67182236000, 868.101487484000, 868.101419219000, 855.383921284000], [6446.33303040000, 6446.33268331000, 5212.24914800000, 5212.24874424000, 4606.74986746000, 3827.96291558000, 3629.19600928000, 3629.19596864000, 1549.98938392000, 1549.98937441000, 1543.91657105000], [12325.1856882000, 12311.3751055000, 10247.8911863000, 10247.8905310000, 8697.79735173000, 8697.79712352000, 8083.35798093000, 6275.85237521000, 6156.30587173000, 6156.30576354000, 2491.42605869000, 2491.42576171000, 2488.83134060000], [21337.5829065000, 21337.5818673000, 18191.1256612000, 18075.0963804000, 15727.6639363000, 15727.6633961000, 13622.0788615000, 13622.0781294000, 13055.9208879000, 9577.45460541000, 9516.66894167000, 9516.66881947000, 3721.71955023000, 3721.71925346000, 3720.69335586000], [34353.8630614000, 34353.8627143000, 29716.9246720000, 29716.9221033000, 26228.9233099000, 25724.5183223000, 23384.3447746000, 23384.3434337000, 20067.4742474000, 20067.4729355000, 19641.7933763000, 13807.2091495000, 13778.8538376000, 13778.8525975000, 5264.59621606000, 5264.59582423000, 5264.25850670000], [52441.3123793000, 52439.6746808000, 46018.6535836000, 46018.6532367000, 40695.7714404000, 40695.7702608000, 37158.9710861000, 35672.6321665000, 33675.8513422000, 33675.8502935000, 28203.0821612000, 28203.0790124000, 27947.2019303000, 19086.4112014000, 19073.3792118000, 19073.3786685000, 7163.76113267000, 7163.75927499000, 7163.74004232000], [79932.0134012000, 79932.0113091000, 70990.7885932000, 70971.0239406000, 63380.2798987000, 63380.2782577000, 57207.2073818000, 57207.2071253000, 53767.0941348000, 50260.2435195000, 48766.7675443000, 48766.7660308000, 39796.8158672000, 39796.8134029000, 39659.8986264000, 26576.8288593000, 26570.2935315000, 26570.2921089000, 9847.51777253000, 9847.37371234000, 9847.37267737000]]\n"}︡{"once":false,"file":{"show":true,"uuid":"b3e7994e-a1f5-435c-a97f-a9c7ab1f6d70","filename":"/projects/4dba49b8-22b8-4e2c-b9ba-9311f4fced28/.sage/temp/compute3dc2/15236/tmp_CaBA2l.png"}}︡
︠ba76ae59-6945-48c9-ba1b-bd396a8eec2a︠










