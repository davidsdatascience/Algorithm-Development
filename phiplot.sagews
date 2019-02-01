︠faad474a-f55f-4cf9-9ee2-ee572d3d5388s︠
#Allow spins in EPRL-FK model are 1/2 integer
#Immirzi parameter gamma = numerical_approx( ln(2)/(pi*sqrt(2)))
gamma = numerical_approx( ln(2)/(pi*sqrt(2)))
#print 'gamma = ', gamma

jf=0.5
#lp is the planck length
lp=1.6*10^(-35)
area=jf*lp^2
#print 'area of face =', area


#large limit squared norm phi
j1=0.5
j2=0.5
j3=0.5

phi=(8*(1-gamma^2)^(-3/2))/((j1+j2)*(j2+j3)*(j1+j3))
print'phi=',phi

phi_data=[]
j_data=[]



for i in range(50):
        j=j1+j2+j3
        j1=j1+0.5
        phi_data.append((8*(1-gamma^2)^(-3/2))/((j1+j2)*(j2+j3)*(j1+j3)))
        j_data.append(j)
        i=i+1


phiplot=zip(j_data, phi_data)
list_plot(phiplot,title='Plot of phi vs j' )











︡2d803d35-d445-4039-843c-d5869f802160︡︡{"stdout":"phi= 8.30122641614987\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"54fcbf10-411e-4e78-b666-4dca25b8afd1","filename":"/projects/8b8ad026-96f8-4701-8eaf-1fe9fed2ab49/.sage/temp/compute2-us/25131/tmp_doHS_m.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠1e2499f9-6fb7-4dd7-b676-0c6bec659137s︠

︡6837b5d9-933b-4a0c-947e-21f76a2e63b2︡︡{"done":true}
︠67f6c74d-4464-4f20-9c26-0930e4689066︠

︡14fe6553-5f8d-4207-8a68-93009ea7d137︡︡{"done":true}
︠f0774187-ea3b-40ea-bd65-601eaa026432︠

︡e27bb595-5c6c-4d95-961a-c62b89ef4a1d︡
︠b02ea370-bfdd-4909-955b-6dac220eb82f︠
︡e8a8ea1d-fb39-473b-83ff-e66a7029313b︡︡{"done":true}
︠7933bd32-f532-44ff-844b-efc65fecaade︠
︡e60227fd-742d-4d4a-b572-f1cd466ea352︡︡{"done":true}
︠68d92f54-fac6-4649-a3d2-746fd75ec324︠









