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


if __name__ == '__main__':
    '''
        just a bunch of plots in (phi,theta) for
        integer and half-integer j and where m and
        n take values of [-j, -j+1, ..., j-1, j]

        Note that all indexes can be any real number
        with the conditions:
             j >= 0
            -j <= m <= j
            -j <= n <= j
    '''
    from matplotlib import pyplot, cm, rc
    from numpy import linspace, arange, meshgrid, real, imag, arccos

    rc('text', usetex=False)

    ext = [0.,2.*pi,0.,pi]

    phi = linspace(ext[0],ext[1],200)
    theta = linspace(ext[2],ext[3],200)

    pphi,ttheta = meshgrid(phi,theta)

    # The maximum value of j to plot. Will plot real and imaginary
    # distributions for j = 0, 0.5, ... maxj
    maxj = 3

    for j in arange(0,maxj+.1,step=0.5):

        fsize = (j*2+3,j*2+3)
        title = 'WignerD(j,m,n)(phi,theta)'
        if j == 0:
            fsize = (4,4)
        else:
            title += ', j = '+str(j)

        figr = pyplot.figure(figsize=fsize)
        figr.suptitle(r'Real Part of '+title)

        figi = pyplot.figure(figsize=fsize)
        figi.suptitle(r'Imaginary Part of '+title)

        for fig in [figr,figi]:
            fig.subplots_adjust(left=.1,bottom=.02,right=.98,top=.9,wspace=.02,hspace=.1)

            if j == 0:
                fig.subplots_adjust(left=.1,bottom=.1,right=.9,top=.9)
            if j == 0.5:
                fig.subplots_adjust(left=.2,top=.8)
            if j == 1:
                fig.subplots_adjust(left=.15,top=.85)
            if j == 1.5:
                fig.subplots_adjust(left=.15,top=.85)
            if j == 2:
                fig.subplots_adjust(top=.87)

            if j != 0:
                axtot = fig.add_subplot(1,1,1)
                axtot.axesPatch.set_alpha(0.)

                axtot.xaxis.set_ticks_position('top')
                axtot.xaxis.set_label_position('top')
                axtot.yaxis.set_ticks_position('left')
                axtot.spines['left'].set_position(('outward',10))
                axtot.spines['top'].set_position(('outward',10))
                axtot.spines['right'].set_visible(False)
                axtot.spines['bottom'].set_visible(False)

                axtot.set_xlim(-j-.5,j+.5)
                axtot.set_ylim(-j-.5,j+.5)

                axtot.xaxis.set_ticks(arange(-j,j+0.1,1))
                axtot.yaxis.set_ticks(arange(-j,j+0.1,1))

                axtot.set_xlabel('n')
                axtot.set_ylabel('m')

        nplts = 2*j+1

        for m in arange(-j,j+0.1,step=1):
            for n in arange(-j,j+0.1,step=1):
                print j,m,n
                zz = wignerD(j,m,n)(pphi,ttheta)


                i = n+j + nplts*(j-m)

                for fig,data in zip((figr,figi), (real(zz),imag(zz))):

                    ax = fig.add_subplot(nplts, nplts, i+1, projection='polar')
                    plt = ax.pcolormesh(pphi,ttheta,data.copy(),
                        cmap=cm.jet,
                        #cmap=cm.RdYlBu_r,
                        vmin=-1., vmax=1.)

                    if j == 0:

                        ax.grid(True, alpha=0.5)
                        ax.set_title(r'j,m,n = (0,0,0)', position=(0.5,1.1), size=12)
                        ax.set_xlabel(r'$\phi$')
                        ax.set_ylabel(r'$\theta$', rotation='horizontal', va='bottom')
                        ax.xaxis.set_ticks([0,.25*pi,.5*pi,.75*pi,pi,1.25*pi,1.5*pi,1.75*pi])
                        ax.xaxis.set_ticklabels(['0',r'$\frac{\pi}{4}$',r'$\frac{\pi}{2}$',r'$\frac{3 \pi}{4}$',r'$\pi$',r'$\frac{5 \pi}{4}$',r'$\frac{3 \pi}{2}$',r'$\frac{7 \pi}{4}$'], size=14)
                        ax.yaxis.set_ticks([0,.25*pi,.5*pi,.75*pi,pi])
                        ax.yaxis.set_ticklabels(['0',r'$\frac{\pi}{4}$',r'$\frac{\pi}{2}$',r'$\frac{3 \pi}{4}$',r'$\pi$'], size=14)

                    else:
                        ax.xaxis.set_ticks([])
                        ax.yaxis.set_ticks([])

                    ax.set_xlim(ext[0],ext[1])
                    ax.set_ylim(ext[2],ext[3])


                    if j == 0:
                        fig.colorbar(plt, pad=0.07)


        # uncomment the following if you want to save these to image files
        #figr.savefig('wignerD_j'+str(j)+'_real.png', dpi=150)
        #figi.savefig('wignerD_j'+str(j)+'_imag.png', dpi=150)

    pyplot.show()
