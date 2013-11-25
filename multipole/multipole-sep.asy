
import phdfig;
unitsize(1cm);

texpreamble("
  \providecommand\mupwavelength{\lambda}
  \providecommand\mupmagperwave{R}
  \providecommand\mupvdispl{\delta}
  \providecommand\mupNwave{W}
  \providecommand\muplength{l}
  \providecommand\mupheight{h}
  \providecommand\mupmaglength{m}
  \providecommand\mupfacegap{G}
");

real h = 1, w = 1, H = 1.75, g = 0.3;

real T = 9;

for(int n=0; n<T; ++n) {
  magnet2d(w,h,(n*w+n*g,0),90+90*n);
  magnet2d(w,h,(n*w+n*g,H),-90-90*n);
}
draw( (-w/2,-h/2)--((T-1)*(w+g)+w/2,-h/2) );
draw( (-w/2,h/2)--((T-1)*(w+g)+w/2,h/2) );
draw( (-w/2,H-h/2)--((T-1)*(w+g)+w/2,H-h/2) );
draw( (-w/2,H+h/2)--((T-1)*(w+g)+w/2,H+h/2) );

real smallarrow = 4pt;

real u = -w/2-0.4;
real v = -h/2-0.4;

draw( (-w/2,v)--(w/2,v) , L="$\mupmaglength$", S, Arrows(size=smallarrow));
draw( (u,-h/2)--(u,h/2) , L="$\mupheight$", W, Arrows(size=smallarrow));
draw( (u,h/2)--(u,-h/2+H) , L="$\mupvdispl$", W, Arrows(size=smallarrow));

draw( (w/2,-0.1-h/2) -- (w/2,-h), dashed );
draw( (w/2+g,-0.1-h/2) -- (w/2+g,-h), dashed );
draw( (w+1.5*g,v) -- (g+w/2,v) , Arrow(size=smallarrow),L="$\mupfacegap$", align=S);
