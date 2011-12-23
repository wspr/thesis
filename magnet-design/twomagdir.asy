
import phdfig;

size(5cm);

real a = 1, b = 1, d = 2.5;
real as = 4pt;

real tmpL;
pair tmpa,tmpb,tmpc,tmpd,tmpSE,tmpNE,tmpSW,tmpNW ;

// base magnet

magnet2d(b,a,(0,0),90);
drawground(width=b,origin=(0,-a/2),wlen=0.2);

// float magnets

magnet2d(b,a,(0,d),-90);
magnet2d(b,a,(d,0),+90);

// directions

pair tmpa = (-b/2-0.1,a/2);
draw(tmpa--tmpa+(-0.5,0));
draw(tmpa+(-0.25,0)--tmpa+(-0.25,d-a),Arrow(size=as),L="$z$",align=NE);

pair tmpa = (b/2,a/2+0.1);
draw(tmpa--tmpa+(0,0.5));
draw(tmpa+(0,0.25)--tmpa+(d-a,0.25),Arrow(size=as),L="$x$",align=NE);

tmpa = (0,d+a/2+0.1);
draw(tmpa--tmpa+(0,0.6),Arrow(size=2as),L="$F_z$",align=NE);

tmpa = (d+a/2+0.1,0);
draw(tmpa--tmpa+(0.6,0),Arrow(size=2as),L="$F_x$",align=E+S+SE);
