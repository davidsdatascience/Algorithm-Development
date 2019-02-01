︠b9c007c9-c62e-4102-84d2-5e45370e1085as︠
%auto
typeset_mode(True, display=False)
︡e755835d-a8bd-4177-8624-800200897aef︡{"done":true}︡
︠ba44e822-8096-4a47-b300-015587ee33d5i︠
%html
<h1 style="text-align: center;">Kerr-Newman spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.6) in computations regarding Kerr-Newman spacetime, especially the check of Maxwell equations and Einstein equations.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2014)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Kerr_Newman.sws">here</a>.</em></p>
<p>&nbsp;</p>
<h2>Spacetime manifold</h2>
<p>We start by declaring the Kerr-Newman spacetime as a 4-dimensional diffentiable manifold:</p>

︡f8cb99bb-0f03-4718-a11f-636536baefff︡{"html": "<h1 style=\"text-align: center;\">Kerr-Newman spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.6) in computations regarding Kerr-Newman spacetime, especially the check of Maxwell equations and Einstein equations.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2014)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Kerr_Newman.sws\">here</a>.</em></p>\n<p>&nbsp;</p>\n<h2>Spacetime manifold</h2>\n<p>We start by declaring the Kerr-Newman spacetime as a 4-dimensional diffentiable manifold:</p>"}︡
︠3b957540-05a3-4c2d-b3d2-5922d88e150bs︠
M = Manifold(4, 'M', r'\mathcal{M}')


︡8ddba6bb-128b-4950-a9ae-3deb333be643︡
︠c2798590-9a5b-4677-a373-437700186bd0i︠
%html
<p>Let us use the standard <strong>Boyer-Lindquist coordinates</strong> on it, by first introducing the part $\mathcal{M}_0$ covered by these coordinates</p>

︡643051cc-85af-4c33-b602-f0e60fc4ddb9︡{"html":"<p>Let us use the standard <strong>Boyer-Lindquist coordinates</strong> on it, by first introducing the part $\\mathcal{M}_0$ covered by these coordinates</p>\n\n"}︡
︠a28698ac-c58f-433b-a823-3435952a761es︠
M0 = M.open_domain('M0', r'\mathcal{M}_0')
# BL = Boyer-Lindquist
BL.<t,r,th,ph> = M0.chart(r't r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi')
print BL ; BL
︡411895e7-b2d9-4cd6-8b62-38d3a25b4710︡{"stderr":"Error in lines 1-2\nTraceback (most recent call last):\n  File \"/projects/7cfb1e46-3916-4b1e-a78b-cd438d8115ea/.sagemathcloud/sage_server.py\", line 879, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"sage/structure/parent.pyx\", line 860, in sage.structure.parent.Parent.__getattr__ (build/cythonized/sage/structure/parent.c:8035)\n    attr = getattr_from_other_class(self, self._category.parent_class, name)\n  File \"sage/structure/misc.pyx\", line 251, in sage.structure.misc.getattr_from_other_class (build/cythonized/sage/structure/misc.c:1543)\n    raise dummy_attribute_error\nAttributeError: 'Manifold_with_category' object has no attribute 'open_domain'\n"}︡
︠dca57d70-525e-465a-9318-46f8e816b7bbsi︠
%html
<h2>Metric tensor</h2>
<p>The 3 parameters $m$, $a$ and $q$ of the Kerr-Newman spacetime are declared as symbolic variables:</p>

︡6919e6c1-7b92-42b4-9f3a-47d6f8d9fe82︡{"html":"<h2>Metric tensor</h2>\n<p>The 3 parameters $m$, $a$ and $q$ of the Kerr-Newman spacetime are declared as symbolic variables:</p>\n\n"}︡
︠225b3dd0-13cd-4c53-b41a-89898c05eaa9︠
var('m a q')
︡65b431b3-a8b8-4de2-b549-7fe6db694c0b︡︡
︠77814e1d-127e-4ebf-b038-552c6756ded0is︠
%html
<p>Let us introduce the spacetime metric:</p>

