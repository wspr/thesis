
import phdfig;

defaultpen(fontsize(9pt));

texpreamble("
\providecommand\mbqforce{f}
\providecommand\mbqmagw{w}
\providecommand\mbqmagh{h}
\providecommand\mbqvdisp{v}
\providecommand\mbqoffset{o}
");

size(8cm,8cm);

real T = 40, TT = 180-T;
real a = 0.6, b = 1, g = 0.9, d = 2, dy = d*Cos(T), G = 3.2;

real as = 4pt;

real tmpL;
pair tmpa,tmpb,tmpc,tmpd,tmpSE,tmpNE,tmpSW,tmpNW ;

// base magnets

magnet2d(a,b,(0,0),0, magrotate=T);
tmpSE = rotate(T)*(-a/2,-b/2);
tmpSW = rotate(T)*(-a/2,b/2);
drawgroundwhiskers(
	   width=b, angle=-90+T,
	   origin=(0,0)+(tmpSE+tmpSW)/2,
	   wlen=0.1);

magnet2d(a,b,(G,0),0, magrotate=TT);
tmpSE = rotate(TT)*(-a/2,-b/2);
tmpSW = rotate(TT)*(-a/2,b/2);
drawgroundwhiskers(
	   width=b, angle=-90+TT,
	   origin=(G,0)+(tmpSE+tmpSW)/2,
	   wlen=0.1);

tmpa = rotate(T)*(a/2,0)+(0,0);
tmpb = rotate(TT)*(a/2,0)+(G,0);
pair disporigin = tmpa;
draw(tmpa--tmpb,dashed);

// angle label

tmpL = 1;
tmpSE = rotate(T)*(-a/2,-b/2); // bottom of left base magnet

tmpa = tmpSE+(tmpL,0);
tmpb = tmpSE+rotate(T)*(tmpL,0);

draw(tmpSE--tmpa,dashed);
draw(tmpSE--tmpb,dashed);

draw(tmpa{N}..tmpb,L="$\theta$",Arrow(size=as),align=(-1,-0.2));

// float magnets

magnet2d(a,b,(g,dy),180, magrotate=T);
magnet2d(a,b,(G,0)+(-g,dy),180, magrotate=TT);

tmpa = rotate(T)*(a/2,-b/2)+(g,dy);
tmpb = rotate(TT)*(a/2,b/2)+(G-g,dy);
draw(tmpa--tmpb);

tmpa = rotate(T)*(a/2,b/2)+(g,dy);
tmpb = rotate(TT)*(a/2,-b/2)+(G-g,dy);
draw(tmpa--tmpb);

tmpc = 0.5(tmpa+tmpb);
dot(tmpc);
draw(tmpc--tmpc+(0,0.5),L="$\mbqforce$",NE,Arrow(size=as));

// mag labels

tmpL = 0.2;
tmpNE = rotate(TT)*(-a/2-tmpL,b/2)+(G-g,dy);
tmpNW = rotate(TT)*(-a/2-tmpL,-b/2)+(G-g,dy);
draw(tmpNW--tmpNE,L="$\mbqmagw$",SE,Arrows(size=as));

tmpSW = rotate(TT)*(a/2,-b/2-tmpL)+(G-g,dy);
tmpNW = rotate(TT)*(-a/2,-b/2-tmpL)+(G-g,dy);
draw(tmpNW--tmpSW,L="$\mbqmagh$",NE,Arrows(size=as));

// disp labels

tmpNE = rotate(T)*(-a/2,b/2)+(g,dy);
tmpNW = rotate(T)*(-a/2,-b/2)+(g,dy);

tmpc = (tmpNW+tmpNE)/2;
tmpd = (disporigin.x,tmpc.y);
draw((tmpc.x,disporigin.y)--tmpc,L="$\mbqvdisp$",E,Arrow(size=as));
draw((tmpc.x,disporigin.y)--disporigin,L="$\mbqoffset$",N,Arrow(size=as));

// axes

pair O = (3.5,1.25);
real o = 1;
draw(O--O+(0,o),L="$\ay$",2NE,Arrow);
draw(O--O+(o,0),L="$\ax$",SSE,Arrow);
