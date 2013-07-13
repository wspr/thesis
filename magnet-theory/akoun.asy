
import phdfig;
settings.prc=false;
settings.render=0;

texpreamble("
\providecommand\hwxX{a}
\providecommand\hwyX{b}
\providecommand\hwzX{c}
\providecommand\hwxF{A}
\providecommand\hwyF{B}
\providecommand\hwzF{C}
\providecommand\cdx{x}
\providecommand\cdy{y}
\providecommand\cdz{z}
\providecommand\inlinevect[1]{[#1]}
");

size(8cm,0);
currentprojection=orthographic((2,2,2),up=(0,0,1));

// axes
real X1=-1, X2=4, Y1=-1, Y2=4, Z1=-1, Z2=4;
triple axisoffset=(-10,2,8);
draw(shift(axisoffset)*((X1,0,0)--(X2,0,0)),Arrow3);
draw(shift(axisoffset)*((0,Y1,0)--(0,Y2,0)),Arrow3);
draw(shift(axisoffset)*((0,0,Z1)--(0,0,Z2)),Arrow3);
label("$\ax$",project(shift(axisoffset)*(X2,0,0)),W);
label("$\ay$",project(shift(axisoffset)*(0,Y2,0)),E);
label("$\az$",project(shift(axisoffset)*(0,0,Z2)),1.5E);


// first magnet
real a=3,b=4,c=5;
triple m=(a,b,c);
draw((-a,0,0)--(a,0,0),gray);
draw((0,-b,0)--(0,b,0),gray);
draw((0,0,-c)--(0,0,c),gray);
drawcube(m);
label(L="\vbox{\hbox{Fixed}\hbox{magnet}}",project((-a,-b,c)),2N+W);

// second magnet
real A=3.5, B=2.5, C=4.5;
triple M=(A,B,C);
triple gap=(-15,12,5);
draw(shift(gap)*((-a,0,0)--(a,0,0)),gray);
draw(shift(gap)*((0,-b,0)--(0,b,0)),gray);
draw(shift(gap)*((0,0,-c)--(0,0,c)),gray);
drawcube(M,gap);
label(L="\vbox{\hbox{Floating}\hbox{magnet}}",project((shift(gap)*(-A,-B,C))),2N);

// offset
//draw(box((0,0,0),gap),gray);
//draw(shift((gap.x/2,0,0))*((0,0,0)--(0,gap.y,0)),Arrows);
//draw(shift((gap.x/2,0,0))*((0,0,0)--(0,0,gap.z)),Arrows);
//draw(shift((0,gap.y/2,gap.z))*((0,0,0)--(gap.x,0,0)),Arrows);

draw((0,0,0)--gap,Arrow3);
label(L="$\inlinevect{\cdx,\cdy,\cdz}$",project((2*gap/3)),NW);

// labels
real oo = 1;
path3 p1, p2, p3;
p1 = shift(0,b+oo,-c)*((a,0,0)--(-a,0,0));
p2 = shift(a+oo,0,-c)*((0,b,0)--(0,-b,0));
p3 = shift(a,-b-oo,0)*((0,0,c)--(0,0,-c));
draw(p1,arrow=Arrows3(size=4pt));
draw(p2,Arrows3(size=4pt));
draw(p3,Arrows3(size=4pt));
label(L="$2\hwxX$",project((midpoint(p1))),SE);
label(L="$2\hwyX$",project((midpoint(p2))),SW);
label(L="$2\hwzX$",project((midpoint(p3))),W);

p1 = shift(gap)*shift(0,B+oo,-C)*((A,0,0)--(-A,0,0));
p2 = shift(gap)*shift(A+oo,0,-C)*((0,B,0)--(0,-B,0));
p3 = shift(gap)*shift(-A-oo,B,0)*((0,0,C)--(0,0,-C));
draw(p1,Arrows3(size=4pt));
draw(p2,Arrows3(size=4pt));
draw(p3,Arrows3(size=4pt));
label(L="$2\hwxF$",project((midpoint(p1))),SE);
label(L="$2\hwyF$",project((midpoint(p2))),SW);
label(L="$2\hwzF$",project((midpoint(p3))),E);