︡62c6ae66-e670-4476-bf69-379bf5a8f2fa︡{"html":"<p>Let us introduce the spacetime metric:</p>\n\n"}︡
︠800641c6-a5b6-4d81-96d7-84e0b14eb41ci︠
g = M.lorentz_metric('g')
︡a78549f3-0fdd-4296-8a91-c2884448aad9︡︡
︠0a22102d-6754-43fe-b283-2b2c4878a6eci︠
%html
<p>The metric is defined by its components in the coordinate frame associated with Boyer-Lindquist coordinates, which is the current manifold's default frame:</p>

︡16453e0e-e624-4cf8-a3f9-3d0237df13b4︡{"html": "<p>The metric is defined by its components in the coordinate frame associated with Boyer-Lindquist coordinates, which is the current manifold's default frame:</p>"}︡
︠381b7cd9-e3a6-456f-bd12-d1c6fd60c2efs︠
rho2 = r^2 + (a*cos(th))^2
Delta = r^2 -2*m*r + a^2 + q^2
g[0,0] = -1 + (2*m*r-q^2)/rho2
g[0,3] = -a*sin(th)^2*(2*m*r-q^2)/rho2
g[1,1], g[2,2] = rho2/Delta, rho2
g[3,3] = (r^2 + a^2 + (2*m*r-q^2)*(a*sin(th))^2/rho2)*sin(th)^2
g.view()
︡4acc56ff-26a1-495e-b57d-07f730a21ea3︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/7cfb1e46-3916-4b1e-a78b-cd438d8115ea/.sagemathcloud/sage_server.py\", line 879, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"sage/rings/integer.pyx\", line 1958, in sage.rings.integer.Integer.__pow__ (build/cythonized/sage/rings/integer.c:12463)\n    return self ** int(n)\nTypeError: unsupported operand type(s) for ** or pow(): 'R' and 'int'\n"}︡
︠c6690cc0-57af-49e6-b7c2-fa29b751f235i︠
%html
<h2>Electromagnetic field tensor</h2>
<p>Let us first introduce the 1-form basis associated with Boyer-Lindquist coordinates:</p>

︡2257cc87-b14a-4437-9458-ea0d067785b3︡{"html": "<h2>Electromagnetic field tensor</h2>\r\n<p>Let us first introduce the 1-form basis associated with Boyer-Lindquist coordinates:</p>"}︡
︠5882bc77-d7a0-40e1-8074-98a87dbd56f1s︠
dBL = BL.coframe() ; dBL
︡959325d5-2473-4712-b755-d2f45bf8d559︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/7cfb1e46-3916-4b1e-a78b-cd438d8115ea/.sagemathcloud/sage_server.py\", line 879, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'BL' is not defined\n"}︡
︠5f8c2bbb-7205-48ce-8d1b-b544656114a9si︠
%html
<p>The electromagnetic field tensor $F$ is formed as [cf. e.g. Eq. (33.5) of Misner, Thorne &amp; Wheeler (1973)]</p>

︡bf7afee4-0166-431b-ac5e-a8258a9ba4d5︡{"html":"<p>The electromagnetic field tensor $F$ is formed as [cf. e.g. Eq. (33.5) of Misner, Thorne &amp; Wheeler (1973)]</p>\n\n"}︡
︠6daa2c2f-0843-49f0-b051-886100f1ae52︠
F = M.diff_form(2, name='F')
F.set_restriction( q/rho2^2 * (r^2-a^2*cos(th)^2)* dBL[1].wedge( dBL[0] - a*sin(th)^2* dBL[3] ) + \
    2*q/rho2^2 * a*r*cos(th)*sin(th)* dBL[2].wedge( (r^2+a^2)* dBL[3] - a* dBL[0] ) )
F.view()
︡e29a17cb-95d9-4176-8e41-344e3d08ce34︡︡
︠ef0bf00e-6253-41a1-93d7-c7a112c4f7bci︠
%html
<p>The Hodge dual of $F$:</p>

