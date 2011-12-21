
import phdfig;

size(0,3cm);

real sqrtpi = 1.77245;
real radius = 1;
real halfsidelength = sqrtpi*radius/2;
real offset = halfsidelength + 0.3;

draw(box((-halfsidelength,-halfsidelength),(halfsidelength,halfsidelength)));
draw((0,radius)..(radius,0)..(0,-radius)..(-radius,0)..cycle);

draw((-offset,radius)--(-offset,-radius),Arrows(5pt));
label("$2\radiusMag$",(-offset,0),W);

draw((offset,halfsidelength)--(offset,-halfsidelength),Arrows(5pt));
label("$\faceCub=\radiusMag\sqrt{\pi}$",(offset,0),E);


