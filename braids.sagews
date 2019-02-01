︠aa366788-8755-4648-9487-573d4a835f73︠
#playing with braids and knots
#see  http://www.sagemath.org/doc/reference/groups/sage/groups/braid.html



print 'A braid group can be created by giving the number of strands, and the name of the generators:'
BraidGroup(3)
BraidGroup(3,'a')
BraidGroup(3,'a').gens()
BraidGroup(3,'a,b').gens()


print 'The elements can be created by operating with the generators, or by passing a list with the indices of the letters to the group:'
B.<s0,s1,s2> = BraidGroup(4)
s0*s1*s0
B([1,2,1])


print 'Left multiplication of a free group element by a braid'
B.<b0,b1,b2> = BraidGroup()
F.<f0,f1,f2,f3> = FreeGroup()
B.strands() == F.rank()   # necessary for the action to be defined
f1 * b1
f0 * b1
f1 * b1
f1^-1 * b1


print 'element of a finitely presented group'
B.<s0,s1,s2> = BraidGroup(4)
B
s0*s1/s2/s1
B((1, 2, -3, -2))


print 'Lawence-Krammer-Bigelow representation matrix'
B = BraidGroup(3)
b = B([1, 2, 1])
b.LKB_matrix()
c = B([2, 1, 2])
c.LKB_matrix()


print 'Alexander polynomial of the closure of the braid'
print 'the trefoil:'
B = BraidGroup(3)
b = B([1,2,1,2])
b.alexander_polynomial(normalized=False)
b.alexander_polynomial()

print 'figure 8 knot'
b = B([-1,2,-1,2])
b.alexander_polynomial(normalized=False)
b.alexander_polynomial()

print 'the Kinoshita-Terasaka knot:'
B = BraidGroup(4)
b = B([1,1,1,3,3,2,-3,-1,-1,2,-1,-3,-2])
b.alexander_polynomial(normalized=False)
b.alexander_polynomial()



print 'Burau matrix of the braid'
B = BraidGroup(4)
B.inject_variables()
b = s0*s1/s2/s1
b.burau_matrix()
s2.burau_matrix('x')
s0.burau_matrix(reduced=True)


print'left normal form of the braid'
B = BraidGroup(4)
b = B([1, 2, 3, -1, 2, -3])
b.left_normal_form()
c = B([1])
c.left_normal_form()



print 'permutation induced by the braid in its strands.'
B.<s0,s1,s2> = BraidGroup()
b = s0*s1/s2/s1
b.permutation()
b.permutation().cycle_string()


print 'Plot the braid'
B = BraidGroup(4, 's')
b = B([1, 2, 3, 1, 2, 1])
b.plot()
b.plot(color=["red", "blue", "red", "blue"])
B.<s,t> = BraidGroup(3)
b = t^-1*s^2
b.plot(orientation="left-right", color="red")


print'Plots the braid in 3d'
B = BraidGroup(4, 's')
b = B([1, 2, 3, 1, 2, 1])
b.plot3d()
b.plot3d(color="red")
b.plot3d(color=["red", "blue", "red", "blue"])


print'number of strands in the braid.'
B = BraidGroup(4)
b = B([1, 2, -1, 3, -2])
b.strands()


print 'the tropical coordinates'
B = BraidGroup(3)
b = B([1])
tc = b.tropical_coordinates(); tc
tc[0].parent()
b = B([-2, -2, -1, -1, 2, 2, 1, 1])
b.tropical_coordinates()



print 'Construct a Braid Group'
B.<a,b> = BraidGroup();  B
H = BraidGroup('a, b')
B is H
BraidGroup(3)





