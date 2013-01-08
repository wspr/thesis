
import phdfig;

unitsize(1cm);

real m=1;
pair mx=(m,0);
pair my=(0,m);


real M = -4;
real L = -1.5;
real D = 1.5;
real U = 3.5;
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

// top magnet
magnet2d(m,m,fixu,-90);
drawground(width=m,wlen=0.2,origin=fixu+(0,m/2),angle=180,whiskers=7);

// labels
draw(shift(mx/2+out)*(fleq--fleq+arr),Arrow(size=6pt));
label("Unstable",(M,L));


M = 0;
pair fixb=(M,0);
pair fixu=(M,U);
pair fleq=(M,D);

// middle
xo = (fixb+fixu)/2;

// floating magnet
magnet2d(m,m,fleq,-90);
draw(fleq+mx/2--fleq+mx/2+2*out,dashed);

// bottom magnet
magnet2d(m,m,fixb,90);
drawground(width=m,wlen=0.2,origin=-my/2,whiskers=7);

draw(shift(mx/2+out)*(fleq--fleq+arr),Arrow(size=6pt));
label("Stable",(M,L));






M = 4;
pair fixb=(M,0);
pair fixu=(M,U);
pair fleq=(M,D);

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

draw(shift(mx/2+out)*(fleq--fleq+arr),Arrow(size=6pt));
label("Quasi--zero stiffness",(M,L));



// axis

pair aoff = (-4,0)-my/2;
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt));
label("$\ax$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);
