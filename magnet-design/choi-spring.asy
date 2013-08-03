
import phdfig;

texpreamble("
\providecommand\forceVec{\mathbf F}
\providecommand\dispvert{z}
\providecommand\choiGap{l}
");

unitsize(1cm);

real a= 1, b=a, d = 2.5, g = 0.75;
real as = 4pt;

real tmpL;
pair tmpa,tmpb,tmpc,tmpd,tmpSE,tmpNE,tmpSW,tmpNW ;

// base magnets

magnet2d(a,a,(g/2+a/2,0),90);
drawground(width=b,origin=(g/2+a/2,-a/2),wlen=0.2);

magnet2d(a,a,(-g/2-a/2,0),90);
drawground(width=b,origin=(-g/2-a/2,-a/2),wlen=0.2);

// floating magnet

magnet2d(a,a,(0,d),-90);

// dimensions

pair tmpa = (a+g/2+0.1,a/2);
draw(tmpa--tmpa+(0,d-2a),Arrow(size=as),L="$\az$",align=4N);
draw(tmpa--tmpa+(d-2a,0),Arrow(size=as),L="$\ax$",align=4E);

tmpa = (0,d+a/2+0.1);
draw(tmpa--tmpa+(0,0.6),Arrow(size=2as),L=Label(L="$\forceVec$",position=EndPoint),align=NE);

draw( (-g/2 ,a/2+0.1) -- (g/2, a/2+0.1) , Arrows(size=as),L="$\choiGap$",align=N);

real X = 0.4;
draw( (-g/2-a-2X,0)--(-g/2-a,0) , p=dashed );
draw( (-g/2-a-2X,d)--(-a/2,d) , p=dashed );
draw( (-g/2-a-X,0)--(-g/2-a-X,d) , Arrow(size=as) , L="$\dispvert$", align=W);
