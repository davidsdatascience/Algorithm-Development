︠2257f7d6-b414-4b26-9fe8-e817a54d4ba3︠
sage: import numpy





def holo(jvalue,zvalue):
    j=jvalue
    j1=j
    j2=j
    j3=j
    j4=j
    kmax=min(j1+j2,j3+4)
    kmin=max(j1-j2,j3-j4)
    d=kmax-kmin+1
    z=zvalue
    rootz=sqrt(z)
    phiz=arccosh(rootz)
    realphiz=phiz.real()
    psi=pi/2
    dj=2*j+1
    kc=tanh(realphiz)
    k=kmin
    k_data=[]
    ck_data=[]

    for k in range(0,50):
        k_data.append(k)
        a=1/(1-(kc^2/4*j^2)^2*j)
        b=(-2*j)*((k-kc)^2)/(4*j^2-kc^2)
        c=-I*kc*psi
        ck=a*exp(b+c)
        absck=numerical_approx(abs(ck), digits=4)
        ck_data.append(absck)

    data=zip(ck_data, k_data)
    return data


holo(0.5,exp(I*pi/3))
show.data()
︡ff3bd40c-c18f-4053-80fc-edcbdcaf4182︡{"stdout":"[(0.6067, 0), (0.7651, 1), (0.04804, 2), (0.0001502, 3), (2.338e-8, 4), (1.811e-13, 5), (6.990e-20, 6), (1.343e-27, 7), (1.284e-36, 8), (6.126e-47, 9), (1.454e-58, 10), (1.713e-71, 11), (1.007e-85, 12), (2.953e-101, 13), (4.302e-118, 14), (3.115e-136, 15), (1.127e-155, 16), (2.023e-176, 17), (1.814e-198, 18), (8.102e-222, 19), (1.794e-246, 20), (1.986e-272, 21), (1.086e-299, 22), (2.980e-328, 23), (4.103e-358, 24), (2.790e-389, 25), (9.302e-422, 26), (1.580e-455, 27), (1.326e-490, 28), (5.543e-527, 29), (1.153e-564, 30), (1.195e-603, 31), (6.065e-644, 32), (1.557e-685, 33), (1.929e-728, 34), (1.228e-772, 35), (3.891e-818, 36), (6.138e-865, 37), (4.821e-913, 38), (1.915e-962, 39), (3.670e-1013, 40), (3.613e-1065, 41), (1.717e-1118, 42), (4.060e-1173, 43), (4.933e-1229, 44), (2.893e-1286, 45), (8.444e-1345, 46), (1.266e-1404, 47), (9.161e-1466, 48), (3.405e-1528, 49)]"}︡{"stdout":"\n"}︡{"stderr":"Error in lines 32-32\nTraceback (most recent call last):\n  File \"/projects/8a61457c-7093-491c-be7e-0ce8e2e6a593/.sagemathcloud/sage_server.py\", line 873, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nAttributeError: 'function' object has no attribute 'data'\n"}︡
︠82e83173-6564-49fe-bb3b-096c66794155︠









