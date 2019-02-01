︠edaa6ddd-674d-49c8-889b-56081375cc5a︠

#This project looks at various representations of the quantum tetrahedron volume operator.
#hypergeometric functions
#calculate Q values

import numpy
j1=1.0
j2=1.0
j3=1.5
j4=1.5

#sage: import mpmath
#sage: maxima.hgfred([2,3],[4],5)

#sage: maxima.hgfred([2,3],[4],5).n()

#sage: mpmath.hyp2f1(2,3,4,5)


#sage: from sage.functions.hypergeometric import closed_form
#sage: [2*closed_form(hypergeometric([1-n,2-n],[2],-1)) for n in [1..20]]




load("ops.sage")


#load("vol.sage")
#evaq=vol(j1,j2,j3,j4)
#print evaq


︡ee2ac7b6-9372-48dc-88bf-21b802c3f788︡{"stdout":"3*(8*(log(-4)/25-1/20)+16*(13/400-2*log(-4)/125))/4\n"}︡{"stdout":"0.156542129333755 + 0.150796447372310*I\n"}︡{"stdout":"mpc(real='0.15654212933375475', imag='0.15079644737231007')\n"}︡{"stdout":"[2, 2, 0, -2, 0, 4, 0, -10, 0, 28, 0, -84, 0, 264, 0, -858, 0, 2860, 0, -9724]\n"}︡{"stdout":"d= 3\n0.0000000000\n1.581138830*I\n2.000000000*I\nvolume of tetrahedron = 4.516201729e-104 m3\nvolume of tetrahedron = 6.567290233e-112 m3\nArea of face 1= 1.847e-70 m2\nArea of face 2= 1.847e-70 m2\nArea of face 3= 2.529e-70 m2\nArea of face 4= 2.529e-70 m2\nTotal area of quantum tetrahedron = 9.434e-70 m2\nangle between faces 1 and 2 in quantum tetrahedron =  1.633 radians\nangle between faces 1 and 2 in quantum tetrahedron =  93.58 degrees\n"}︡
︠ca62eb4b-8098-40a9-a2f9-175edba97115︠
︡7df32cf4-f2f2-4adf-af2f-dc5daa596360︡
︠4a464a3c-27a7-4d23-a1ea-080d5e7bf4b7︠
︡503270d3-6185-4375-b16f-7835a7b79d73︡
︠0fb8ba4f-7db9-42b0-9197-581535e128cd︠
︡1e39c3b4-1277-454a-84d9-80a03d377f70︡
︠7ee11ec2-51f6-4ea6-b7cb-37086e2ef80b︠
︡4c72d471-598d-4f5e-8580-eb2fa12518d0︡
︠2656c98c-8450-4c80-8e62-8badbc4744c0︠
︡4ab36aa0-2843-4d5b-9dba-0a3a400b54e0︡
︠c7b23deb-8be9-4b1f-bf8c-a7be90fa2e69︠









