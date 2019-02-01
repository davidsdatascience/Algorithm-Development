︠719c0f0a-f1f0-437f-8cbb-bd6b55f03876s︠
#####################################################################
#Quantum tetrahedron volume, area and angle eigenvalues
#
#by David Horgan.

#In this interact I calculate the angle, area and volume for a quantum tetrahedron The angle is found using the expression: theta = arccos((j3*(j3+1)-(j1*(j1+j1)-#j2*(j2+1))/(2*sqrt(j1*(j1+j1)*j2*(j2+1)))) The area is found using the expression: A=sqrt(j1*(j1+1)) The volume is fund using the expression V^2 =M = 2/9(real #antisymmetrix matrix)
#
#Values of constants gamma is Immirzi parameter gamma =numerical_approx( ln(2)/(pi*sqrt(2))) #G = 6.63*10^-11 hbar= (1.61619926*10^-35)/(2*pi) lp is the planck #length lp3=6*10^-104 Reference: Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard. Reference: Shape in an atom of space: exploring #quantum geometry phenomenology by Seth A. Major.
#
#Research Blog: http://quantumtetrahedron.wordpress.com
#
#Given the values of J1, J2, J3 and J4 this interact calculates the volume, area and angle eigenvalues of a quantum tetrahedron.
########################################################################################








import numpy



@interact




def _(j1 = input_box(6.0, 'J1'),
      j2= input_box(6.0, 'J2'),
      j3= input_box(6.0, 'J3'),
      j4= input_box(7.0, 'J1'), auto_update=False):
    if (j1+j2)<= (j3+j4):
        html('<h3>Value of length eigenvalue in m</h3>')
        #calculate trivalent vertex length
        lp=1.61619926*10^-35
        c0 = sqrt(j3+0.5)
        c1 = j3+1
        c2 = j1+j2+j3+2
        c3 = j1+j2-j3
        c4 = j2+j3-j1+1
        c5 = j1+j2+j3+1
        c6 = j1+j2-j3+1
        c7 = j2+j3-j1
        c8 = j3+j1-j2
        c9 = sqrt(c2*c3*c4)
        c10= sqrt(c5*c6*c7*c8)
        c11=c1*c9
        c12=j3*c10
        c13=c12+c11
        const = lp/c0
        a=const*c13
        length = numerical_approx( a, digits=10)
        #divalent vertex
        dilength=lp*sqrt(sqrt(j1*(j1+1)))
        # quantum of length
        quant = numerical_approx(lp*(1/sqrt(2))*(sqrt(sqrt(3))))
        #monochromatic four valent vertex
        print "Eigenvalue of length for trivalent vertex=",length,"m"
        print "Eigenvalue of length for divalent vertex=",dilength,"m"
        print "Quantum of length in quantum tetrahedron =",quant,"m"









        html('<h3>Value of Angle eigenvalue in radians</h3>')
        d2=j3*(j3+1)
        d3=j1*(j1+1)
        d4=j2*(j2+1)
        d5=d2-d3-d4
        d6=2*sqrt(d3*d4)
        d7=d5/d6
        d8=arccos(d7)
        d8a=numerical_approx(d8, digits=4)
        angle = numerical_approx(d8*180/pi, digits=4)
        if angle != NaN:
             print 'angle between faces 1 and 2 in quantum tetrahedron = ',d8a, 'radians'
             print 'angle between faces 1 and 2 in quantum tetrahedron = ',angle,'degrees'

        html('<h3>main sequence Area eigenvalues</h3>')
        lp=1.61619926*10^-35
        main1=numerical_approx(sqrt(j1*(j1+1)),digits=4)
        areamain1 =0.5*lp^2*main1
        print 'Area of face 1=', areamain1, 'm2'
        main2=numerical_approx(sqrt(j2*(j2+1)),digits=4)
        areamain2 =0.5*lp^2*main2
        print 'Area of face 2=', areamain2, 'm2'
        main3=numerical_approx(sqrt(j3*(j3+1)),digits=4)
        areamain3 =0.5*lp^2*main3
        print 'Area of face 3=', areamain3, 'm2'
        main4=numerical_approx(sqrt(j4*(j4+1)),digits=4)
        areamain4 =0.5*lp^2*main4
        print 'Area of face 4=', areamain4, 'm2'
        area = areamain1 + areamain3 +areamain3+areamain4
        print 'Total area of quantum tetrahedron =', area, 'm2'









        html('<h3>Values of Volume Eigenvalue</h3>')
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
            #print r
        for j in range(d-1):
            kmatrix[[j],[j+1]]=r[j+1]
            kmatrix[[j+1],[j]]=-r[j+1]
            #print kmatrix

        M = (2/9)*kmatrix
        #print M
        s=M.eigenvalues()
        #print s
        lp3=6*10^-104
        for j in range(d):
            e= sqrt(s[j])
            vol = lp3*e
            volume = numerical_approx(vol, digits=2)
            if e.imag() ==0:
                print "volume eigenvalue =",(e)
                print "volume of tetrahedron =", volume, 'm3'
︡236d049c-8c28-4dc8-8d39-8d30cbcacee1︡{"interact":{"controls":[{"control_type":"input-box","default":"6.00000000000000","label":"J1","nrows":1,"readonly":false,"submit_button":null,"type":null,"var":"j1","width":null},{"control_type":"input-box","default":"6.00000000000000","label":"J2","nrows":1,"readonly":false,"submit_button":null,"type":null,"var":"j2","width":null},{"control_type":"input-box","default":"6.00000000000000","label":"J3","nrows":1,"readonly":false,"submit_button":null,"type":null,"var":"j3","width":null},{"control_type":"input-box","default":"7.00000000000000","label":"J1","nrows":1,"readonly":false,"submit_button":null,"type":null,"var":"j4","width":null},{"control_type":"checkbox","default":false,"label":"auto_update","readonly":false,"var":"auto_update"}],"flicker":false,"id":"e3c23896-1662-4ecf-977f-1c9120661768","layout":[[["j1",12,null]],[["j2",12,null]],[["j3",12,null]],[["j4",12,null]],[["auto_update",12,null]],[["",12,null]]],"style":"None"}}︡{"done":true}︡
︠d6190ba3-0dc7-4f01-acc7-32d6af9a1894︠
︡b7795727-9908-4676-9683-40e275f6fc1a︡{"done":true}︡
︠d9d5f56e-badf-4741-8d07-67b139914e4e︠

︡c022b01e-5aae-4e4e-9ad9-bd122a510160︡{"done":true}︡
︠fcb150bd-90ee-4f73-bd3a-d7aa42d8eba1s︠

︡d60ef6cd-3055-4ed0-b593-cc29713fb60f︡{"done":true}︡
︠1a2ed803-4df3-4800-a3b9-5507f55c7ddds︠

︡1043402d-15c3-4fc3-bb8a-241274b1cda8︡{"done":true}︡









