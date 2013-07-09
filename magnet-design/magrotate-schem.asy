
import phdfig;

texpreamble("
\providecommand\magnetGap{G}
\providecommand\springDepth{d}
\providecommand\lengthCube{c}
\providecommand\leverArm{l}
");

size(6cm);

real as = 4pt; // arrowheads

pair z;
path p;

real w1 = 5, w2 = 15;
real d1 = 10, d2 = 10;
real s1 = 4, s2 = 3;
real g = 5, g2 = 5;


// real laxis = 5;
// draw( (laxis,0) -- (0,0) -- (0,laxis) , Arrows);
// label("$x$",(laxis,0),align=SE);
// label("$y$",(0,laxis),align=NW);

draw( (0, d2+w1) -- (0, -w1) , dashdotted);
draw( (-w1,0) -- (w1+w2+s2/2, 0) , dashdotted);

draw( (0, d2) -- ( w2+s2/2, d2) -- (w2+s2/2, 0) );


magnet2d(s1,s1,dist=(w1 , d1-s1/2), 90);
magnet2d(s1,s1,(w1 , d1+g+s1/2), 90);
drawground(width=s1,origin=( w1,d1+g+s1),wlen=1,angle=180);

magnet2d(s2,s2,( w2, d2-s2/2), 90);
magnet2d(s2,s2,( w2, d2+g+s2/2),-90);
drawground(width=s2,origin=( w2,  d2+g+s2),wlen=1,angle=180,whiskers=7);

// widths

z = (0,-2);
p = (0,0) -- (w1,0);
draw( shift(z)*p , Arrows(size=as) , L="$\leverArm_1$", align=S);

z = (0,-4.5);
p = (0,0) -- (w2,0);
draw( shift(z)*p , Arrows(size=as) , L="$\leverArm_2$", align=S);

// heights

z = (-2,0);
p = (0,0) -- (0,d1);
draw( shift(z)*p , Arrows(size=as) , L="$\springDepth$", align=W);

z = (-2,d1);
p = (0,0) -- (0,g);
draw( shift(z)*p , Arrows(size=as) , L="$\magnetGap$", align=W);

// msizes

z = (w1-s1/2,d1-s1-1);
p = (0,0) -- (s1,0);
draw( shift(z)*p , Arrows(size=as) , L="$\lengthCube_1$", align=S);

z = (w2-s2/2,d2-s2-1);
p = (0,0) -- (s2,0);
draw( shift(z)*p , Arrows(size=as) , L="$\lengthCube_2$", align=S);

z = (w1+s1/2+1,d1-s1);
p = (0,0) -- (0,s1);
draw( shift(z)*p , Arrows(size=as) , L="$\lengthCube_1$", align=E);

z = (w2+s2/2+1,d2-s2);
p = (0,0) -- (0,s2);
draw( shift(z)*p , Arrows(size=as) , L="$\lengthCube_2$", align=E);


// axes

pair aoff = (-8,-5);
real xx = 3;
real zz = 3;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt));
label("$\ax$",aoff+(xx,0),SE);
label("$\ay$",aoff+(0,zz),NE);
