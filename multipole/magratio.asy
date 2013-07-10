
import phdfig;

texpreamble("
\providecommand\mupqlh{m_2}
\providecommand\mupqlv{m_1}
");

real width = 6cm, h = 1cm, NN=5, gap=2cm, lbl=0.7cm, r = 0.5, w1, w2, n;

real smallarrow = 4pt;

w1 = 2*width/(NN*(1+r)+1-r);
w2 = r*w1;

n = 0;
magnet2d(w1,h,(w1/2+n*(w1/2+w2/2),0),90+n*90);
n = 1;
magnet2d(w2,h,(w1/2+n*(w1/2+w2/2),0),90+n*90);
n = 2;
magnet2d(w1,h,(w1/2+n*(w1/2+w2/2),0),90+n*90);
n = 3;
magnet2d(w2,h,(w1/2+n*(w1/2+w2/2),0),90+n*90);
n = 4;
magnet2d(w1,h,(w1/2+n*(w1/2+w2/2),0),90+n*90);


draw( (0,-lbl)--(1*w1+4*w2,-lbl) ,
      L="One wavelength", S,
      Arrows(size=smallarrow));

draw( (0,+lbl)--(w1,+lbl) ,
      L="$\mupqlv$", N,
      Arrows(size=smallarrow));

draw( (w1,+lbl)--(w1+w2,+lbl) ,
      L="$\mupqlh$", N,
      Arrows(size=smallarrow));
