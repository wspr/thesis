
import phdfig;

texpreamble("
\providecommand\lengthCube{c}
\providecommand\magnetGap{G}
");

unitsize(1cm);

real m=1;
pair mx=(m,0);
pair my=(0,m);

pair hgap = (2.5,0);
pair arr = (1.5,0);
pair arrv = (0,-0.25);
pair v = (0,-0.5);

// side magnet
magnet2d(m,m, hgap,90);
magnet2d(m,m,-hgap,90);
drawground(width=m,wlen=0.2,origin= hgap-(0,m/2),angle=0,whiskers=7);
drawground(width=m,wlen=0.2,origin=-hgap-(0,m/2),angle=0,whiskers=7);

// floating magnet
magnet2d(m,m,v,-90);

draw(-mx/2+v-- -arr+arrv, Arrow(size=6pt));
draw( mx/2+v--  arr+arrv, Arrow(size=6pt));
draw( shift(0,0.75)*( -mx/2 -- mx/2 ) , Arrows(size=4pt) , L="$\lengthCube$" , align=N );
draw( shift(0,0.75)*( -mx/2 -- -hgap+mx/2 ) , Arrows(size=4pt) , L="$\magnetGap$" );

// axes
pair aoff = -hgap+(0,-2);
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt));
label("$\ax$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);
