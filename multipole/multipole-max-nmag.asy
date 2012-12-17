
import phdfig;
unitsize(1cm);

texpreamble("
  \providecommand\mupwavelength{\lambda}
  \providecommand\mupmagperwave{R}
  \providecommand\mupNwave{W}
  \providecommand\muplength{l}
  \providecommand\mupheight{h}
  \providecommand\mupmaglength{m}
");

real h = 1, w = 0.5, H = 2;

real T = 17;

for(int n=0; n<T; ++n)
  magnet2d(w,h,(n*w,0),90+180*n);

for(int n=0; n<T; ++n)
  magnet2d(w,h,(n*w,H),90+22.5*n);

real smallarrow = 4pt;

real v = -h/2-0.4;
draw( (-w/2,v)--(w+w/2,v) , L="$\mupwavelength$", S, Arrows(size=smallarrow));
draw( (-w/2,-v+H)--(T*w-3w/2,-v+H) , L="$\mupwavelength$", N, Arrows(size=smallarrow));

label("$\mupmagperwave=16$, $\mupNwave=1$",(T*w,H),E);
label("$\mupmagperwave=2$, $\mupNwave=8$",(T*w,0),E);
