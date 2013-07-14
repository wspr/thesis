settings.prc=false;
settings.render=0;

import phdfig;

texpreamble("\usepackage{minibox}");

currentprojection=orthographic((2,4,2),up=(0,0,1));

real u=0.2cm;

// first magnet
real a=4u,b=3u,c=5u;
triple m=(a,b,c);
drawcube(m);

dot((a,b,c),L="\tiny$(0,0,0)$",SE);
dot((-a,b,c),L="\tiny$(1,0,0)$",E);

dot((a,-b,c),L="\tiny$(0,1,0)$",W,gray);
dot((-a,-b,c),gray);
dot((a,b,-c),L="\tiny$(0,0,1)$",S,gray);
dot((-a,b,-c),L="\tiny$(1,0,1)$",SE,gray);
dot((a,-b,-c),L="\tiny$(0,1,1)$",SW,gray);
dot((-a,-b,-c),L="\tiny$(1,1,1)$",NW,gray);

// second magnet
real A=a, B=b, C=c;
triple M=(A,B,C);
triple gap=(0,0,3.5c);
drawcube(M,gap);


dot(gap+(a,b,c),L="\tiny$(0,0,0)$",NNE);
dot(gap+(-a,b,c),L="\tiny$(1,0,0)$",E);

dot(gap+(a,-b,c),L="\tiny$(0,1,0)$",W,gray);
dot(gap+(-a,-b,c),L="\tiny$(1,1,0)$",N,gray);
dot(gap+(a,b,-c),L="\tiny$(0,0,1)$",S,gray);
dot(gap+(-a,b,-c),L="\tiny$(1,0,1)$",SE,gray);
dot(gap+(a,-b,-c),L="\tiny$(0,1,1)$",SW,gray);
dot(gap+(-a,-b,-c),gray);

path3 p1, p2;
p1 = (a,b,c)--gap+(-a,b,c);
p2 = (-a,b,c)--gap+(a,b,c);
real t=0.03;

draw(relpoint(p1,t)--relpoint(p1,1-t),Arrow3(size=8),p=linewidth(1));
draw(relpoint(p2,t)--relpoint(p2,1-t),Arrow3(size=8),p=linewidth(1));


label(L="\minibox[r]{Fixed magnet\\ Nodes $(i,k,p)$}",project((a,-b,0)),3W);
label(L="\minibox[r]{Floating magnet\\ Nodes $(j,l,q)$}",project(gap+(a,-b,0)),3W);