︡a5e9e223-8945-4210-bdbc-9f112edef1a2︡{"html": "<p>The Hodge dual of $F$:</p>"}︡
︠1c25674a-04a3-435f-96da-ecda5e21d443︠
star_F = F.hodge_star(g) ; star_F.view()
︡00793032-07f8-4dad-b04c-fd3fda612d3b︡︡
︠16d180c3-c062-42dc-8070-765c54dd09f2i︠
%html
<h3>Maxwell equations</h3>

<p>Let us check that $F$ obeys the two (source-free) Maxwell equations:</p>

︡52976004-7319-4b79-a109-95fa8287f60d︡{"html": "<h3>Maxwell equations</h3>\r\n\r\n<p>Let us check that $F$ obeys the two (source-free) Maxwell equations:</p>"}︡
︠9c297a40-2333-481e-8660-88da576d4cdd︠
xder(F).view()
︡335a40dd-67fb-4009-8f43-2286e4a50cd5︡︡
︠cd0e62cd-6344-44dd-ba89-f369d3a21696︠
xder(star_F).view()
︡3b8f9a45-7288-4ac8-87c6-292852cb6cdc︡︡
︠a3da1e2f-5514-4b16-a82d-5c44460b1a3bi︠
%html
<h2>Levi-Civita Connection</h2>

<p>The Levi-Civita connection $\nabla$ associated with $g$:</p>

︡e6a31936-2eba-4784-84f0-d1861bdfee6c︡{"html": "<h2>Levi-Civita Connection</h2>\r\n\r\n<p>The Levi-Civita connection $\\nabla$ associated with $g$:</p>"}︡
︠d94b80c3-b976-4e29-baa6-2e5bf1871bfe︠
nab = g.connection() ; print nab
︡c882fbdc-3af6-4b2b-a42c-d343e5aaa751︡︡
︠5a34a16c-fbae-48f7-aa34-a2416c6d0f84i︠
%html
<p>Let us verify that the covariant derivative of $g$ with respect to $\nabla$ vanishes identically:</p>

︡a7654414-377f-44b4-acdb-199ca956c1e6︡{"html": "<p>Let us verify that the covariant derivative of $g$ with respect to $\\nabla$ vanishes identically:</p>"}︡
︠93d040c7-0feb-4f4b-b8da-3f6ab29b15db︠
nab(g) == 0
︡c95f5beb-e7e2-43a8-b2ff-983136fe22d5︡︡
︠20ebbe8b-4645-426d-95da-5857f8d2fef8︠
nab(g).view() # another view of the above property
︡47f4cc6f-2d95-4c0b-8cca-89ab3bb86312︡︡
︠8648ed82-bf77-4601-9cdb-0cf25ba09f9ai︠
%html
<h2>Killing vectors</h2>
<p><span id="cell_outer_32">The default vector frame on the spacetime manifold is the coordinate basis associated with Boyer-Lindquist coordinates:</span></p>

︡beb62b88-6d68-4449-873e-1d44e7b8a523︡{"html": "<h2>Killing vectors</h2>\r\n<p><span id=\"cell_outer_32\">The default vector frame on the spacetime manifold is the coordinate basis associated with Boyer-Lindquist coordinates:</span></p>"}︡
︠d5dd06a0-5b0a-4b6d-bc1d-b9bfa27f4c60︠
M.default_frame() is BL.frame()
︡0ede8eb0-8659-4775-b0d7-f47680513d5e︡︡
︠309737c2-9a51-4edb-9827-7baae971dbc0︠
BL.frame()
︡bedf0c46-e425-49ca-82ad-92eda6253df2︡︡
︠5826ed44-3df9-4704-a530-6ce74ee82e1bi︠
%html
<p>Let us consider the first vector field of this frame:</p>

