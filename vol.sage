def vol(j1,j2,j3,j4):

    kmin = int(max(abs(j1-j2),abs(j3 -j4)))
    kmax = int(min((j1+j2),(j3 +j4)))
    d = kmax -kmin + 1
    y=numpy.arange(kmin,kmax+1,1)
    kmatrix = matrix(CDF,int(d), int(d))
    r=list()
    kval=list()
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
        kval.append(k)
        print "kval=",kval
        q=numerical_approx(a, digits=10)
    for j in range(d-1):
        kmatrix[[j],[j+1]]=r[j+1]
        kmatrix[[j+1],[j]]=-r[j+1]
    M = (2/9)*kmatrix
    s=M.eigenvalues()
    v=M.eigenvectors_right()
    #print (v[0]).norm
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