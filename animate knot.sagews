︠2c00a7be-6d05-4a02-9e68-ac2f045a15c9︠
var('u,v');
a,b = 2,1 # outer and inner radii
x = (a + b*cos(u))*cos(v)
y = (a + b*cos(u))*sin(v)
z = b*sin(u)
T = parametric_plot3d([x,y,z], (u,0,2*pi),(v,0,2*pi), opacity=.6,aspect_ratio=1)

var('t');
c = (2*t,3*t)
s = [_.subs(dict(zip((u,v),c))) for _ in (x,y,z)]
curve = lambda d: parametric_plot(s,(t,0,2*pi*d),color='red',thickness=2,plot_points=400)

K = animate((T+curve(d) for d in sxrange(.01,1.1,.05)))
K.show()
︡35b1ea52-4080-40c4-9144-657b2d739ee3︡{"stdout":"(u, v)\n"}︡{"stdout":"t\n"}︡{"once":false,"file":{"show":true,"uuid":"2e36ea55-d50c-4310-a21d-706c82496cef","filename":"/projects/3ac3a67b-ef95-4183-a936-4723f33fd47e/.sage/temp/compute21dc0/16031/tmp_OYHNzr.gif"}}︡
︠af74f793-43c1-4a00-a542-99620665993c︠
︡f210221e-915f-4310-bbc6-49a596cae768︡
︠3bc446d0-85a8-462c-b215-8c96b5fb0409︠
︡bd764945-03e7-4416-821e-85975a513420︡
︠2bbdd7a1-3d37-4cf9-ad51-46cf3d5f8b8f︠










