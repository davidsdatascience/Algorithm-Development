In this file we compute the spectrum of the Ricci operator, defined previously in our paper, for different values of the spins in the case of a simple graph : a monochromatic 4 - valent node dual to an equilateral tetrahedron.

ClearAll["`*"];
a = 20; (*Number of iterations corresponding to twice of the maximal \
configuration (highest spin)*)
TR = Table[{}, {y, 1, a}];(*The variable containing the spectrum of R*)

SetSharedVariable[TR];
DistributeDefinitions[j0, Q, R, EvaQ, EveQ, B, \[CapitalLambda], H, L2, EvaL2,
   EveL2, L, \[Epsilon], Le];
ParallelDo[
  j0 = x/2;(*j0 is the value of the spin*)
  Q = Table[
    Sum[I/(Sqrt[4 k^2 - 1]) k^2 (2 j0 + 1 + k) (2 j0 + 1 -
        k) (KroneckerDelta[i, k] KroneckerDelta[k - 1, j] -
        KroneckerDelta[i, k - 1] KroneckerDelta[k, j]), {k, 1, 2 j0}], {i, 0,
     2 j0}, {j, 0, 2 j0}];(*Q is the matrix defining the operator Q{e1,e2,
  e3} used in the definition of the volume operator*)

  EvaQ = Eigenvalues[Q];
  EveQ = Eigenvectors[Q];

  B = Table[
    KroneckerDelta[i, j], {i, 0, 2 j0}, {j, 0,
     2 j0}];(*B is the intertwiner basis*)

  \[CapitalLambda] =
   Table[Sum[
     If[EvaQ[[k]] == 0, 0,
      N[Sqrt[12/
          Abs[EvaQ[[k]]]] (B[[i + 1]].Normalize[EveQ[[k]]]) (Conjugate[
           Normalize[EveQ[[k]]]].B[[j + 1]]), 10]], {k, 1, 2 j0 + 1}], {i, 0,
     2 j0}, {j, 0,
     2 j0}];(*\[CapitalLambda] is the matrix defining the operator \
\[CapitalLambda]_n corresponding to the inverse of the volume operator \
expressed in the intertwiner basis, hence the scalar products EveQ[[k]]]].B[[
  j+1]] in the expression*)

  H = Table[
    KroneckerDelta[i,
      j] (j0^2 (j0 + 1)^2 - (i (i + 1) - 2 j0 (j0 + 1))^2/
        4 - (i (i + 1) - 2 j0 (j0 + 1))/2), {i, 0, 2 j0}, {j, 0,
     2 j0}];(*H is the matrix defining the operator "\[Delta]ij.Y^i.Y^j" used \
to define the length operator expressed in the intertwiner basis*)

  L2 = \[CapitalLambda].H.\[CapitalLambda];(*L2 is the square of the length \
operator*)
  EvaL2 = Eigenvalues[L2];
  EveL2 = Eigenvectors[L2];

  L = Table[
    Sum[N[(EvaL2[[k]])^(1/2) (B[[i + 1]].Normalize[EveL2[[k]]]) (Conjugate[
          Normalize[EveL2[[k]]]].B[[j + 1]]), 10], {k, 1, 2 j0 + 1}], {i, 0,
     2 j0}, {j, 0,
     2 j0}];(*L is the length operator expressed in the intertwiner basis,
  hence the scalar products EveL2[[k]]]].B[[j+1]] in the expression*)

  \[Epsilon] =
   Table[KroneckerDelta[i, j] ArcCos[(i (i + 1)/(2 j0 (j0 + 1)) - 1)], {i, 0,
     2 j0}, {j, 0,
     2 j0}];(*\[Epsilon] is the deficit angle operator expressed in the \
intertwiner basis*)

  Le = 1/2 (L.\[Epsilon] + \[Epsilon].L);(*Le is the Ricci operator for one \
edge of the tetrahedron*)

  R = Table[
    2 (Le[[i + 1]][[j + 1]] +
       Sum[Sqrt[(2 i + 1)] Sqrt[(2 j + 1)] Sqrt[(2 h + 1)] Sqrt[(2 t +
            1)] ((-1)^(t + h) + (-1)^(i + j + t + h)) SixJSymbol[{j0, j0,
           i}, {j0, j0, t}] SixJSymbol[{j0, j0, j}, {j0, j0, h}] Le[[h + 1]][[
          t + 1]], {h, 0, 2 j0}, {t, 0, 2 j0}]), {i, 0, 2 j0}, {j, 0,
     2 j0}];(*R is the Ricci operator for the for the tetrahedron defined by \
summing the operators of the six edges all of them expressed in the \
intertwiner basis j12*)

  TR[[x]] = Eigenvalues[R];

  , {x, 1, a}] // AbsoluteTiming