︡ba121d51-b632-4509-9fce-ec558b32b5ee︡{"html": "<p>Let us consider the first vector field of this frame:</p>"}︡
︠36d32118-6eca-4a7d-a2e7-40c980005a90︠
xi = BL.frame()[0] ; xi
︡8b8bf9c6-5276-4ca3-b498-1416f5261659︡︡
︠3cd8048c-ac72-4bc3-bf2b-ba3a6c8b658b︠
print xi
︡57d0092d-f50b-48f2-800a-ac9b548e6d0f︡︡
︠54b5710d-1f91-4cf5-9241-b83ffa0ebeb4i︠
%html
<p><span id="cell_outer_35">The 1-form associated to it by metric duality is</span></p>

︡c36b11e2-b6eb-4799-b4cc-5a9e9d6b2889︡{"html": "<p><span id=\"cell_outer_35\">The 1-form associated to it by metric duality is</span></p>"}︡
︠1ad16a4c-b63f-4d94-beb8-a7b2ada1e27d︠
xi_form = xi.down(g) ; xi_form.view()
︡781e50fe-5371-407e-9cf5-33c4173bc045︡︡
︠c87e8e60-e090-4a70-93d5-8bfb784d3718i︠
%html
<p><span id="cell_outer_36">Its covariant derivative is</span></p>

︡1f3a9a3c-f423-491b-a93a-b4a83ac17b96︡{"html": "<p><span id=\"cell_outer_36\">Its covariant derivative is</span></p>"}︡
︠775eb25e-911a-4568-a185-35af4aa1cb6a︠
nab_xi = nab(xi_form) ; print nab_xi ; nab_xi.view()
︡2aa258fe-5f62-4049-b334-602b918c961d︡︡
︠60f28f1d-dd85-46cb-a6e1-6d61a35243ffi︠
%html
<p><span id="cell_outer_37">Let us check that the vector field $\xi=\frac{\partial}{\partial t}$ obeys Killing equation:</span></p>

︡174ca4eb-6c8b-42ff-9a7b-3ee1b3f39c24︡{"html": "<p><span id=\"cell_outer_37\">Let us check that the vector field $\\xi=\\frac{\\partial}{\\partial t}$ obeys Killing equation:</span></p>"}︡
︠abbb77f5-c23f-4d5a-98d0-fb12a03323d5︠
nab_xi.symmetrize() == 0
︡4bbf6689-8877-4bdf-8073-052421e1a27c︡︡
︠387445dc-031d-48d5-8429-9fa68c1a700di︠
%html
<p><span id="cell_outer_38">Similarly, let us check that</span> $\chi := \frac{\partial}{\partial\phi}$ is a Killing vector:</p>

︡f195f9ed-98f5-4b0b-98ef-51cb0be0e95a︡{"html": "<p><span id=\"cell_outer_38\">Similarly, let us check that</span> $\\chi := \\frac{\\partial}{\\partial\\phi}$ is a Killing vector:</p>"}︡
︠345f04ff-3b10-4a11-8748-97a95a526ff0︠
chi = BL.frame()[3] ; chi
︡cad6c5dd-463a-4142-982d-fec89920370e︡︡
︠98f18acc-043b-4e38-93ec-3740d4e2891a︠
nab(chi.down(g)).symmetrize() == 0
︡a2528dbb-ad11-4959-8001-c913aa32a394︡︡
︠9bddc054-3410-4644-b810-664229865166i︠
%html
<p>Another way to check that $\xi$ and $\chi$ are Killing vectors is the vanishing of the Lie derivative of the metric tensor along them:</p>

︡14a45d1a-a23b-45af-98a2-bbda11dc2715︡{"html": "<p>Another way to check that $\\xi$ and $\\chi$ are Killing vectors is the vanishing of the Lie derivative of the metric tensor along them:</p>"}︡
︠1d4d4852-f5aa-4cf6-87af-7ff7e8756d1d︠
g.lie_der(xi) == 0
︡882c2f3f-d6d5-4ac9-abb6-7d7563ec9ee8︡︡
︠409cf337-29dd-4156-b7d3-cb96c91e7dd7︠
g.lie_der(chi) == 0
︡7c40492b-8159-4bae-b9c9-235262d25dc7︡︡
︠660a6061-1abb-44d3-82dc-547c54a7bfcbi︠
%html
<h2>Curvature</h2>

