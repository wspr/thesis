
import phdfig;

texpreamble("
  \providecommand\mupwavelength{\lambda}
  \providecommand\muplength{l}
  \providecommand\mupmaglength{m}
");

real h = 1cm, w = 0.7cm;

real T = 9;

for(int n=0; n<T; ++n)
  magnet2d(w,h,(n*w,0),90+90*n);

real smallarrow = 4pt;


real v = -h/2-0.5cm;
draw( (-w/2,v)--(w/2,v) , L="$\mupmaglength$", N, Arrows(size=smallarrow));

real v = -h/2-0.8cm;
draw( (-w/2,v)--(3w+w/2,v) , L="$\mupwavelength$", N, Arrows(size=smallarrow));

real v = -h/2-1.1cm;
draw( (-w/2,v)--(8*w+w/2,v) , L="$\muplength$", S, Arrows(size=smallarrow));

draw( (-w/2-0.5cm,-h/2)--(-w/2-0.5cm,+h/2) , L="$\mupheight$", E, Arrows(size=smallarrow));
