import solids;
settings.prc=false;
settings.render=0;

texpreamble("
\usepackage{mathpazo}
\providecommand\lengthCoil{L_c}
");

size(5cm,5cm);
currentprojection=orthographic(5,0,2,up=-X);
currentlight=Viewport;

real rm = 4, rc=4;
real dz = 0, dy = 10, lm = 4, lc = 4;
real l;

revolution r=cylinder(O,rc,lc,Z);
draw(r,black+thick());

path3 p = Z*(dz+lm/2)+sin(pi/6)*Y*rm+cos(pi/6)*X*rm ..
  Z*(dz+lm/2)+X*rm ..
  Z*(dz+lm/2)-sin(pi/3)*Y*rm+cos(pi/3)*X*rm;

draw( shift(Y*dy)*reverse(p) , arrow=Arrow3 , thick() );

label("S",O);
label("N",Z*lc);

label("Magnet",Z*1.8*lc);
label("Coil",dy*Y+Z*1.8*lc);

revolution r=cylinder(dy*Y,rm,lm,Z);
draw(r,black+thick());

draw("$\lengthCoil$",16Y--16Y+Z*lc,Bars3(dir=Y));

// Axis:
//draw(O--Z*(dz+lm),dotted);


