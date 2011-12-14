import solids;

size(5cm,5cm);
currentprojection=orthographic(5,2,2,up=Y);
currentlight=Viewport;

real rm = 4, rc=3;
real dz = 6, lm = 4, lc = 3;
real l;

l= 2;
draw("$r_1$",Z*(dz+lm+l) -- Z*(dz+lm+l)+Y*rm,W,black,Bars3(dir=Z));
draw("$r_2$",Z*(-l) -- Z*(-l)+Y*rc,E,black,Bars3(dir=Z));

l = 1.5;
draw("$h_1$",Z*(dz+lm)-Y*(rm+l) -- Z*(dz)-Y*(rm+l),S,black,Bars3(dir=Y));
draw("$h_2$",Z*(lc)-Y*(rc+l) -- Z*(0)-Y*(rc+l),S,black,Bars3(dir=Y));

l = 1.5;
draw("$z$",Z*(dz+lm/2)+Y*(rm+l)--Z*lc/2+Y*(rm+l),Bars3(dir=Y));

revolution r=cylinder(O,rc,lc,Z);
draw(r,black+thick());

draw( Z*(dz+lm/2)+cos(pi/6)*Y*rm+sin(pi/6)*X*rm ..
      Z*(dz+lm/2)+X*rm ..
      Z*(dz+lm/2)-cos(pi/2.5)*Y*rm+sin(pi/2.5)*X*rm , Arrow3 );

label("\fontfamily{ptm}\selectfont N",O);
label("\fontfamily{ptm}\selectfont S",Z*lc);

revolution r=cylinder(dz*Z,rm,lm,Z);
draw(r,black+thick());

// Axis:
//draw(O--Z*(dz+lm),dotted); 


