
import phdfig;

unitsize(1cm);

real m=1;
real A=0.8;

pair O = (0,0);
pair mx=(m,0);
pair my=(0,m);

pair hgap = (2.5,0);
pair vgap = (0,2.5);
pair arr = (1.5,0);
pair arrv = (0,-0.25);
pair v = (0,-0.5);

// lower magnet
magnet2d(m,m,-vgap,90);

// floating magnet
magnet2d(m,m,v,-90);

draw( shift(mx/2-my/2) * ( O -- mx ) , dashed );
draw( shift(-my/2-vgap) * ( O -- -my ) , dashed );

draw( shift(mx/2-my/2+mx/2) * ( O -- (0,A) ), Arrow(size=6pt),L="$z$");
draw( shift(-my/2-vgap-my/2) * ( O -- (A,0) ), Arrow(size=6pt),L="$p$");

// axes
pair aoff = -hgap+(0,-2);
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt));
label("$\ay$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);
