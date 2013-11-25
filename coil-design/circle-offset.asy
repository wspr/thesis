
import phdfig;

size(5cm,5cm);

// major axes
real X1=-1, X2=7, Y1=-1, Y2=6;
real R2=3, RT=40;
real T1=20, T2=70, TR=R2-1;

draw((X1,0)--(X2,0),Arrow);
draw((0,Y1)--(0,Y2),Arrow);
draw((0,0)--R2*dir(RT),Arrow);
draw(arc((0,0),TR,T1,T2),Arrow);
label("$x$",(X2,0),E);
label("$y$",(0,Y2),N);
label("$r$",R2*dir(RT),NE);
label("$\phi$",TR*dir(T2),N);

// circle
pair L=(6,5);
real r=2;

filldraw(circle(L,r),lightgrey);

real rO=0.75;
real h=L.y-r-rO;
draw((L.x-r,h)--(L.x+r,h),Arrows(size=4pt));
label("$2R$",(L.x,h),S);

// minor axes
real x1=-r-0.5, x2=-x1+0.5, y1=-r-0.5, y2=-y1+0.5;
real r2=r+2, rt=40;
real t1=20, t2=70, tr=r2-1;

draw(L+(x1,0)--L+(x2,0),Arrow);
draw(L+(0,y1)--L+(0,y2),Arrow);
draw(L--L+r2*dir(rt),Arrow);
draw(arc(L,tr,t1,t2),Arrow);
label("$x'$",L+(x2,0),E);
label("$y'$",L+(0,y2),N);
label("$r'$",L+r2*dir(rt),NE);
label("$\phi'$",L+tr*dir(t2),NE);

// axis offset
pair AO=(-0.5,-0.5);
draw((AO.x,0)--(AO.x,L.y),Arrows(size=4pt));
label("$\eta$",(AO.x,0.5*L.y),W);

draw((0,AO.y)--(L.x,AO.y),Arrows(size=4pt));
label("$\xi$",(0.5*L.x,AO.y),S);

// infinitesimal area
real dt1=-40,    dr1=0.4*r;
real dt2=dt1+20, dr2=dr1+0.4;
filldraw(
    arc(L,dr1,dt1,dt2)
  --arc(L,dr2,dt2,dt1)
  --cycle,green);
label("$\mathrm{d}a$",L+dr1*dir(dt1),S);
