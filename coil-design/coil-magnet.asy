
settings.prc=false;
settings.render=0;

import solids;

size(4cm,4cm);
currentprojection=orthographic(2,2,2,up=Y);

real rm = 1, rc=2, Rc=2.5;
real dz = 3, lm = 2, lc = 2;


path3 rev=rc*X--rc*X+lc*Z--Rc*X+lc*Z--Rc*X--cycle;
revolution torus=revolution(rev,Z);
draw(surface(torus),lightgreen+opacity(0.5),nolight);


revolution r=cylinder(O,Rc,lc,Z);
//draw(surface(r),lightgreen+opacity(0.5),render(merge=true));
//draw(r,blue);

revolution r=cylinder(O,rc,lc,Z);
draw(r,black+linewidth(1),black+solid);

revolution R=cylinder(O,Rc,lc,Z);
draw(R,black+linewidth(1),black+solid);

revolution r=cylinder(dz*Z,rm,lm,Z);
draw(surface(r),white,nolight,render(merge=true));
draw(r,black+linewidth(1));

//filldraw(project(circle(lc*Z,Rc,Z)^^reverse(circle(lc*Z,rc,Z))),lightgrey);




