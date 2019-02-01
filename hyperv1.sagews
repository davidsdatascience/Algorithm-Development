︠0887cce0-7edd-435c-abd0-af55f3491f40︠

︠5e3921fc-a26e-4fd4-9f72-4a682261bb61s︠

# quantum integer,factorial
a=numerical_approx(pi, digits=10)
print a
#see http://ask.sagemath.org/question/8470/evaluating-an-expression/#

nq=sin(pi*n/r)/sin(pi/r)

#r=10
b=prod(sin(pi*n/r)/sin(pi/r) for n in (1..30))
print numerical_approx(b)

c=prod(nq for n in (1..30))
#print numerical_approx(c)
print c











︡6b99849a-dc5b-466f-87c3-bc19e7d72c92︡{"stdout":"3.141592654\n"}︡{"stdout":"0.000000000000000\n"}︡{"stdout":"0\n"}︡
︠577e2812-0ac0-444e-931a-f19933c1fd9f︠









