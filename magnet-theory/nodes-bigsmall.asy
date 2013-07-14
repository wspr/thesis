settings.prc=false;
settings.render=0;

import phdfig;

texpreamble("\usepackage{minibox}");

currentprojection=orthographic((2,4,2),up=(0,0,1));
real u = 0.15cm;

// first magnet
real a=4u,b=3u,c=5u;
triple m=(a,b,c);
drawcube(m);

dot((a,b,c),gray);
dot((-a,b,c),gray);
dot((a,-b,c),gray);
dot((-a,-b,c),gray);
dot((a,b,-c),gray);
dot((-a,b,-c),gray);
dot((a,-b,-c),gray);
dot((-a,-b,-c),gray);

// second magnet
real A=a, B=b, C=c;
triple M=(A,B,C);
triple gap=(0,0,4c);
drawcube(M,gap);

dot(gap+(a,b,c),gray);
dot(gap+(-a,b,c),gray);
dot(gap+(a,-b,c),gray);
dot(gap+(-a,-b,c),gray);
dot(gap+(a,b,-c),gray);
dot(gap+(-a,b,-c),gray);
dot(gap+(a,-b,-c),gray);
dot(gap+(-a,-b,-c),gray);


// third magnet
real A=3a, B=3b, C=c;
triple M3=(A,B,C);
triple gap=(0,0,4c);
drawcube(M3,gap);


dot(gap+(A,B,C),gray);
dot(gap+(-A,B,C),gray);
dot(gap+(A,-B,C),gray);
dot(gap+(-A,-B,C),gray);
dot(gap+(A,B,-C),gray);
dot(gap+(-A,B,-C),gray);
dot(gap+(A,-B,-C),gray);
dot(gap+(-A,-B,-C),gray);

path3 p1;
real t=0.07;
p1 = (-a,b,c)--gap+(-a,b,-c);
draw(relpoint(p1,t)--relpoint(p1,1-t),Arrow3(size=8),p=linewidth(1));

draw( (-a,b,c)--(-a,B,c)--(-A,B,c)--(-A,b,c)--cycle , dashed + gray );
draw( (-A,B,c)--gap+(-A,B,c) , dashed + gray );
draw( (-A,b,c)--gap+(-A,b,-c)--gap+(-a,b,-c) , dashed + gray );

real t=0.05;
p1 = (-a,b,c)--gap+(-A,B,-C);
draw(relpoint(p1,t)--relpoint(p1,1-t),Arrow3(size=8),p=linewidth(1));

draw( gap+(-a,b,-c)--gap+(-a,B,-c)--(-a,B,c) , dashed + gray );