{3671.971024, Null}

OpenWrite["/home/cptsu4/falk/TR_10_data"];(*Saving the data*)
TR >> "/home/cptsu4/falk/TR_10_data"
Close["/home/cptsu4/falk/TR_10_data"];

TR = Flatten[ReadList["/home/naruto/TR_10_data"],
   1];(*Reading data from a file*)

PR = Table[{i/2, 7/10 Re[TR[[i]][[k]]]/(8 Pi)}, {i, 1, a}, {k, 1,
    i + 1}];(*List of the spectrum of R as a function of the spin*)
PRM = Table[{i/2, Sum[Re[TR[[i]][[k]]]/(8 Pi), {k, 1, i + 1}]/(i + 1)}, {i, 1,
     a}];
MPR = Table[{i/2, Max[Table[Re[TR[[i]][[k]]/(8 Pi)], {k, 1, i + 1}]]}, {i, 1,
    a}];(*List of maximum values of the spectrum of R as a function of the \
spin*)
F1 = Fit[PRM, {1, Sqrt[z]}, z]
Show[ListPlot[PR, AxesOrigin -> {0, 0}, PlotStyle -> {PointSize[Medium]},
  PlotRange -> All,
  AxesLabel -> {j0, \[Lambda]}]](*Plot of the spectrum of R as a function of \
the spin*)
F2 = Fit[MPR, {1, z}, z]
Show[ListPlot[MPR, AxesOrigin -> {0, 0}, PlotStyle -> {PointSize[Medium]},
  PlotRange -> All],
 Plot[F2, {z, 0, a/2},
  PlotStyle ->
   Red]](*Plot of the maximum values of the spectrum of R as a function of \
the spin*)

0