<p>The Ricci tensor associated with $g$:</p>

︡841110da-cc21-4494-b1b2-7cc3055f978c︡{"html": "<h2>Curvature</h2>\r\n\r\n<p>The Ricci tensor associated with $g$:</p>"}︡
︠79e2dfa1-76a4-424d-aea7-28fac5686b0a︠
Ric = g.ricci() ; print Ric
︡cf2de37b-3420-46fb-864a-9792f7324148︡︡
︠c4972126-b4bc-44a0-b113-926e13ac846f︠
Ric.view()
︡2da18346-dd56-406c-a38c-67314a718d53︡︡
︠07c15450-fd21-40d2-8a48-98b30351f063︠
Ric[:]
︡b844d0f6-e255-4d1e-a504-0ed2c2a061e4︡︡
︠46c7af74-5315-4817-aac2-e6bc41fd55d4i︠
%html
<p>Let us check that in the Kerr case, i.e. when $q=0$, the Ricci tensor is zero:</p>

︡9b327563-9a60-47e9-854e-d72ee83e2335︡{"html": "<p>Let us check that in the Kerr case, i.e. when $q=0$, the Ricci tensor is zero:</p>"}︡
︠5a855052-138b-4a02-bd95-72ff5bfd7ed0︠
Ric[:].subs(q=0)
︡e87e15b8-a078-4ef2-94e8-66929243a848︡︡
︠5ed97c0f-5bc5-4a73-8c17-71640f15e4fbi︠
%html
<p>The Riemann curvature tensor associated with $g$:</p>

︡4af99b62-f1f4-450a-8632-97b68616ffcd︡{"html": "<p>The Riemann curvature tensor associated with $g$:</p>"}︡
︠394332b3-6b6a-4041-a39c-b61aedf00ca6︠
R = g.riemann() ; print R
︡a8823c22-524f-4b32-a1a7-b1a87b05f6f5︡︡
︠99d92764-bf95-4ab2-b5a3-37afba4f59f3i︠
%html
<p>The component $R^0_{\ \, 101}$ of the Riemann tensor is</p>

︡64887cc5-f196-4a89-b766-eaef30fc23b5︡{"html": "<p>The component $R^0_{\\ \\, 101}$ of the Riemann tensor is</p>"}︡
︠4bf64097-1341-4440-8711-304b0c48b9c9︠
R[0,1,0,1]
︡b22aba13-5a53-40ef-8789-63f3c54a3ef3︡︡
︠ef419dd8-6068-4a08-992b-53871c328393i︠
%html
<p>The expression in the uncharged limit (Kerr spacetime) is</p>

︡3157f623-e059-4a47-a78e-b9c8a50289d4︡{"html": "<p>The expression in the uncharged limit (Kerr spacetime) is</p>"}︡
︠ee2e2e8c-d076-4985-8ea3-bacf21437616︠
R[0,1,0,1].expr().subs(q=0).simplify_rational()
︡01bf6f6a-8e75-4fd3-93a8-79d949a40b4b︡︡
︠ecde9da6-b9d2-4c1b-90ae-6b7e7f2e4eb1i︠
%html
<p>while in the non-rotating limit (Reissner-Nordstr&ouml;m spacetime), it is</p>

︡6093125f-804d-4856-a3a0-a89641ed85ec︡{"html": "<p>while in the non-rotating limit (Reissner-Nordstr&ouml;m spacetime), it is</p>"}︡
︠b133dfef-29e3-45b4-b3f9-2c0fe574bf3c︠
R[0,1,0,1].expr().subs(a=0).simplify_rational()
︡77622e9c-d434-4f69-94f0-826fd8e730ba︡︡
︠534d3a02-dbab-4bfd-8a8f-6dc2b0c38e98i︠
%html
<p>In the Schwarzschild limit, it reduces to</p>

