︠42ddabfc-84e6-47be-bf07-b9a5fb8671c2︠
#H is the matrix defining the operator "\[Delta]ij.Y^i.Y^j" used to \define the length operator expressed in the intertwiner basis

j0=5
matrixH=list()
matH = matrix(CDF,int(2*j0), int(2*j0))
pos=0
for i in range(0, 2*j0):
    for j in range(0, 2*j0):
        H = kronecker_delta(i,j)*((j0^2)*(j0 + 1)^2 - (i*(i + 1) - 2*j0*(j0 + 1))^2/4 - (i*(i + 1) - 2*j0*(j0 + 1))/2)
        matrixH.append(H)
        matH[[i],[j]]=matrixH[pos]
        pos=pos+1


s=matH.eigenvalues()
print "The matrix H is"
print matH
print "Eigenvalues of H are ", s



︡0fe744c4-f695-4d3b-9e03-89c6f0a5b37b︡{"stdout":"The matrix H is\n"}︡{"stdout":"[ 30.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0]\n[  0.0  88.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0]\n[  0.0   0.0 198.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0]\n[  0.0   0.0   0.0 348.0   0.0   0.0   0.0   0.0   0.0   0.0]\n[  0.0   0.0   0.0   0.0 520.0   0.0   0.0   0.0   0.0   0.0]\n[  0.0   0.0   0.0   0.0   0.0 690.0   0.0   0.0   0.0   0.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0 828.0   0.0   0.0   0.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   0.0 898.0   0.0   0.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0 858.0   0.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0 660.0]\n"}︡{"stdout":"Eigenvalues of H are  [30.0, 88.0, 198.0, 348.0, 520.0, 690.0, 828.0, 898.0, 858.0, 660.0]\n"}︡
︠a3bb601a-6b5d-45b1-a318-269767c9c204︠
︡d9c13c8a-e071-4a2e-ac70-ec03cec16c5f︡
︠07ec27a0-d01d-49b8-b9d5-8938afe4fca6︠
︡a37f90b9-58f0-46e6-9acb-0abf16377332︡
︠f77a03f3-ca72-4e5d-9699-8a8833350fd3︠
















