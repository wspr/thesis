
import phdfig;

texpreamble("
  \providecommand\force{\vec F}
  \providecommand\cdx{\alpha}
  \providecommand\cdy{\beta}
  \providecommand\cdz{\gamma}
  \providecommand\mrot{\theta}
  \providecommand\hwxX{a}
  \providecommand\hwyX{b}
  \providecommand\hwzX{c}
  \providecommand\hwxF{A}
  \providecommand\hwyF{B}
  \providecommand\hwzF{C}
  ");

unitsize(1cm);

real w_body = 0.8pt;
real w_dim  = 0.4pt;
pen pen_body = linewidth(w_body);
pen pen_dim = linewidth(w_dim);

defaultpen(pen_body);

pair mx1=(1.4,0);
pair my1=(0,1.2);

pair mx2=(1.2,0);
pair my2=(0,1.4);

pair arr = (1.5,0);
pair arrv = (0,-0.25);
pair displ = (2,3);
pair magO = (0,0);

real magrot = 30;

// magnets
magnet2d(mx1.x,my1.y,magO,90);
magnet2d(mx2.x,my2.y,displ,90,magrotate=magrot);

//dot(magO);
//dot(displ);

// magnet dims

pair ax = (-1,0);
pair ay = (0,-1);

pair lx = (displ.x+2,0);
pair ly = (0,displ.y+2);

label("$2\hwzX$",magO-mx1/2,align=W);
label("$2\hwyX$",magO-my1/2,align=S);

label("$2\hwzF$",displ+rotate(magrot)*(-mx2/2),align=W);
label("$2\hwyF$",displ+rotate(magrot)*(my2/2),align=N);

// labels
draw( shift(lx)*( magO -- (magO.x,displ.y) ) , Arrows(size=4pt) , p=pen_dim, L="$\cdz$");
draw( shift(ly)*( magO -- (displ.x,magO.y) ) , Arrows(size=4pt) , p=pen_dim, L="$\cdy$");

draw( displ -- displ + 0.6*(-1,-2) , p=linewidth(2*w_body), Arrow(size=6pt) , L="$\force$", align=4*S+0.5*E);

// dashes
draw( magO -- lx , p=pen_dim+dashed+grey);
draw( lx+(0,displ.y) -- displ , p=pen_dim+dashed+grey);

draw( magO -- ly , p=pen_dim+dashed+grey);
draw( ly+(displ.x,0) -- displ , p=pen_dim+dashed+grey);

draw( displ -- displ + rotate(magrot)*(2,0) ,  p=pen_dim+dashed+grey);
label( "$\mrot$", displ + rotate(magrot)*(1,0) , S);

// axes
pair aoff = (-3,0);
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt),p=pen_dim);
label("$\ay$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);
