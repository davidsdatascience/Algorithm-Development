
# Lambda] is the matrix defining the operator Lambda]_n corresponding to the inverse of the volume operator expressed in the intertwiner basis, hence the scalar products EveQ[[k]]]].B[[j+1]] in the expression



Lambda =
 Table[Sum[
   If[EvaQ[[k]] == 0, 0,
    N[Sqrt[12/
        Abs[EvaQ[[k]]]] (B[[i + 1]].Normalize[EveQ[[k]]]) (Conjugate[
         Normalize[EveQ[[k]]]].B[[j + 1]]), 10]], {k, 1,
    2 j0 + 1}], {i, 0, 2 j0}, {j, 0, 2 j0}];



#Q is the matrix defining the operator Q{e1,e2,e3} used in the  definition of the volume operator

j0=0.5
i,j,k = var('i,j,k')

a= I/(sqrt(4*k^2 - 1))*(k^2)*(2*j0+1+k)*(2*j0+1-k)*kronecker_delta(i, k)*kronecker_delta(k - 1,j)-kronecker_delta(i, k - 1)*kronecker_delta(k, j)






isum=sum(a,i,0,2*j0)
jsum =sum(isum,j,0,2*j0)
ksum =sum(jsum,k,1,2*j0)
numksum=numerical_approx(ksum, digits =4)









