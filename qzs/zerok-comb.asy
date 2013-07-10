
import phdfig;

size(5cm,5cm);

real m=1;
pair mx=(m,0);
pair my=(0,m);
pair fixb=(0,0);
pair fixu=(0,4);
pair fleq=(0,2.75);
pair xo;
pair xoo=(-0.5,0);
pair out=(0.5,0);
real l=0.2;
real f=1.2, fd=1;
pair[] z=new pair[8];
pair[] k;

texpreamble("
\providecommand\dispBase{y}
\providecommand\dispMass{x}
\providecommand\nforceZ{f_z(d,h)}
\providecommand\heq{h_{eq}}
\providecommand\feq{f_{eq}}
\providecommand\ngap{d}
\providecommand\mdim{a}
\providecommand\ndispZ{h}
\providecommand\dmax{\delta}
");

// frame
z[1] = (m/2,-m/2)+(l,0);
z[2] = z[1]-(0,l);
z[3] = z[2]-(l+m+l,0)-(f,0);
z[4] = z[3]+(0,l)+fixu+(0,m+l);
z[5] = (z[1].x,z[4].y);
z[6] = z[5]-(0,l);
z[7] = (z[3].x+l, z[6].y);
z[8] = (z[7].x, z[1].y);
draw(z[1]--z[2]--z[3]--z[4]--z[5]--z[6]--z[7]--z[8]--cycle);

// middle
xo = (fixb+fixu)/2;
pair tmp=fd+xo+mx/2+out;
draw(xo-mx/2-out--tmp,grey+dashed);

// floating magnet
draw(fleq-mx/2--fleq-mx/2-out,grey+dashed);
magnet2d(m,m,fleq,-90);

// bottom magnet
draw(mx/2--fd+mx/2+out,grey+dashed);
magnet2d(m,m,fixb,90);

// top magnet
draw(fixu+mx/2--fd+fixu+mx/2+out,grey+dashed);
magnet2d(m,m,fixu,-90);

k[1] = (m/2,0)+fleq;
k[2] = k[1]+(0.4,0);
k[3] = k[2]+(0,0.4);
draw(k[1]--k[2]--k[3],Arrow(size=4));
label("$\dispMass$",k[3],E);

k[1] = (-m/2-l-f,0)+ (fixb+fixu)/2;
k[2] = k[1]-(0.4,0);
k[3] = k[2]+(0,0.4);
draw(k[1]--k[2]--k[3],Arrow(size=4));
label("$\dispBase$",k[3],W);

// a.d
f = 2;
draw(fd+mx/2+out/2--fd+mx/2+out/2+(0,(fixb.y+fixu.y)/2),Arrows(size=4pt));
draw(fd+mx/2+out/2+(0,(fixb.y+fixu.y)/2)--fd+mx/2+out/2+(0,fixu.y),Arrows(size=4pt));
label("$\mdim\ngap$",fd+mx/2+out/2+(0,fixu.y/4),E);
label("$\mdim\ngap$",fd+mx/2+out/2+(0,3*fixu.y/4),E);

// a.h
draw(shift(-mx/2-out/2)*(xo--fleq),Arrow(size=4pt));
label("$\mdim\ndispZ$",(-mx-out+fleq+xo)/2,W);

// a
draw(shift(-mx/2-out/2+fixb)*(-my/2--my/2),Arrows(size=4pt));
label("$\mdim$",-mx/2-out/2+fixb,W);
