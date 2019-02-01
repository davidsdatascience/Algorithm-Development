︠a6220ab5-2777-456f-88fe-62aa93c39996s︠
from scipy.special import jv, legendre, sph_harm, jacobi
from scipy.misc import factorial, comb
from numpy import floor, sqrt, sin, cos, exp, power
from math import pi

def wignerd(j,m,n=0,approx_lim=10):
    '''
        Wigner "small d" matrix. (Euler z-y-z convention)
        example:
            j = 2
            m = 1
            n = 0
            beta = linspace(0,pi,100)
            wd210 = wignerd(j,m,n)(beta)

        some conditions have to be met:
             j >= 0
            -j <= m <= j
            -j <= n <= j

        The approx_lim determines at what point
        bessel functions are used. Default is when:
            j > m+10
              and
            j > n+10

        for integer l and n=0, we can use the spherical harmonics. If in
        addition m=0, we can use the ordinary legendre polynomials.
    '''

    if (j < 0) or (abs(m) > j) or (abs(n) > j):
        raise ValueError("wignerd(j = {0}, m = {1}, n = {2}) value error.".format(j,m,n) \
            + " Valid range for parameters: j>=0, -j<=m,n<=j.")

    if (j > (m + approx_lim)) and (j > (n + approx_lim)):
        #print 'bessel (approximation)'
        return lambda beta: jv(m-n, j*beta)

    if (floor(j) == j) and (n == 0):
        if m == 0:
            #print 'legendre (exact)'
            return lambda beta: legendre(j)(cos(beta))
        elif False:
            #print 'spherical harmonics (exact)'
            a = sqrt(4.*pi / (2.*j + 1.))
            return lambda beta: a * conjugate(sph_harm(m,j,beta,0.))

    jmn_terms = {
        j+n : (m-n,m-n),
        j-n : (n-m,0.),
        j+m : (n-m,0.),
        j-m : (m-n,m-n),
        }

    k = min(jmn_terms)
    a, lmb = jmn_terms[k]

    b = 2.*j - 2.*k - a

    if (a < 0) or (b < 0):
        raise ValueError("wignerd(j = {0}, m = {1}, n = {2}) value error.".format(j,m,n) \
            + " Encountered negative values in (a,b) = ({0},{1})".format(a,b))

    coeff = power(-1.,lmb) * sqrt(comb(2.*j-k,k+a)) * (1./sqrt(comb(k+b,b)))

    #print 'jacobi (exact)'
    return lambda beta: coeff \
        * power(sin(0.5*beta),a) \
        * power(cos(0.5*beta),b) \
        * jacobi(k,a,b)(cos(beta))


def wignerD(j,m,n=0,approx_lim=10):
    '''
        Wigner D-function. (Euler z-y-z convention)

        This returns a function of 2 to 3 Euler angles:
            (alpha, beta, gamma)

        gamma defaults to zero and does not need to be
        specified.

        The approx_lim determines at what point
        bessel functions are used. Default is when:
            j > m+10
              and
            j > n+10

        usage:
            from numpy import linspace, meshgrid
            a = linspace(0, 2*pi, 100)
            b = linspace(0,   pi, 100)
            aa,bb = meshgrid(a,b)
            j,m,n = 1,1,1
            zz = wignerD(j,m,n)(aa,bb)
    '''

    return lambda alpha,beta,gamma=0: \
          exp(-1j*m*alpha) \
        * wignerd(j,m,n,approx_lim)(beta) \
        * exp(-1j*n*gamma)

s=wignerD(1, 1,0)
print s
︡456204bf-329b-44ea-84ed-03958e40a755︡{"stdout":"<function <lambda> at 0x7fac56fad668>\n"}︡
︠e27c931d-6fde-42db-90e9-0ec6fc1d9675︠









