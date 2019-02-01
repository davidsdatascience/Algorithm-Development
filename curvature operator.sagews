#Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard
#The dimension d of the Hilbert space H4,  d = kmax - kmin + 1
#k values k ranges from kmin to kmax in integer steps
#kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)
# the the dimension of the hilbert space is given by d = kmax -kmin + 1
#V^2 =M = 2/9(real antisymmetrix matrix)
︡027aafc9-4f04-4524-835b-0449ea4bc7b4︡︡
︠56c94415-7f9a-4de0-af84-4f8a974fb8e5︠
import numpy
j1=0.5
j2=0.5
j3=1.5
j4=1.5
kmin = int(max(abs(j1-j2),abs(j3 -j4)))
kmax = int(min((j1+j2),(j3 +j4)))
d = kmax -kmin + 1
print'j1=',j1
print'j2=',j2
print'j3=',j3
print'j4=',j4
print'kmin=',kmin
print'kmax=',kmax
print'd=',d
︡2c10de10-06c9-40db-bbff-108562dfe5f3︡{"stdout":"j1= 0.500000000000000\n"}︡{"stdout":"j2= 0.500000000000000\n"}︡{"stdout":"j3= 1.50000000000000\n"}︡{"stdout":"j4= 1.50000000000000\n"}︡{"stdout":"kmin= 0\n"}︡{"stdout":"kmax= 1\n"}︡{"stdout":"d= 2\n"}︡
︠c79eb7af-1c65-4087-8837-fd4b250b7acc︠










