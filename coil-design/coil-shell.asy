import solids;

size(4cm,4cm);
currentprojection=orthographic(2,2,2,up=Y);
currentlight=Viewport;

real Nz = 2;

real rm = 1, rc=2, Rc=2.5;
real dz = 3, lm = 2, lc = 2;



for (int nz=0; nz <= Nz; ++nz) {
  revolution r=cylinder(O,Rc-(Rc-rc)*nz/Nz,lc,Z);
  draw(surface(r),red+opacity(0.5),nolight);
  draw(r,black+linewidth(0.6),black+solid);
}


revolution r=cylinder(dz*Z,rm,lm,Z);
draw(surface(r),white,nolight,render(merge=true));
draw(r,black+linewidth(0.6),black+solid);