︡3cfb19d6-56b5-45c4-9aa8-70f107033b5c︡{"stdout":"A braid group can be created by giving the number of strands, and the name of the generators:\n"}︡{"stdout":"Braid group on 3 strands"}︡{"stdout":"\n"}︡{"stdout":"Braid group on 3 strands\n"}︡{"stdout":"(a0, a1)\n"}︡{"stdout":"(a, b)\n"}︡{"stdout":"The elements can be created by operating with the generators, or by passing a list with the indices of the letters to the group:\n"}︡{"stdout":"s0*s1*s0\n"}︡{"stdout":"s0*s1*s0\n"}︡{"stdout":"Left multiplication of a free group element by a braid\n"}︡{"stdout":"True\n"}︡{"stdout":"f1*f2*f1^-1\n"}︡{"stdout":"f0\n"}︡{"stdout":"f1*f2*f1^-1\n"}︡{"stdout":"f1*f2^-1*f1^-1\n"}︡{"stdout":"element of a finitely presented group\n"}︡{"stdout":"Braid group on 4 strands\n"}︡{"stdout":"s0*s1*s2^-1*s1^-1\n"}︡{"stdout":"s0*s1*s2^-1*s1^-1\n"}︡{"stdout":"Lawence-Krammer-Bigelow representation matrix\n"}︡{"stdout":"[             0 -x^4*y + x^3*y         -x^4*y]\n[             0         -x^3*y              0]\n[        -x^2*y  x^3*y - x^2*y              0]\n"}︡{"stdout":"[             0 -x^4*y + x^3*y         -x^4*y]\n[             0         -x^3*y              0]\n[        -x^2*y  x^3*y - x^2*y              0]\n"}︡{"stdout":"Alexander polynomial of the closure of the braid\n"}︡{"stdout":"the trefoil:\n"}︡{"stdout":"1 - t + t^2\n"}︡{"stdout":"t^-2 - t^-1 + 1\n"}︡{"stdout":"figure 8 knot\n"}︡{"stdout":"-t^-2 + 3*t^-1 - 1\n"}︡{"stdout":"t^-2 - 3*t^-1 + 1\n"}︡{"stdout":"the Kinoshita-Terasaka knot:\n"}︡{"stdout":"-t^-1\n"}︡{"stdout":"1\n"}︡{"stdout":"Burau matrix of the braid\n"}︡{"stdout":"Defining s0, s1, s2\n"}︡{"stdout":"[       1 - t            0      t - t^2          t^2]\n[           1            0            0            0]\n[           0            0            1            0]\n[           0         t^-2 -t^-2 + t^-1    -t^-1 + 1]\n"}︡{"stdout":"[    1     0     0     0]\n[    0     1     0     0]\n[    0     0 1 - x     x]\n[    0     0     1     0]\n"}︡{"stdout":"[-t  0  0]\n[-t  1  0]\n[-t  0  1]\n"}︡{"stdout":"left normal form of the braid\n"}︡{"stdout":"(s0^-1*s1^-1*s2^-1*s0^-1*s1^-1*s0^-1, s0*s1*s2*s1*s0, s0*s2*s1)\n"}︡{"stdout":"(1, s0)\n"}︡{"stdout":"permutation induced by the braid in its strands.\n"}︡{"stdout":"[4, 1, 3, 2]\n"}︡{"stdout":"'(1,4,2)'\n"}︡{"stdout":"Plot the braid\n"}︡{"once":false,"file":{"show":true,"uuid":"e160a884-905a-40f2-9350-a0c16a186c9f","filename":"/projects/3ac3a67b-ef95-4183-a936-4723f33fd47e/.sage/temp/compute21dc0/14098/tmp_r_B56u.svg"}}︡{"once":false,"file":{"show":true,"uuid":"0f8db5df-934e-4d6c-b2b5-8cff2bd75b02","filename":"/projects/3ac3a67b-ef95-4183-a936-4723f33fd47e/.sage/temp/compute21dc0/14098/tmp_6fvALl.svg"}}︡{"once":false,"file":{"show":true,"uuid":"e81a4614-425e-465b-8ecb-0ff5ab5655f9","filename":"/projects/3ac3a67b-ef95-4183-a936-4723f33fd47e/.sage/temp/compute21dc0/14098/tmp_o5Cqwx.svg"}}︡{"stdout":"Plots the braid in 3d\n"}︡{"html":"<div id=ca57bd78-cfc1-4cf5-8a93-4ec644bae92b style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 12.0, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#ca57bd78-cfc1-4cf5-8a93-4ec644bae92b').salvus_threejs(obj)"},"once":false}︡{"html":"<div id=2b6ce56e-6559-41c7-a44f-5d452536301e style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 12.0, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#2b6ce56e-6559-41c7-a44f-5d452536301e').salvus_threejs(obj)"},"once":false}︡{"html":"<div id=7ebbdcab-5c17-4f44-9097-c52a51afb704 style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 12.0, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#7ebbdcab-5c17-4f44-9097-c52a51afb704').salvus_threejs(obj)"},"once":false}︡{"stdout":"number of strands in the braid.\n"}︡{"stdout":"4\n"}︡{"stdout":"the tropical coordinates\n"}︡{"stdout":"[1, 0, 0, 2, 0, 1]\n"}︡{"stdout":"Tropical semiring over Integer Ring\n"}︡{"stdout":"[1, -19, -12, 9, 0, 13]\n"}︡{"stdout":"Construct a Braid Group\n"}︡{"stdout":"Braid group on 3 strands\n"}︡{"stdout":"True\n"}︡{"stdout":"Braid group on 3 strands\n"}︡
︠a254b4bf-f395-48fe-aa6a-767f71b9ea3d︠









