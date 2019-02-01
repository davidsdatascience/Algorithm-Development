#Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard
#The dimension d of the Hilbert space H4,  d = kmax - kmin + 1
#k values k ranges from kmin to kmax in integer steps
#kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)
# the the dimension of the hilbert space is given by d = kmax -kmin + 1
#V^2 =M = 2/9(real antisymmetrix matrix)
︡c7097e69-6e0c-4faa-8cd5-db81ac37ba6b︡
︠56c94415-7f9a-4de0-af84-4f8a974fb8e5︠
#calculate Q values

import numpy
j1=2.0
j2=2.0
j3=2.0
j4=2.0

def vol(j1,j2,j3,j4):
    kmin = int(max(abs(j1-j2),abs(j3 -j4)))
    kmax = int(min((j1+j2),(j3 +j4)))
    d = kmax -kmin + 1
    #print d
    y=numpy.arange(kmin,kmax+1,1)
    kmatrix = matrix(CDF,int(d), int(d))
    r=list()
    for j in range(d):
        k=int(y[j])
        c1 = -i*k
        c2 = sqrt(4*k*k - 1)
        c3 = sqrt(j1*(j1+1))
        c4 = sqrt((2*j1+1))
        c5 = sqrt(j3*(j3+1))
        c6 = sqrt((2*j3+1))
        c7 = wigner_6j(j1,1,j1,k,j2,k-1)
        c8 = wigner_6j(j3,1,j3,k,j4,k-1)
        a = c1*c2*c3*c4*c5*c6*c7*c8
        print a
        r.append(a)
        q=numerical_approx(a, digits=10)
    for j in range(d-1):
        kmatrix[[j],[j+1]]=r[j+1]
        kmatrix[[j+1],[j]]=-r[j+1]
    print kmatrix
    M = (2/9)*kmatrix
    s=M.eigenvalues()
   # print M.rank()
    #print M

    gamma =numerical_approx( ln(2)/(pi*sqrt(2)))
    G = 6.63*10^-11
    hbar= (1.61619926*10^-35)/(2*pi)
    #gamma is Immirzi parameter
    lp3=6*10^-104
    q=list()
    for j in range(d):
        e= sqrt(s[j])
        #q.append(e)
        if imag(e)==0:
            if e<=0.01:
                e=0
                q.append(e)
            else:
                q.append(e)

                #print "eigenvalue is ", (e)
                vol=lp3*e
                volume= numerical_approx(vol, digits=10)
                #print "volume of tetrahedron =", volume
        EvaQ =sorted(q)


    return EvaQ


evaq=vol(j1,j2,j3,j4)
#print evaq

︡335d627c-5896-404b-a3d0-00a08bbc48e2︡{"stdout":"0\n-2.00000000000000*I*sqrt(3)\n-1.40000000000000*I*sqrt(15)\n-1.02857142857143*I*sqrt(35)\n-1.71428571428571*I*sqrt(7)\n[             0.0 -3.46410161514*I              0.0              0.0              0.0]\n[ 3.46410161514*I              0.0 -5.42217668469*I              0.0              0.0]\n[             0.0  5.42217668469*I              0.0 -6.08511063405*I              0.0]\n[             0.0              0.0  6.08511063405*I              0.0 -4.53557367611*I]\n[             0.0              0.0              0.0  4.53557367611*I              0.0]\n"}︡
︠336d838f-6dc3-41f7-8f43-b524ce762cd7︠














