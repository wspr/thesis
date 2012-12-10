
import phdfig;

unitsize(1cm);

real m=1;
pair mx=(m,0);
pair my=(0,m);

pair hgap = (2.5,0);
pair vgap = (0,3);
pair arr = (1.2,0);
pair v = (0,-0.5);

// axes
pair aoff = -hgap-vgap;
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt));
label("$\ax$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);

aoff = aoff+(0,1.5);
draw( shift(aoff)*( scale(1/5)*( (1,-1)..(-1,-1)..(-1,1)..(1,1) ) ), Arrow );
label("+",aoff);

// base magnet
magnet2d(m,m,-vgap,90);
drawground(width=m,wlen=0.2,origin=-vgap-my/2,angle=0,whiskers=7);

// floating magnet
magnet2d(m,m,v,-90);

draw( my/2+v--  my/2+v+(0,1.2), Arrow,L="$F_m$",align=W+NW);
draw( -my/2+v--  -my/2+v-(0,1.2), Arrow,L="$F_g$",align=W+SW);

draw( shift( (0.2,0) )*(v+(0,1)..v+(1,0)..v+(0,-1)) , arrow=Arrow, L="Unstable",align=NE);


//////////////////

pair S = (4,0);
pair s = (5,0);

// base magnets
magnet2d(m,m,S-vgap,90);
drawground(width=m,wlen=0.2,origin=S-vgap-my/2,angle=0,whiskers=7);
magnet2d(m,m,S+s-vgap,90);
drawground(width=m,wlen=0.2,origin=S+s-vgap-my/2,angle=0,whiskers=7);

// floating magnet
pair h = (0,2);
magnet2d(m,m,S+v,-90);
magnet2d(m,m,S+s+v,-90);

// coupling
draw( S+v+my/2 -- S+v+h -- S+s+v+h -- S+s+v+my/2, p=linewidth(2));
dot( S+s/2+h+v ,p=linewidth(5));
draw( S+s/2+h+v --  S+s/2+h+v-(0,1.2) , Arrow, L="$F_g$",align=W+SW);

draw( -my/2+S+v-(0,1.2)   --  -my/2+S+v   , Arrow,L="$F_m$",align=W+SW);
draw( -my/2+S+s+v-(0,1.2) --  -my/2+S+s+v , Arrow,L="$F_m$",align=W+SW);

draw( shift( S+s/2+h+(0.1,0) )*(v+(0,-1)..v+(1,0)..v+(0,1)) , arrow=Arrow);
label("Stable",S+s/2+h+v+(0.5,1),align=NE);

