
import phdfig;

unitsize(1cm);

real m=1;
pair mx=(m,0);
pair my=(0,m);

pair hgap = (2.5,0);
pair vgap = (0,2.5);
pair arr = (1.5,0);
pair arrv = (0,-0.25);
pair v = (0,-0.5);

// side magnet
magnet2d(m,m, hgap,90);
drawground(width=m,wlen=0.2,origin= hgap-my/2,angle=0,whiskers=7);

magnet2d(m,m,-hgap,90);
drawground(width=m,wlen=0.2,origin=-hgap-my/2,angle=0,whiskers=7);

magnet2d(m,m,-vgap,90);
drawground(width=m,wlen=0.2,origin=-vgap-my/2,angle=0,whiskers=7);

magnet2d(m,m, vgap,-90);
drawground(width=m,wlen=0.2,origin= vgap+my/2,angle=180,whiskers=7);

// floating magnet
magnet2d(m,m,v,-90);

draw(-mx/2+v-- -arr+arrv, Arrow(size=6pt));
draw( mx/2+v--  arr+arrv, Arrow(size=6pt));
draw( my/2+v--  my/2+v+(0,1.2), Arrow(size=6pt));

real lbl = 1;
draw( hgap+vgap+(0,lbl) -- vgap+(0,lbl) , L="$l_x$", Arrows(size=4pt), align=N);
draw( -hgap+vgap+(0,lbl) -- vgap+(0,lbl) , L="$l_x$", Arrows(size=4pt), align=N);

draw( hgap+vgap+(lbl,0) -- hgap+(lbl,0) , L="$l_z$", Arrows(size=4pt), align=E);
draw( hgap-vgap+(lbl,0) -- hgap+(lbl,0) , L="$l_z$", Arrows(size=4pt), align=E);

// axes
pair aoff = -hgap-vgap;
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt));
label("$\ax$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);
