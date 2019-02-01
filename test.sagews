︠4338b663-6a83-48ea-a3f3-abf671c56e00︠
import numpy
j0=2.0
i,j,k,t, h = var('i,j,k, t,h')

Q=matrix(CDF,[[sum((I/(sqrt(4*k^2 - 1)))*(k^2)*(2*j0+1+k)*(2*j0+1-k)*(kronecker_delta(i, k)*kronecker_delta(k - 1,j)-kronecker_delta(i, k - 1)*kronecker_delta(k, j)), k, 1, 2*j0+1)  for i in range(0,2*j0+1)] for j in range(0,2*j0+1)])

numQ=numerical_approx(Q, digits=6)
EvaQ=numQ.eigenvalues()
EveQ=Q.eigenvectors_right()

B=matrix([[kronecker_delta(i, j)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

H=matrix([[kronecker_delta(i,j)*((j0^2)*(j0 + 1)^2 - (i*(i + 1) - 2*j0*(j0 + 1))^2/4 - (i*(i + 1) - 2*j0*(j0 + 1))/2)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])



def sumEvaQ(EvaQ):
    d=len(EvaQ)
    v=list()
    for x in range(d):
        if EvaQ[x]!=0:
            v.append(1/(sqrt(abs(EvaQ[x]))))
            #print "k=", x, "v=",v
    s=sum([v[k] for k in range(0,d-1)])
    return s

ss=sumEvaQ(EvaQ)


lamb = matrix([[ss*kronecker_delta(i,j)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])
#print lamb


#lsquared = matrix(lam)*matrix(H)*matrix(lam)


lsquared=matrix(lamb)*matrix(H)*kronecker_delta(i,j)
#print "L squared = ", lsquared

e=matrix([[kronecker_delta(i, j)*arccos(i*(i + 1)/(2*j0*(j0 + 1)) - 1)  for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

#arccos(i*(i + 1)/(2*j0*(j0 + 1)) - 1)

#i*(i + 1)/(2*j0*(j0 + 1)) - 1

Le = (1/2)*(lsquared*e + e*lsquared)# Le is the Ricci operator for one edge of the tetrahedron



#print "Le=", Le



R=matrix(CDF,[[2*Le[(i,j)]+2*sum(sqrt(2*i+1)*sqrt(2*j+1)*sqrt(2*h + 1)*sqrt(2*t +1)* ((-1)^(t + h) + (-1)^(i + j + t + h))*wigner_6j(j0,j0, i,j0, j0, t)*wigner_6j(j0, j0, j,j0, j0, h)*Le[(h,t)] for h in range(0,2*j0+1)for t in range(0,2*j0+1))for i in range(0,2*j0+1)]for j in range(0,2*j0+1)])

#R is the Ricci operator for the for the tetrahedron defined by summing the operators of the six edges all of them expressed in the intertwiner basis j12
numR=numerical_approx(R, digits=3)
Riccicurvature=R.eigenvalues()


print "numR=", numR
print "eigenvalues of curvature =",Riccicurvature




︡f086e917-066e-498d-9e76-e2f76bc0065f︡{"stderr":"<string>:1: UserWarning: Using generic algorithm for an inexact ring, which will probably give incorrect results due to numerical precision issues.\n"}︡{"stdout":"numR= [  161.  0.000  -53.4  0.000 -0.197]\n[ 0.000   163.  0.000  -39.9  0.000]\n[ -53.4  0.000   240.  0.000  -22.3]\n[ 0.000  -39.9  0.000   256.  0.000]\n[-0.197  0.000  -22.3  0.000   144.]\n"}︡{"stdout":"eigenvalues of curvature = [270.460743592, 127.085984119, 148.188486522, 148.188478256, 270.460752701]\n"}︡
︠6901de08-3e85-4406-8e6a-409eff4ae111︠

︡dce8b26a-6f93-4039-93ce-cbc359160030︡
︠0aafd602-2f2e-4e6e-bd01-1a0d07d6b84c︠
︡cede34dd-c51d-455a-981b-ce94ee6b2049︡
︠ddb080d9-8d36-442a-9a4e-eaf7510d29a0︠
︡b7d70797-6cdd-44bb-a8d8-97a318356720︡
︠7d70d568-c764-47f6-b4ce-410e872a947c︠
︡d7bd80ac-ad2b-458d-9094-c4497193628d︡
︠331bf841-2da1-437b-b2b2-7d03bb448573︠










