︠c50dd8e4-c437-49aa-9ef9-e2554eb3ac54︠


reset()
def Harm_Osc(n, x):
 return sqrt(1/(2^n*factorial(n)))/(pi)^(0.25)*e^(-x^2/2)*hermite(n,x)
p = plot(x^2/2, (x, -3.2, 3.2), color='black')+ text('$x^2/2$', (3.9, 5), color='black', fontsize=13)
for n in range(5):
     p += plot(Harm_Osc(n, x)/2 + n + 0.5, (x, -5, 5), color=hue(n/5.0), fill=n + 0.5)+ text('$\Psi_%s$' %n, (5.2, n+0.5), color=hue(n/5.0), fontsize=13)
show(p, axes_labels=['$x$','$E$'])












︡6c345403-d261-44b2-9a19-54224bdedac3︡{"once":false,"file":{"show":true,"uuid":"0a937cd2-d9f7-4751-9dc1-d687ebc8395d","filename":"/mnt/home/Uip2WDDu/.sage/temp/compute7a/31176/tmp_9sJV5y.png"}}︡
︠cb9d50f6-bb05-4121-9581-4bea67d84035︠
︡8e805dee-89bd-4011-b3ef-eaa8bebce8c4︡
︠8d4996a3-8521-430b-96a1-3a6d15477bf6︠
︡79e7478d-c2f4-4aca-9537-08cab620ac47︡
︠0314bc21-1930-455d-9b90-cffd9700bb49︠









