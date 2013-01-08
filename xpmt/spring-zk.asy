
import phdfig;

texpreamble("
  \providecommand\OriginMagGap{x_g}
  \providecommand\DispMag{x}
  \providecommand\HeightMag{h}
");

unitsize(1cm);

real m=1;
pair mx=(m,0);
pair my=(0,m);

real M = 0;
real L = -1.5;
real U = 6;
real D = U/2 -1;
pair arr = (0,0.75);

pair fixb=(M,0);
pair fixu=(M,U);
pair fleq=(M,D);
pair xo;
pair xoo=(-0.5,0);
pair out=(0.5,0);

// middle
xo = (fixb+fixu)/2;

// floating magnet
magnet2d(m,m,fleq,-90);
draw(fleq+mx/2--fleq+mx/2+2*out,dashed);

// bottom magnet
magnet2d(m,m,fixb,90);
drawground(width=m,wlen=0.2,origin=fixb-my/2,whiskers=7);

// top magnet
magnet2d(m,m,fixu,-90);
drawground(width=m,wlen=0.2,origin=fixu+(0,m/2),angle=180,whiskers=7);

draw(shift(mx/2+out)*(fleq--xo),Arrows(size=4pt),L="$\DispMag$");
draw(shift(fixb+mx/2+out)*(-my/2--my/2),Arrows(size=4pt),L="$\HeightMag$");

//

draw(fixb-mx/2--fixb-mx/2-2*out,dashed);
draw(fixu-mx/2--fixu-mx/2-2*out,dashed);
draw(fixb/2+fixu/2-mx/2-2*out--fixb/2+fixu/2+mx/2+2*out,dashed);

draw(fixb-mx/2-out -- fixu/2+fixb/2-mx/2-out,Arrows(size=4pt), L="$\OriginMagGap$", align=W);
draw(fixu-mx/2-out -- fixu/2+fixb/2-mx/2-out,Arrows(size=4pt), L="$\OriginMagGap$", align=W);

