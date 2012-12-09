
import phdfig;

texpreamble("
  \def\displ{z}\def\faceCub{b}\def\lengthCub{a}
");

size(4cm);

real a = 0.6, b = 1, d = 1.5;
real as = 4pt;

real tmpL;
pair tmpa,tmpb,tmpc,tmpd,tmpSE,tmpNE,tmpSW,tmpNW ;

// base magnet

magnet2d(b,a,(0,0),90);
drawground(width=b,origin=(0,-a/2),wlen=0.1);

// float magnet

magnet2d(b,a,(0,d),-90);

// directions

pair tmpa = (b/2+0.05,a/2);
draw(tmpa--tmpa+(0.25,0));
draw(tmpa+(0.25,0)--tmpa+(0.25,d-a),Arrow(size=as),L="$\displ$",align=NE);

tmpa = (0,d+a/2+0.05);
draw(tmpa--tmpa+(0,0.4),Arrow(size=as),L="$F$",align=NE);

// labels

tmpa = (0,d-a/2-0.2);
draw(tmpa-(b/2,0)--tmpa+(b/2,0),Arrows(size=as),L="$\faceCub$",align=S);

tmpa = (-b/2-0.2,d);
draw(tmpa-(0,a/2)--tmpa+(0,a/2),Arrows(size=as),L="$\lengthCub$",align=W);