︡de289d4a-55d4-47c9-aa0d-141c0c0aa82a︡{"html": "<p>In the Schwarzschild limit, it reduces to</p>"}︡
︠1b4806ae-27b1-4637-924c-123c427572b4︠
R[0,1,0,1].expr().subs(a=0, q=0).simplify_rational()
︡6168fc75-7546-44d6-9261-d9abd81f3c08︡︡
︠51915506-132e-4dc0-9e5b-18a62b141633i︠
%html
<p>Obviously, it vanishes in the flat space limit:</p>

︡34e8a5f4-feae-4b59-9ee3-10ce809b8eac︡{"html": "<p>Obviously, it vanishes in the flat space limit:</p>"}︡
︠2960f6c2-1327-41f1-be95-07436a756e7d︠
R[0,1,0,1].expr().subs(m=0, a=0, q=0)
︡aa679e7a-8fc7-491b-bd8c-e2d21bdf54f2︡︡
︠9a4ca36e-7f07-4456-9e39-016d72dbf995i︠
%html
<h3>Bianchi identity</h3>

<p>Let us check the Bianchi identity $\nabla_p R^i_{\ \, j kl} + \nabla_k R^i_{\ \, jlp} + \nabla_l R^i_{\ \, jpk} = 0$:</p>

︡3f3148b4-cf8f-4504-9493-a054b40764f6︡{"html": "<h3>Bianchi identity</h3>\r\n\r\n<p>Let us check the Bianchi identity $\\nabla_p R^i_{\\ \\, j kl} + \\nabla_k R^i_{\\ \\, jlp} + \\nabla_l R^i_{\\ \\, jpk} = 0$:</p>"}︡
︠e8f88523-1e6b-4116-8c6b-c15f8e095789︠
DR = nab(R) ; print DR  #long (takes a while)
︡c815be68-d24c-4212-a396-5692883afaba︡︡
︠04476d81-1099-4fa6-85b0-7d201e80d2e3︠
for i in M.irange():
    for j in M.irange():
        for k in M.irange():
            for l in M.irange():
                for p in M.irange():
                    print DR[i,j,k,l,p] + DR[i,j,l,p,k] + DR[i,j,p,k,l] ,
︡3b3a7d02-9195-4105-9bb8-96421877b370︡︡
︠758cb3d6-9f0d-4a89-8d90-31c8dc6cb67ei︠
%html
<p>If the last sign in the Bianchi identity is changed to minus, the identity does no longer hold:</p>

︡fc9c50e0-82d2-4d38-8d42-f863810dd13e︡{"html": "<p>If the last sign in the Bianchi identity is changed to minus, the identity does no longer hold:</p>"}︡
︠22be6bc6-a384-450c-a47e-496f6557301a︠
DR[0,1,2,3,1] + DR[0,1,3,1,2] + DR[0,1,1,2,3] # should be zero (Bianchi identity)
︡f0627a14-3c5c-4ea0-a9b0-bf6950015bb1︡︡
︠98f59eba-fcae-477a-89c1-b2d3fd5ff818︠
DR[0,1,2,3,1] + DR[0,1,3,1,2] - DR[0,1,1,2,3] # note the change of the second + to -
︡cea6f6ce-b3bc-45e1-b475-3d29ecfa37ce︡︡
︠a7bd3ce4-c2ed-474b-8d79-27af8c8efc54i︠
%html
<h3>Ricci scalar</h3>
<p>The Ricci scalar $R = g^{\mu\nu} R_{\mu\nu}$ of the Kerr-Newman spacetime vanishes identically:</p>

︡b4b3c850-32ba-4236-ad60-d6508daf6911︡{"html": "<h3>Ricci scalar</h3>\r\n<p>The Ricci scalar $R = g^{\\mu\\nu} R_{\\mu\\nu}$ of the Kerr-Newman spacetime vanishes identically:</p>"}︡
︠e00a3c52-44a8-45d4-b57e-f1f86342064c︠
g.ricci_scalar().view()
︡a3c477fc-ed0f-4c80-b1c5-93de7685bccb︡︡
︠bf1a2667-ccd0-4297-b95b-de5f45093b62i︠
%html
<h2>Einstein equation</h2>
<p>The Einstein tensor is</p>