\!\(\*
GraphicsBox[{{}, {
{RGBColor[0.24720000000000017`, 0.24, 0.6], PointSize[Medium],
      PointBox[{{0.5, 0.7337346974125973}, {0.5, 0.7337346974125973}}]},
{RGBColor[0.6, 0.24, 0.4428931686004542], PointSize[Medium],
      PointBox[{{1., 0.7682425107365664}, {1., 0.7682425107365664}, {1.,
       9.730786799831146*^-21}}]},
{RGBColor[0.6, 0.5470136627990908, 0.24], PointSize[Medium],
      PointBox[{{1.5, 1.3004949550080003`}, {1.5, 1.3004949550080003`}, {1.5,
       0.8698962344828475}, {1.5, 0.8041152384699909}}]},
{RGBColor[0.24, 0.6, 0.33692049419863584`], PointSize[Medium],
      PointBox[{{2., 1.2528640819879764`}, {2., 1.2528640819879762`}, {2.,
       0.9076555408413841}, {2., 0.9076555408413748}, {2.,
       7.870420959932861*^-11}}]},
{RGBColor[0.24, 0.35317267440181815`, 0.6], PointSize[Medium],
      PointBox[{{2.5, 1.8132831754254342`}, {2.5, 1.813283175425365}, {2.5,
       1.171795425814369}, {2.5, 1.0355511970003026`}, {2.5,
       1.012048285479239}, {2.5, 1.0120482854779855`}}]},
{RGBColor[0.6, 0.24, 0.5632658430022721], PointSize[Medium],
      PointBox[{{3., 1.7238580324827077`}, {3., 1.7238580324774595`}, {3.,
       1.115136342424956}, {3., 1.1151363424248535`}, {3.,
       1.1102828212520994`}, {3., 1.107128429848993}, {
       3., -0.0009477974499710743}}]},
{RGBColor[0.6, 0.4266409883972719, 0.24], PointSize[Medium],
      PointBox[{{3.5, 2.322191724058425}, {3.5, 2.322191724058424}, {3.5,
       1.4521380600571077`}, {3.5, 1.2384203796019373`}, {3.5,
       1.2103334106035977`}, {3.5, 1.2103334106035977`}, {3.5,
       1.178915204183087}, {3.5, 1.178915204183087}}]},
{RGBColor[0.2634521802031821, 0.6, 0.24], PointSize[Medium],
      PointBox[{{4., 2.1956503129749567`}, {4., 2.195650312928882}, {4.,
       1.311051781518483}, {4., 1.3110517811530809`}, {4.,
       1.309859032064987}, {4., 1.299314009281537}, {4.,
       1.2512633771329718`}, {4., 1.2512633771011015`}, {
       4., -0.002382299830543425}}]},
{RGBColor[0.24, 0.47354534880363613`, 0.6], PointSize[Medium],
      PointBox[{{4.5, 2.8315342196541353`}, {4.5, 2.831534219617446}, {4.5,
       1.7282372182902885`}, {4.5, 1.44136902068468}, {4.5,
       1.3974888983177864`}, {4.5, 1.3974888926471205`}, {4.5,
       1.344222985780994}, {4.5, 1.344222927303285}, {4.5,
       1.3265118462511434`}, {4.5, 1.3169484628007173`}}]},
{RGBColor[0.5163614825959097, 0.24, 0.6], PointSize[Medium],
      PointBox[{{5., 2.6690906628485225`}, {5., 2.6690906626980784`}, {5.,
       1.5074760428873406`}, {5., 1.5074759414011223`}, {5.,
       1.5041429890412095`}, {5., 1.4823205395131005`}, {5.,
       1.4118957317997454`}, {5., 1.4118954598720166`}, {5.,
       1.3830524275733818`}, {5., 1.3830522798966223`}, {
       5., -0.004187135043540482}}]},
{RGBColor[0.6, 0.3062683139954558, 0.24], PointSize[Medium],
      PointBox[{{5.5, 3.3418307458729744`}, {5.5, 3.3418307458575836`}, {5.5,
       2.004025394137031}, {5.5, 1.6450021569749234`}, {5.5,
       1.5827885434174302`}, {5.5, 1.5827885091992242`}, {5.5,
       1.5010039195045057`}, {5.5, 1.5010039108008084`}, {5.5,
       1.4797992621527924`}, {5.5, 1.4553795776647316`}, {5.5,
       1.450954910393356}, {5.5, 1.4509548597506248`}}]},
{RGBColor[0.3838248546049982, 0.6, 0.24], PointSize[Medium],
      PointBox[{{6., 3.143954207593242}, {6., 3.1439542071876057`}, {6.,
       1.7034792002698904`}, {6., 1.7015993114636898`}, {6.,
       1.7010188937435042`}, {6., 1.663549409787716}, {6.,
       1.5675326696962373`}, {6., 1.5675208795652722`}, {6.,
       1.5159203801451875`}, {6., 1.5147523491474328`}, {6.,
       1.5146507738609338`}, {6., 1.5143597242786546`}, {
       6., -0.006301285632983541}}]},
{RGBColor[0.24, 0.5939180232054561, 0.6], PointSize[Medium],
      PointBox[{{6.5, 3.8530422044088097`}, {6.5, 3.853042204059054}, {6.5,
       2.280592085852215}, {6.5, 1.8482415440985727`}, {6.5,
       1.7680347516816388`}, {6.5, 1.7680183310358373`}, {6.5,
       1.6573163497392631`}, {6.5, 1.6572978719415319`}, {6.5,
       1.6252075307887146`}, {6.5, 1.583609212182903}, {6.5,
       1.5835686362063222`}, {6.5, 1.5835127442245052`}, {6.5,
       1.570350305947889}, {6.5, 1.5703430348907992`}}]},
{RGBColor[0.3959888081940937, 0.24, 0.6], PointSize[Medium],
      PointBox[{{7., 3.61996414530424}, {7., 3.619964143511287}, {7.,
       1.8993998881332494`}, {7., 1.898979070830502}, {7.,
       1.8953742597424905`}, {7., 1.8446757685157853`}, {7.,
       1.7212222708951668`}, {7., 1.721185384828792}, {7.,
       1.650799128507456}, {7., 1.6479312388533143`}, {7.,
       1.6416035840161947`}, {7., 1.6415751025422618`}, {7.,
       1.624274932457951}, {7., 1.6242139078033886`}, {
       7., -0.008682488123821561}}]},
{RGBColor[0.6, 0.24, 0.2941043604063603], PointSize[Medium],
      PointBox[{{7.5, 4.365048302678756}, {7.5, 4.365048300458473}, {7.5,
       2.5582440474036434`}, {7.5, 2.0509522717955337`}, {7.5,
       1.9534434507803229`}, {7.5, 1.9534296731634784`}, {7.5,
       1.8139023107704875`}, {7.5, 1.813898015581642}, {7.5,
       1.7682244094312753`}, {7.5, 1.7120859975498444`}, {7.5,
       1.711564056626877}, {7.5, 1.7110261759038654`}, {7.5,
       1.6911766338870085`}, {7.5, 1.6909030140000503`}, {7.5,
       1.6826275882172983`}, {7.5, 1.6772038146376556`}}]},
{RGBColor[0.5041975290068142, 0.6, 0.24], PointSize[Medium],
      PointBox[{{8., 4.096902689781023}, {8., 4.096902689758382}, {8.,
       2.0940958386332422`}, {8., 2.0940956479778023`}, {8.,
       2.0940603545459457`}, {8., 2.0259991072853625`}, {8.,
       1.874638514993312}, {8., 1.874552356113797}, {8., 1.779611479740081}, {
       8., 1.7740332878840188`}, {8., 1.77219909761849}, {8.,
       1.7712956803504014`}, {8., 1.7434543024869567`}, {8.,
       1.7429871827257846`}, {8., 1.7289466300633947`}, {8.,
       1.7289272986636737`}, {8., -0.011298372293114516`}}]},
{RGBColor[0.24, 0.6, 0.48570930239273163`], PointSize[Medium],
      PointBox[{{8.5, 4.877734462874048}, {8.5, 4.8776884088618555`}, {8.5,
       2.8370811448541327`}, {8.5, 2.252691659906132}, {8.5,
       2.1394708643603018`}, {8.5, 2.1389183437870254`}, {8.5,
       1.9706397217070053`}, {8.5, 1.9705160123938417`}, {8.5,
       1.9102693441740017`}, {8.5, 1.8425657378896554`}, {8.5,
       1.8386835805231676`}, {8.5, 1.83716324666848}, {8.5,
       1.8055423652534741`}, {8.5, 1.803137963437925}, {8.5,
       1.8030942858701398`}, {8.5, 1.7854811060885267`}, {8.5,
       1.7841862741962375`}, {8.5, 1.7836495136132833`}}]},
{RGBColor[0.2756161337922777, 0.24, 0.6], PointSize[Medium],
      PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBmIQDQFKDsbGvzXTfIQcYPxZM9fea9BH8NPS0mrurmdE
4qsJRKxG8I2Nvz/vmIXgMzA8eRlZicyfUMnBgeDPmnnQdE0CAxJ/5rF2xv/2
CPMWr7a88A/OT0tbt8w8E8GfNbPzkrIzgs/A4PFY0QpZvrG5gw+ZX6gn9OAv
nH/2zJ3YQ0l/kew7/K47Bpm/2vxzBIJ/Sb9/WoLpYnsA+L1MkA==
"]]},
{RGBColor[0.6, 0.24, 0.4144770348081764], PointSize[Medium],
      PointBox[CompressedData["
1:eJxTTMoPSmViYGAQAWIQDQHKDidfuqUnTxB1gPEFGh+/S0Ti/7+6ZV/pew44
f+tCtxMSi5jhfAmnVxt/zmKC84vCGHIFZyL4ims+bVJmYYTzNS1yMy/+ZYDz
fy3hf7+rCMF3za7/NWvhf3sYv9uHKyMjGcG/1vdW7lwsgp/DMENy7/p/cP7a
tCipkAUI/mTpNWe/z0TwlRTnsp9zRfCVf16e1uuC4IfUP2v+ZYLgM8ztsqhE
4l+43Sl/R/mfPQDZ0la4
"]]},
{RGBColor[0.6, 0.5754297965913696, 0.24], PointSize[Medium],
      PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQEqDkVrSzyszUQcYHz/bRfckPnGLVcvJn5nhvOP
ZmUnON9D8F9l3W0zuoPgs6TsaKmSRfCXG29bkVXCiNB/jWUbMxKftSKgKN2V
Ac7PXxF6q9QJwX+X4VvzygbB7yva8rpMF8F//aq10n/ef3sYf+vU0HORcxF8
7/mGqk9lEfysI/e4GCQRfPti7qyAj//g/ImHu/ezI/FrrN5NMb2I4AsfEJ8k
hsQ3E7F5srx74n4ATKdVMQ==
"]]}}, {}},
AspectRatio->0.6180339887498948,
Axes->True,
AxesLabel->{
FormBox["j0", TraditionalForm],
FormBox["\[Lambda]", TraditionalForm]},
AxesOrigin->{0, 0},
Method->{},
PlotRangeClipping->True]\)

0

\!\(\*
GraphicsBox[{{{},
{RGBColor[0.24720000000000017`, 0.24, 0.6], PointSize[Medium],
      PointBox[CompressedData["
1:eJxTTMoPSmViYGAQAWIQDQEP7P/y9WSnHv1gD+F/sOdZ/ftDQP9HKP+HvYjo
2lsHdv6F8hkcXi1sLOBe/AfKZ3EI9itnVtvJ4gDhczicSfOTbdnMDOXzODim
Xz0l2MUF5Qs4hBy5XnhDnBPKF3I4873JW1FPAMoXcZjxpl/tfwMflC/mwGob
9mOehDCUL+GwvZrvufp3QShfyqFybbd7MYsYlC/j4DrRt7t2vQiUL+dwVGyb
TuFHCShfweGR37MPepniUL6iwxJxj/2596WhfCWH+V/Wr/yvLAXlKzv0Fq27
43JODspXcYiSaUo/dF/GAQAYHlLX
"]]}, {}}, {{}, {},
{RGBColor[1, 0, 0], LineBox[CompressedData["
1:eJxFz2lI0wEYBvDZtGLOcFqmqdt/Ji7nkX4IMvJIg8yLTJcw6djUzfJKcWBq
ZabpEG3V8GQMNQ0RZ8YM7FimpnktdGXRjMQ5RFPQ1tKptQryfV94ePh9e14m
P+tsyg4SiRT9N/9adoO/0z+5Ioj0/wY0RFQCcTl42+ZB1W2CuAaW9VYyrAgx
OD1QlLHGqANrNlOlK4w28C7tLGuZ0QNuHJFnf2MMgxWdYm2672ewMHiibilH
B87Ue+qUigUwhVnC+np0BVxlO8puvGQA87Xxr8hjP8HZb0r4WawNcNdVapzj
6V+4pyBt0S+BFLLtYvlW7I8lCzBJMxPyIp8M9sgV5MWzrcBzxppz1i93giP0
V67fz94NjpmTeNHpFPBiP7/obYc12Jc25Rp20QZMCTbypg17wKeWuWtuHFvw
p75kC643DdxdPnCBMKIFVqIZtdoOnJRT0E2ttwcfFnqpo3h7we/svK1FAfvA
zxXFDd5kB3CBBfvM2Bc0ZTo/PFO5H6xvZUrlhY5g6SEnyx6OE1hSLxjiEQfA
XOl5NXUevX6yxSRXOYN1+tC8vjIXcFOgv/M4zxXcUSqiCX3o4DJOUiTZiD4y
3dhWNs4A13o2dIxHEuCbvZW1kT3oaGdOy4g7E3wicyiRJkbLXfjuY0a0e/+j
6phEN/zPp489qUILDJYTw+yDYH7Xd0J8F51eHLcVcQ8tilN+pD5AlxtFVZJq
tCLAtFkjQ5tem6da29GSSWrlwBC6vjkj9c4wujlXHRY+in7qINkYVaOnufap
mg9ols4pbFaH9lPm0x/q0cdKtaaUeXQUS/Z4YRGdk0bQV1fRhcdvmZ4Y0KU2
s+9zjejazuaK9XV0U5Gl8NkGuj02JbRwC610G3QN+o1WGTxMZjP6DwbEFmI=

"]]}}},
AspectRatio->0.6180339887498948,
Axes->True,
AxesLabel->{None, None},
AxesOrigin->{0, 0},
Method->{},
PlotRangeClipping->True]\)









