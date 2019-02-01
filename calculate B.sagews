︠635914fd-d2d1-443e-a0ab-8c8c59a56d9c︠
#calculate B, where B is the intertwiner basis
j0=0.5
#count=0
while (j0 <= 10):
    i, j = var('i,j')
    a=kronecker_delta(i,j)
    isum=sum(a,i,0,2*j0 )
    jsum=sum(isum,j,0,2*j0)

    #count=count+0.5
    #print isum
    print "j0=", numerical_approx(j0,digits=4), "B=", jsum
    j0=j0+0.5
︡b455767f-23c5-4d01-97f3-3cece948bec0︡{"stdout":"j0= 0.5000 B= 2\nj0= 1.000 B= 3\nj0= 1.500 B= 4\nj0= 2.000 B= 5\nj0="}︡{"stdout":" 2.500 B= 6\nj0= 3.000 B= 7\nj0= 3.500 B= 8\nj0="}︡{"stdout":" 4.000 B= 9\nj0= 4.500 B= 10\nj0="}︡{"stdout":" 5.000 B= 11\nj0= 5.500 B= 12\nj0="}︡{"stdout":" 6.000 B= 13\nj0= 6.500 B= 14\nj0="}︡{"stdout":" 7.000 B= 15\nj0= "}︡{"stdout":"7.500 B= 16\nj0="}︡{"stdout":" 8.000 B= 17\nj0="}︡{"stdout":" 8.500 B= 18\nj0="}︡{"stdout":" 9.000 B= 19\nj0="}︡{"stdout":" 9.500 B= 20\nj0="}︡{"stdout":" 10.00 B= 21\n"}︡
︠d7940d6e-c7d1-4e88-aa27-eaf9f0e8cc36︠

︠40739fba-0542-4b3f-b042-78197f69d02d︠
︡5dfb9a87-4f01-4ded-9fd9-571f629e0d42︡
︠4ed20cd2-a4e7-49ef-99e4-98d543da3a1c︠









