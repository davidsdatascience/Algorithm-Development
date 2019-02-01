︠d6c784e0-12d5-498a-8186-6d4d46d9b31d︠

︡19324415-2b8c-4b2f-b59a-b2d69c7f51fe︡
︠42ddabfc-84e6-47be-bf07-b9a5fb8671c2︠
#Q is the matrix defining the operator Q{e1,e2,e3} used in the  definition of the volume operator
import numpy
j0=3.0
i,j,k = var('i,j,k')

a= I/(sqrt(4*k^2 - 1))*(k^2)*(2*j0+1+k)*(2*j0+1-k)*kronecker_delta(i, k)*kronecker_delta(k - 1,j)-kronecker_delta(i, k - 1)*kronecker_delta(k, j)

ksum=sum(a, k, 0, 2*j0)
Q=(ksum, {i, 0,2*j}),{j, 0, 2*j0}}
#isum= sum(ksum, i, 0,2*j0)
#jsum=sum(isum,j, 0, 2*j0)

#print ksum
#print isum
#print jsum
#numjsum=numerical_approx(jsum, digits=4)

#print numjsum
#isum=sum(a,i,0,2*j0)
#jsum =sum(isum,j,0,2*j0)
#ksum =sum(jsum,k,0,2*j0)
#numksum=numerical_approx(ksum, digits =4)
#connumksum=numksum*conjugate(numksum)
print ksum
#print isum
#print jsum
#print numksum
#print connumksum

#########notes

    #calculate B
#j0=5
#i, j = var('i,j')
#a=kronecker_delta(i,j)


#isum=sum(a,i,0,2*j0 )
#jsum=sum(isum,j,0,2*j0)
#print isum
#print jsum
︡a6802def-7e05-470d-b85b-2d03678d7016︡{"stderr":"Error in lines 0-7\nTraceback (most recent call last):\n  File \"/projects/4dba49b8-22b8-4e2c-b9ba-9311f4fced28/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"<string>\", line 1\n    Q=(ksum, {i, Integer(0),Integer(2)*j}),{j, Integer(0), Integer(2)*j0}}\n                                                                         ^\nSyntaxError: invalid syntax\n"}︡
︠4ff12965-d7bd-4c17-8c9c-3b02ea3e2865︠
︡5453569b-e433-4929-a791-0df97e1d5911︡
︠c73f8c23-0040-47de-b7c0-a9e1818d6b3a︠
︡ecb5561e-e4a3-47d5-96b5-7785db89f970︡
︠2600d6dd-4f7e-4a45-a09e-ae7c74e8ed82︠
︡4bbe2c6e-60e0-4427-9a12-88e4f0b5281a︡
︠25f0324a-d00d-407d-a6ba-fdae98ee0216︠
︡4444085b-02c6-434c-97ee-f2cb146ac038︡
︠f8054d0d-7cce-4f0e-b8d6-ce0e10ff6eaf︠









