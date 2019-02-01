#Reference: http://sagemath.org/doc/reference/functions/sage/functions/hypergeometric.html#
#Reference http://mpmath.googlecode.com/svn/trunk/doc/build/functions/hypergeometric.html#





︠4d0475f7-afa0-4686-96dd-884752e017d9︠
sage: maxima('integrate(bessel_j(2, x), x)').sage()
︡537abaf7-470f-4b7c-82c5-2d5b48ed9618︡{"stdout":"1/24*x^3*hypergeometric((3/2,), (5/2, 3), -1/4*x^2)\n"}︡
︠7108948c-42bb-469b-9e7d-9dccca6c4b7a︠
sage: sum(((2*I)^x/(x^3 + 1)*(1/4)^x), x, 0, oo)
︡01c3ba1c-b987-4dae-bdaf-bfa5cce8bf53︡{"stdout":"hypergeometric((1, 1, -1/2*I*sqrt(3) - 1/2, 1/2*I*sqrt(3) - 1/2), (2, -1/2*I*sqrt(3) + 1/2, 1/2*I*sqrt(3) + 1/2), 1/2*I)"}︡{"stdout":"\n"}︡
︠d91b6ece-91bd-4086-ac8a-13127c78622a︠
sage: sum((-1)^x/((2*x + 1)*factorial(2*x + 1)), x, 0, oo)
︡c4c0f41d-5d32-4b32-bcd9-2280957a8e48︡{"stdout":"hypergeometric((1/2,), (3/2, 3/2), -1/4)"}︡{"stdout":"\n"}︡
︠9f344ef7-702d-4912-88a1-1dad7bf35f14︠
sage: hypergeometric([-2], [], x).simplify_hypergeometric()
︡2098ea9e-81a9-4ac5-a7ae-9b1e88c00c9c︡{"stdout":"x^2 - 2*x + 1\n"}︡
︠b2000d53-1f9e-4187-ac2e-c158d9a0256a︠
sage: hypergeometric([], [], x).simplify_hypergeometric()
︡258eb0d6-8d4c-4dc4-9c76-c5308b31179a︡{"stdout":"e^x\n"}︡
︠849f399e-2a3a-4b0b-868d-46b45d093d64︠
sage: a = hypergeometric((hypergeometric((), (), x),), (),hypergeometric((), (), x))
sage: a.simplify_hypergeometric()

︡5caac38d-56ad-43ac-a9d1-96873c6718b1︡{"stdout":"1/((-e^x + 1)^e^x)\n"}︡
︠f5e2e433-e83f-4e43-b2d3-b0703daf2b5a︠
sage: a.simplify_hypergeometric(algorithm='sage')

︡e2535c8f-6e80-4b2f-a38b-dbeaa67fbe49︡{"stdout":"(-e^x + 1)^(-e^x)\n"}︡
︠7faef4d0-f037-4772-ace3-a1da4bba1540︠
####Computing terms and series:####
sage: z = var('z')
sage: hypergeometric([], [], z).series(z, 0)
︡35d40b8a-d5fd-441e-b350-2e1d623ca9c1︡{"stdout":"Order(1)\n"}︡
︠6cacf09a-e3b9-45fc-baeb-998318e2fbe9︠
sage: hypergeometric([], [], z).series(z, 1)
︡7bd0276b-0a06-40ea-9344-5d72c491bf82︡{"stdout":"1 + Order(z)\n"}︡
︠32a38325-aace-41ce-bb43-7b19c769e832︠
sage: hypergeometric([], [], z).series(z, 2)
︡09450448-0abb-4945-846c-6b7bdad6db74︡{"stdout":"1 + 1*z + Order(z^2)\n"}︡
︠f228aee2-881a-49e0-a0a6-ba88fa0012f1︠
sage: hypergeometric([], [], z).series(z, 3)
︡48c2910d-8734-4c30-a430-327eb9d62773︡{"stdout":"1 + 1*z + 1/2*z^2 + Order(z^3)\n"}︡
︠0a817728-f9b3-46e1-a3ff-16a473f95993︠
sage: hypergeometric([-2], [], z).series(z, 3)
︡3fc9f4b7-aa96-4fdc-b504-f55c64720387︡{"stdout":"1 + (-2)*z + 1*z^2\n"}︡
︠98094ad9-9217-4a27-a1ea-3bc021b53fd1︠
sage: hypergeometric([-2], [], z).series(z, 6)
︡f63aaacc-056b-4647-8d9f-9f8f757e401d︡{"stdout":"1 + (-2)*z + 1*z^2\n"}︡
︠d5640e1c-2e03-4472-babe-67c78bac178c︠
sage: hypergeometric([], [1/2], -z^2/4).series(z, 11)
︡2d37dc40-f562-4b1f-88b4-189b41284f2e︡{"stdout":"1 + (-1/2)*z^2 + 1/24*z^4 + (-1/720)*z^6 + 1/40320*z^8 + (-1/3628800)*z^10 + Order(z^11)\n"}︡
︠d3905a48-fd32-45b5-8782-04fc5bc069bb︠
#Plotting:
sage: plot(hypergeometric([1, 1], [3, 3, 3], x), x, -30, 30)
︡c299b851-04b0-4cf8-afd1-1ce36602ad5a︡{"once":false,"file":{"show":true,"uuid":"dbf84ff7-7933-4b36-8a56-30d73fbac90f","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/8921/tmp_xCP9PU.svg"}}︡
︠95fbdd21-cb7d-4fd6-a0a0-89ecdd49eb9e︠
sage: complex_plot(hypergeometric([x], [], 2), (-1, 1), (-1, 1))
︡3dbb723c-e689-4900-9974-1757e73cf59e︡{"once":false,"file":{"show":true,"uuid":"a35fe449-0ec1-4233-ab90-142f26cc8901","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute7dc2/8921/tmp_CH_xSi.svg"}}︡
︠f6b567e7-c417-470a-a6fa-c3c0d38c05d4︠
sage: hypergeometric([1], [], 1/10).n()  # geometric series
︡04ce32dd-390d-4287-bbb6-7faf9bbdda90︡{"stdout":"1.11111111111111\n"}︡
︠cd45339f-39c8-46a7-bfff-51f97bc92c07︠
sage: import mpmath
sage: mpmath.hyp2f1(2,3,4,5)
sage: mpmath.hyp0f1(2, 0.25)

︡b8a880c7-c3f6-4692-9f04-02d219b30a81︡{"stdout":"mpc(real='0.15654212933375475', imag='0.15079644737231007')\n"}︡{"stdout":"mpf('1.1303182079849701')\n"}︡
︠5bd09d6b-fb10-45b7-b314-cdbce7312c36︠
sage: mpmath.dps = 25
sage: mpmath.pretty = True
sage: mpmath.hyp0f1(2, 0.25)
︡ff7099eb-508a-4f0b-acff-f650c61f7b1f︡{"stdout":"mpf('1.1303182079849701')\n"}︡
︠4fb12c33-42a4-45ff-8327-ba76eacb8505︠