︡17000671-c24f-4da1-ab3e-56b226d1ebf2︡{"html": "<h2>Einstein equation</h2>\r\n<p>The Einstein tensor is</p>"}︡
︠80ade2f5-b629-4651-b0bd-c42df8f6ab9f︠
G = Ric - 1/2*g.ricci_scalar()*g ; print G
︡8964f405-dd6e-49ad-bb83-2a331ef18ef3︡︡
︠217b673a-c9bc-4293-a624-511afa555604i︠
%html
<p>Since the Ricci scalar is zero, the Einstein tensor reduces to the Ricci tensor:</p>

︡8c366192-1a6b-4711-9604-8fb5d56406c6︡{"html": "<p>Since the Ricci scalar is zero, the Einstein tensor reduces to the Ricci tensor:</p>"}︡
︠89764c30-560f-4f7f-b9fc-9b633238bfbc︠
G == Ric
︡8aaa8134-8eb9-43e9-8159-e43649390874︡︡
︠5b98fbf1-769f-4a67-a7a0-24003e8d720di︠
%html
<p>The invariant $F_{\mu\nu} F^{\mu\nu}$ of the electromagnetic field:</p>

︡416223f0-7264-43fe-8897-0be4e18d9c5b︡{"html": "<p>The invariant $F_{\\mu\\nu} F^{\\mu\\nu}$ of the electromagnetic field:</p>"}︡
︠336e6be6-8c70-4a17-a821-003870f81b60︠
Fuu = F.up(g)
F2 = F['_ab']*Fuu['^ab'] ; print F2
︡0ffe0dac-8aac-4b9c-96bf-4612ea913d2e︡︡
︠257eb508-ce53-4496-8001-783e24ab4eab︠
F2.view()
︡dfea914a-fbaa-46ed-8f5d-1f11c21261bf︡︡
︠2a21908c-ef47-49ac-8099-dfc09d2989e0i︠
%html
<p>The energy-momentum tensor of the electromagnetic field:</p>

︡a6aadbd7-9c79-416b-858c-15a5dd0c5c8d︡{"html": "<p>The energy-momentum tensor of the electromagnetic field:</p>"}︡
︠fedf31b1-6b12-4dc4-8f2c-bb6cc0befe2d︠
Fud = F.up(g,0)
T = 1/(4*pi)*( F['_k.']*Fud['^k_.'] - 1/4*F2 * g ); print T
︡500e2a81-e9bf-42c6-a861-fbce07ad911c︡︡
︠e860de89-30f5-423e-9db1-26759e3f8262︠
T[:]
︡dac1d2fe-6616-48db-80f4-db958f30bb19︡︡
︠e2d47bdc-eb3a-4c10-b3e1-92dd33e73f91i︠
%html
<p>Check of the Einstein equation:</p>

︡a8457520-ad78-4c96-ada9-3387dd2aa384︡{"html": "<p>Check of the Einstein equation:</p>"}︡
︠ce346199-ed1d-41d2-8fec-f12b73df2613︠
G == 8*pi*T
︡6174680e-8c17-43c2-9cf4-b24fd9f22d73︡︡
︠2a3f8bd2-f6c0-4b97-835b-d87c3dc1f5fci︠
%html
<h3>Kretschmann scalar</h3>

<p>The tensor $R^\flat$, of components $R_{ijkl} = g_{ip} R^p_{\ \, jkl}$:</p>

︡0eccfc60-8209-4761-960f-5ef82018ccf4︡{"html": "<h3>Kretschmann scalar</h3>\r\n\r\n<p>The tensor $R^\\flat$, of components $R_{ijkl} = g_{ip} R^p_{\\ \\, jkl}$:</p>"}︡
︠4430a42b-e95c-4d65-91c5-e3e2789e3159︠
dR = R.down(g) ; print dR
︡cbbcf7c8-2bf8-4c37-a8f7-8f61a41863b3︡︡
︠ec1a3fbc-732d-468e-8cc7-13b3e1e6e94ei︠
%html
<p>The tensor $R^\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\ \, pqr}$:</p>

