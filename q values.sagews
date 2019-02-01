︠0489f6a5-2801-435b-9932-0731b22690e7︠
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
j1=1.0
j2=1.0
j3=1.0
j4=1.0

def vol(j1,j2,j3,j4):
    kmin = int(max(abs(j1-j2),abs(j3 -j4)))
    kmax = int(min((j1+j2),(j3 +j4)))
    d = kmax -kmin + 1
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
        r.append(a)
        q=numerical_approx(a, digits=10)
    for j in range(d-1):
        kmatrix[[j],[j+1]]=r[j+1]
        kmatrix[[j+1],[j]]=-r[j+1]
    M = (2/9)*kmatrix
    s=M.eigenvalues()
    v=M.eigenvectors_right()
    #print (v[0]).norm
    #print M

    #n=v.norm()
    #print "Eigenvectors of Q are: ", v
    #print "normalized eigenvetors of Q are", n

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
                q.append(e)

                #print "eigenvalue is ", (e)
                vol=lp3*e
                volume= numerical_approx(vol, digits=10)
                #print "volume of tetrahedron =", volume
        EvaQ =sorted(q)

    return EvaQ



evaq=vol(j1,j2,j3,j4)
print evaq


︡76a9defb-1c5b-4db6-8b6b-08df73228614︡{"stdout":"[4.83090174536e-09, 0.620403239401]\n"}︡
︠50ec8276-623c-4cfc-9003-8fae02cf9ec3︠
︡30cd4366-c85c-426a-a142-691e1c3c9d75︡
︠4daaa48f-b4e5-4b2b-922d-66dca6c5fc4a︠
︡cc98f635-8da3-4091-89a5-5c97fdd9647d︡
︠a44e2800-2626-4f18-ad4a-2b4a4e2a87e5︠
︡46ffe537-2495-4cb9-95f6-f94b43494890︡
︠40db4f9a-b900-4215-bcf9-ff1f9426a2e9︠
︡28de1607-2757-48aa-b262-62285be08c26︡
︠a2751ec3-09d0-4499-b472-52238a78549f︠
︡55d8daf8-94ff-4d34-bdc5-09ae09c7420c︡
︠c04521aa-4832-4577-99d8-76053ec74119︠










