︠21dd6dd6-0308-452f-848d-d73c84cf39c7︠














# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 20:05:11 2014

@author: David Horgan
"""

from scipy.optimize import fsolve
import math

@interact
def _(X=range_slider(-1,1,default=(-1,0.6), label='x value'),Y=range_slider(-1,1,default=(-1,0.7), label='y value') ):








    #input points from unit circle
  if X[1]^2+Y[1]^2<=1:
    p1=X[1]
    p2=Y[1]
    #face1
    a1=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
    a2=(((1 - p2**2)/(2*(1 + p1)))**(1/4),  (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0 )
    a3=(((1/2)*( (1 + p1)**3)* (1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
    a=[a1,a2,a3]

    #face2
    b1=(0, 0, 0)
    b2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
    b3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1-p1**2)*((1-p2**2)/(2*(1+p1)))**(1/4)  )
    b=[b1,b2,b3]

    #face3
    c1=(0, 0, 0)
    c2=( ((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
    c3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4), p2*((2*(1 + p1))/(1 - p2**2))**(1/4),  sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
    c=[c1,c2,c3]
    #face4
    d1=(0, 0, 0)
    d2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
    d3 =(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
    d=[d1,d2,d3]
    #printresults

    print  'x=', X[1]
    print  'y=', Y[1]
    print 'p1=', p1
    print 'p2=', p2
    print 'a1=', a1
    print 'a2=', a2
    print 'a3=', a3
    print 'b1=', b1
    print 'b2=', b2
    print 'b3=', b3
    print 'c1=', c1
    print 'c2=', c2
    print 'c3=', c3
    print 'd1=', d1
    print 'd2=', d2
    print 'd3=', d3


    G = Graphics()

    #tetrahedron faces - coloured
    P1=polygon([a1,a2, a3], color='red')
    P2=polygon([b1,b2, b3],color='yellow')
    P3=polygon([c1,c2, c3],color='blue')
    P4=polygon([d1,d2, d3],color='green')
    g=G+P1+P2+P3+P4
    show(g, title='tet(w)')
    txt=text((numerical_approx(X[1], digits=2),numerical_approx(Y[1], digits=2)), (X[1]+0.1,Y[1]+0.1))
    show(circle((0,0), 1) + point([(X[1],Y[1])])+txt, aspect_ratio=1, title='w plane')



︡227092b5-93cd-4dc9-b547-07ddbe0d95ba︡{"stdout":"'\\nCreated on Mon Feb 10 20:05:11 2014\\n\\n@author: David Horgan\\n'\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["X",12,null]],[["Y",12,null]],[["",12,null]]],"id":"9687e4bf-5b53-4d7a-bc81-31774f99fc15","controls":[{"control_type":"range-slider","default":[0,400],"var":"X","width":null,"vals":["-1.0","-0.996","-0.992","-0.988","-0.984","-0.98","-0.976","-0.972","-0.968","-0.964","-0.96","-0.956","-0.952","-0.948","-0.944","-0.94","-0.936","-0.932","-0.928","-0.924","-0.92","-0.916","-0.912","-0.908","-0.904","-0.9","-0.896","-0.892","-0.888","-0.884","-0.88","-0.876","-0.872","-0.868","-0.864","-0.86","-0.856","-0.852","-0.848","-0.844","-0.84","-0.836","-0.832","-0.828","-0.824","-0.82","-0.816","-0.812","-0.808","-0.804","-0.8","-0.796","-0.792","-0.788","-0.784","-0.78","-0.776","-0.772","-0.768","-0.764","-0.76","-0.756","-0.752","-0.748","-0.744","-0.74","-0.736","-0.732","-0.728","-0.724","-0.72","-0.716","-0.712","-0.708","-0.704","-0.7","-0.696","-0.692","-0.688","-0.684","-0.68","-0.676","-0.672","-0.668","-0.664","-0.66","-0.656","-0.652","-0.648","-0.644","-0.64","-0.636","-0.632","-0.628","-0.624","-0.62","-0.616","-0.612","-0.608","-0.604","-0.6","-0.596","-0.592","-0.588","-0.584","-0.58","-0.576","-0.572","-0.568","-0.564","-0.56","-0.556","-0.552","-0.548","-0.544","-0.54","-0.536","-0.532","-0.528","-0.524","-0.52","-0.516","-0.512","-0.508","-0.504","-0.5","-0.496","-0.492","-0.488","-0.484","-0.48","-0.476","-0.472","-0.468","-0.464","-0.46","-0.456","-0.452","-0.448","-0.444","-0.44","-0.436","-0.432","-0.428","-0.424","-0.42","-0.416","-0.412","-0.408","-0.404","-0.4","-0.396","-0.392","-0.388","-0.384","-0.38","-0.376","-0.372","-0.368","-0.364","-0.36","-0.356","-0.352","-0.348","-0.344","-0.34","-0.336","-0.332","-0.328","-0.324","-0.32","-0.316","-0.312","-0.308","-0.304","-0.3","-0.296","-0.292","-0.288","-0.284","-0.28","-0.276","-0.272","-0.268","-0.264","-0.26","-0.256","-0.252","-0.248","-0.244","-0.24","-0.236","-0.232","-0.228","-0.224","-0.22","-0.216","-0.212","-0.208","-0.204","-0.2","-0.196","-0.192","-0.188","-0.184","-0.18","-0.176","-0.172","-0.168","-0.164","-0.16","-0.156","-0.152","-0.148","-0.144","-0.14","-0.136","-0.132","-0.128","-0.124","-0.12","-0.116","-0.112","-0.108","-0.104","-0.1","-0.096","-0.092","-0.088","-0.084","-0.08","-0.076","-0.072","-0.068","-0.064","-0.06","-0.056","-0.052","-0.048","-0.044","-0.04","-0.036","-0.032","-0.028","-0.024","-0.02","-0.016","-0.012","-0.008","-0.004","8.60422844084e-16","0.004","0.008","0.012","0.016","0.02","0.024","0.028","0.032","0.036","0.04","0.044","0.048","0.052","0.056","0.06","0.064","0.068","0.072","0.076","0.08","0.084","0.088","0.092","0.096","0.1","0.104","0.108","0.112","0.116","0.12","0.124","0.128","0.132","0.136","0.14","0.144","0.148","0.152","0.156","0.16","0.164","0.168","0.172","0.176","0.18","0.184","0.188","0.192","0.196","0.2","0.204","0.208","0.212","0.216","0.22","0.224","0.228","0.232","0.236","0.24","0.244","0.248","0.252","0.256","0.26","0.264","0.268","0.272","0.276","0.28","0.284","0.288","0.292","0.296","0.3","0.304","0.308","0.312","0.316","0.32","0.324","0.328","0.332","0.336","0.34","0.344","0.348","0.352","0.356","0.36","0.364","0.368","0.372","0.376","0.38","0.384","0.388","0.392","0.396","0.4","0.404","0.408","0.412","0.416","0.42","0.424","0.428","0.432","0.436","0.44","0.444","0.448","0.452","0.456","0.46","0.464","0.468","0.472","0.476","0.48","0.484","0.488","0.492","0.496","0.5","0.504","0.508","0.512","0.516","0.52","0.524","0.528","0.532","0.536","0.54","0.544","0.548","0.552","0.556","0.56","0.564","0.568","0.572","0.576","0.58","0.584","0.588","0.592","0.596","0.6","0.604","0.608","0.612","0.616","0.62","0.624","0.628","0.632","0.636","0.64","0.644","0.648","0.652","0.656","0.66","0.664","0.668","0.672","0.676","0.68","0.684","0.688","0.692","0.696","0.7","0.704","0.708","0.712","0.716","0.72","0.724","0.728","0.732","0.736","0.74","0.744","0.748","0.752","0.756","0.76","0.764","0.768","0.772","0.776","0.78","0.784","0.788","0.792","0.796","0.8","0.804","0.808","0.812","0.816","0.82","0.824","0.828","0.832","0.836","0.84","0.844","0.848","0.852","0.856","0.86","0.864","0.868","0.872","0.876","0.88","0.884","0.888","0.892","0.896","0.9","0.904","0.908","0.912","0.916","0.92","0.924","0.928","0.932","0.936","0.94","0.944","0.948","0.952","0.956","0.96","0.964","0.968","0.972","0.976","0.98","0.984","0.988","0.992","0.996","1.0"],"animate":true,"label":"x value","display_value":true},{"control_type":"range-slider","default":[0,425],"var":"Y","width":null,"vals":["-1.0","-0.996","-0.992","-0.988","-0.984","-0.98","-0.976","-0.972","-0.968","-0.964","-0.96","-0.956","-0.952","-0.948","-0.944","-0.94","-0.936","-0.932","-0.928","-0.924","-0.92","-0.916","-0.912","-0.908","-0.904","-0.9","-0.896","-0.892","-0.888","-0.884","-0.88","-0.876","-0.872","-0.868","-0.864","-0.86","-0.856","-0.852","-0.848","-0.844","-0.84","-0.836","-0.832","-0.828","-0.824","-0.82","-0.816","-0.812","-0.808","-0.804","-0.8","-0.796","-0.792","-0.788","-0.784","-0.78","-0.776","-0.772","-0.768","-0.764","-0.76","-0.756","-0.752","-0.748","-0.744","-0.74","-0.736","-0.732","-0.728","-0.724","-0.72","-0.716","-0.712","-0.708","-0.704","-0.7","-0.696","-0.692","-0.688","-0.684","-0.68","-0.676","-0.672","-0.668","-0.664","-0.66","-0.656","-0.652","-0.648","-0.644","-0.64","-0.636","-0.632","-0.628","-0.624","-0.62","-0.616","-0.612","-0.608","-0.604","-0.6","-0.596","-0.592","-0.588","-0.584","-0.58","-0.576","-0.572","-0.568","-0.564","-0.56","-0.556","-0.552","-0.548","-0.544","-0.54","-0.536","-0.532","-0.528","-0.524","-0.52","-0.516","-0.512","-0.508","-0.504","-0.5","-0.496","-0.492","-0.488","-0.484","-0.48","-0.476","-0.472","-0.468","-0.464","-0.46","-0.456","-0.452","-0.448","-0.444","-0.44","-0.436","-0.432","-0.428","-0.424","-0.42","-0.416","-0.412","-0.408","-0.404","-0.4","-0.396","-0.392","-0.388","-0.384","-0.38","-0.376","-0.372","-0.368","-0.364","-0.36","-0.356","-0.352","-0.348","-0.344","-0.34","-0.336","-0.332","-0.328","-0.324","-0.32","-0.316","-0.312","-0.308","-0.304","-0.3","-0.296","-0.292","-0.288","-0.284","-0.28","-0.276","-0.272","-0.268","-0.264","-0.26","-0.256","-0.252","-0.248","-0.244","-0.24","-0.236","-0.232","-0.228","-0.224","-0.22","-0.216","-0.212","-0.208","-0.204","-0.2","-0.196","-0.192","-0.188","-0.184","-0.18","-0.176","-0.172","-0.168","-0.164","-0.16","-0.156","-0.152","-0.148","-0.144","-0.14","-0.136","-0.132","-0.128","-0.124","-0.12","-0.116","-0.112","-0.108","-0.104","-0.1","-0.096","-0.092","-0.088","-0.084","-0.08","-0.076","-0.072","-0.068","-0.064","-0.06","-0.056","-0.052","-0.048","-0.044","-0.04","-0.036","-0.032","-0.028","-0.024","-0.02","-0.016","-0.012","-0.008","-0.004","8.60422844084e-16","0.004","0.008","0.012","0.016","0.02","0.024","0.028","0.032","0.036","0.04","0.044","0.048","0.052","0.056","0.06","0.064","0.068","0.072","0.076","0.08","0.084","0.088","0.092","0.096","0.1","0.104","0.108","0.112","0.116","0.12","0.124","0.128","0.132","0.136","0.14","0.144","0.148","0.152","0.156","0.16","0.164","0.168","0.172","0.176","0.18","0.184","0.188","0.192","0.196","0.2","0.204","0.208","0.212","0.216","0.22","0.224","0.228","0.232","0.236","0.24","0.244","0.248","0.252","0.256","0.26","0.264","0.268","0.272","0.276","0.28","0.284","0.288","0.292","0.296","0.3","0.304","0.308","0.312","0.316","0.32","0.324","0.328","0.332","0.336","0.34","0.344","0.348","0.352","0.356","0.36","0.364","0.368","0.372","0.376","0.38","0.384","0.388","0.392","0.396","0.4","0.404","0.408","0.412","0.416","0.42","0.424","0.428","0.432","0.436","0.44","0.444","0.448","0.452","0.456","0.46","0.464","0.468","0.472","0.476","0.48","0.484","0.488","0.492","0.496","0.5","0.504","0.508","0.512","0.516","0.52","0.524","0.528","0.532","0.536","0.54","0.544","0.548","0.552","0.556","0.56","0.564","0.568","0.572","0.576","0.58","0.584","0.588","0.592","0.596","0.6","0.604","0.608","0.612","0.616","0.62","0.624","0.628","0.632","0.636","0.64","0.644","0.648","0.652","0.656","0.66","0.664","0.668","0.672","0.676","0.68","0.684","0.688","0.692","0.696","0.7","0.704","0.708","0.712","0.716","0.72","0.724","0.728","0.732","0.736","0.74","0.744","0.748","0.752","0.756","0.76","0.764","0.768","0.772","0.776","0.78","0.784","0.788","0.792","0.796","0.8","0.804","0.808","0.812","0.816","0.82","0.824","0.828","0.832","0.836","0.84","0.844","0.848","0.852","0.856","0.86","0.864","0.868","0.872","0.876","0.88","0.884","0.888","0.892","0.896","0.9","0.904","0.908","0.912","0.916","0.92","0.924","0.928","0.932","0.936","0.94","0.944","0.948","0.952","0.956","0.96","0.964","0.968","0.972","0.976","0.98","0.984","0.988","0.992","0.996","1.0"],"animate":true,"label":"y value","display_value":true}]}}︡
︠a797d73d-24df-41a3-9f0d-51b812c9a368︠
︡89cc8129-d2ad-418c-96f4-b9e416ab97d3︡
︠e6397c31-75b2-466a-930e-abeda2d6b22f︠
︡50d8eec4-2bd9-44a4-a8f3-54f33f7b7016︡
︠8f8136f0-cc2e-45d4-b292-cee69a140d7f︠