︡0ae389bb-6422-48bf-a6d3-f25ac904b4ec︡{"html": "<p>The tensor $R^\\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\\ \\, pqr}$:</p>"}︡
︠52cacade-6dcb-456a-a79b-cf823298448c︠
uR = R.up(g) ; print uR
︡e437b1b0-2c62-4b12-85c3-abc4e09d1b9f︡︡
︠047d691f-4bdb-4ebd-8f32-6ec0436df4e4i︠
%html
<p>The Kretschmann scalar $K := R^{ijkl} R_{ijkl}$:</p>

︡e3fca93c-7df0-48e9-a5b4-29dee04ea190︡{"html": "<p>The Kretschmann scalar $K := R^{ijkl} R_{ijkl}$:</p>"}︡
︠3975583f-96c6-4f0e-9226-619335f761ee︠
Kr_scalar = uR['^ijkl']*dR['_ijkl']
Kr_scalar.view()
︡a5bdde8b-5b32-4a53-9d9e-683523196d72︡︡
︠2a0c6cce-ff5f-43bb-bb66-37df2c5bd22ai︠
%html
<p>A variant of this expression can be obtained by invoking the factor() method:</p>

︡8dcac101-298b-446d-a951-ae9df1b1a004︡{"html": "<p>A variant of this expression can be obtained by invoking the factor() method:</p>"}︡
︠bb437739-b4c7-40ad-9a0b-075065baee82︠
Kr = Kr_scalar.function_chart() # coordinate function representing the scalar field in the default chart
Kr.factor()
︡4000d16f-d720-4cad-97d7-041f494633c2︡︡
︠5ec23cb1-4580-40a4-863f-119011d2303bi︠
%html
<p>As a check, we can compare Kr to the formula given by R. Conn Henry, <a href="http://iopscience.iop.org/0004-637X/535/1/350/fulltext/">Astrophys. J. <strong>535</strong>, 350 (2000)</a>:</p>

︡8bb49ac3-c94f-4c40-8e24-418898ab6729︡{"html": "<p>As a check, we can compare Kr to the formula given by R. Conn Henry, <a href=\"http://iopscience.iop.org/0004-637X/535/1/350/fulltext/\">Astrophys. J. <strong>535</strong>, 350 (2000)</a>:</p>"}︡
︠19949bf5-e121-4d90-ae77-715a7eb8b093︠
Kr == 8/(r^2+(a*cos(th))^2)^6 *( \
          6*m^2*(r^6 - 15*r^4*(a*cos(th))^2 + 15*r^2*(a*cos(th))^4 - (a*cos(th))^6) \
        - 12*m*q^2*r*(r^4 - 10*(a*r*cos(th))^2 + 5*(a*cos(th))^4) \
        + q^4*(7*r^4 - 34*(a*r*cos(th))^2 + 7*(a*cos(th))^4) )
︡1be1a63f-5422-4ea6-97cd-df2f0eedb79d︡︡
︠0a64755d-beca-40c9-a6b6-99be3739bae8i︠
%html
<p>The Schwarzschild value of the Kretschmann scalar is recovered by setting $a=0$ and $q=0$:</p>

︡001f02e1-9eca-48ba-87e2-414b06c49b2a︡{"html": "<p>The Schwarzschild value of the Kretschmann scalar is recovered by setting $a=0$ and $q=0$:</p>"}︡
︠677181dd-b5f9-4850-8771-fe4f8a54d2a4︠
Kr.expr().subs(a=0, q=0)
︡1f1a459c-88bd-4e36-88f4-e14a30f1b8cb︡︡
︠69e27f84-8c34-40bc-a139-555a84438421︠
K1 = Kr.expr().subs(m=1, a=0.9, q=0.5)
︡31845656-e884-43b0-abf0-9c02ac84fd17︡︡
︠db1dc237-9fa0-4324-80cf-0e4dc3751ad6︠
plot3d(K1, (r,1,3), (th, 0, pi))
︡020a3dd9-3975-4e0b-bff9-8e9701579c10︡︡









