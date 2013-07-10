
import phdfig;

texpreamble("\providecommand\force{\vec F}");

unitsize(1cm);

real w_body = 0.8pt;
real w_dim  = 0.4pt;
pen pen_body = linewidth(w_body);
pen pen_dim = linewidth(w_dim);

defaultpen(pen_body);

pair mx1=(1.5,0);
pair my1=(0,1.5);

pair mx2=(1.5,0);
pair my2=(0,1.5);

real magrot = 30;

pair rorigin = (0,5);
pair lever = (0,-2);
pair displ = rorigin+rotate(magrot)*lever;
pair magO = (0,0);

// magnets

dot(rorigin,L="$O_m$",align=N);
draw(rorigin--displ,p=linewidth(2));
magnet2d(mx1.x,my1.y,magO,90);
magnet2d(mx2.x,my2.y,displ,-90,magrotate=magrot);

//dot(magO);
//dot(displ);

// magnet dims

pair ax = (-1,0);
pair ay = (0,-1);

pair lx = (displ.x+1.5,0);
pair lx2 = (displ.x+2,0);
pair ly = (0,displ.y-1.5);


// labels
draw( shift(lx)*( magO -- (magO.x,displ.y) ) , Arrows(size=4pt) , p=pen_dim, L="$z_c$",align=W);
draw( shift(ly)*( magO -- (displ.x,magO.y) ) , Arrows(size=4pt) , p=pen_dim, L="$y_c$");

draw( shift(lx2)*( magO -- rorigin ) , Arrows(size=4pt) , p=pen_dim, L="$z_m$",align=E);

// dashes
draw( magO -- lx2 , p=pen_dim+dashed+grey);
draw( lx+(0,displ.y) -- displ , p=pen_dim+dashed+grey);
draw( lx2+(0,rorigin.y) -- rorigin , p=pen_dim+dashed+grey);
draw( ly+(displ.x,0) -- displ , p=pen_dim+dashed+grey);
draw( rorigin -- my1/2 , p=pen_dim+dashed+grey);

draw( rorigin -- rorigin+rotate(magrot-90)*lever, p=pen_dim+dashed+grey);
draw( displ -- displ+rotate(magrot-90)*lever, p=pen_dim+dashed+grey);
draw( rorigin+rotate(magrot-90)*lever -- displ+rotate(magrot-90)*lever , p=pen_dim,L="$l_m$", Arrows(size=4pt));

label( "$\theta$", rorigin + rotate(magrot/2)*lever/2.5 );

// axes
pair aoff = (-3,0);
real xx = 0.5;
real zz = 0.5;
draw(shift(aoff)*((xx,0)--(0,0)--(0,zz)),Arrows(size=4pt),p=pen_dim);
label("$\ay$",aoff+(xx,0),SE);
label("$\az$",aoff+(0,zz),NE);
