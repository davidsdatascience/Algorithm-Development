︠91b41f46-4823-4136-b728-1ed0ecf9ccfa︠
import numpy
import scipy

j0=0.5



j0_data =[]
ExpRC_data=[]

#if j0 < 10:
while j0<10 :
    j0_data.append(j0)
    RC=numerical_approx(6.57+(12.87*sqrt(j0)), digits =6)
    ExpRC_data.append(RC)

    print "j0=", j0,
    print "expectation value of Ricci Curvature =", RC
    j0=j0+0.5

list_plot(zip(j0_data, ExpRC_data),plotjoined=True,title='Expectation of Ricci curvature vs spin', marker='o', axes_labels=['$j0$ axis','$<RC>$ axis'] )
︡1c9dd40b-ad74-41f0-9da2-37caa4d0edf1︡{"stdout":"j0= 0.500000000000000 expectation value of Ricci Curvature = 15.6705\nj0= 1.00000000000000 expectation value of Ricci Curvature = 19.4400\nj0= 1.50000000000000 expectation value of Ricci Curvature = 22.3325\nj0= 2.00000000000000 expectation value of Ricci Curvature = 24.7709\nj0= 2.50000000000000 expectation value of Ricci Curvature = 26.9193\nj0= 3.00000000000000 expectation value of Ricci Curvature = 28.8615\nj0= 3.50000000000000 expectation value of Ricci Curvature = 30.6476\nj0= 4.00000000000000 expectation value of Ricci Curvature = 32.3100\nj0= 4.50000000000000 expectation value of Ricci Curvature = 33.8714\nj0= 5.00000000000000 expectation value of Ricci Curvature = 35.3482\nj0= 5.50000000000000 expectation value of Ricci Curvature = 36.7528\nj0= 6.00000000000000 expectation value of Ricci Curvature = 38.0949\nj0= 6.50000000000000 expectation value of Ricci Curvature = 39.3822\nj0= 7.00000000000000 expectation value of Ricci Curvature = 40.6208\nj0= 7.50000000000000 expectation value of Ricci Curvature = 41.8159\nj0= 8.00000000000000 expectation value of Ricci Curvature = 42.9719\nj0= 8.50000000000000 expectation value of Ricci Curvature = 44.0922\nj0= 9.00000000000000 expectation value of Ricci Curvature = 45.1800\nj0= 9.50000000000000 expectation value of Ricci Curvature = 46.2380\n"}︡{"once":false,"file":{"show":true,"uuid":"e492f4f0-c5e2-4273-80ea-c74984e2c866","filename":"/projects/4dba49b8-22b8-4e2c-b9ba-9311f4fced28/.sage/temp/compute3dc2/24565/tmp_I8twkw.png"}}︡
︠30ad5591-f22b-4e7c-9743-06894508e8ac︠
︡37e31d06-bf41-49f3-92ab-dd100005a308︡
︠b19c63e8-e96c-4bbe-8bb0-50ef2425757e︠









