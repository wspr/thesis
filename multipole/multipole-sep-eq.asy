
import phdfig;
unitsize(0.6cm);

texpreamble("
  \providecommand\mupwavelength{\lambda}
  \providecommand\mupmagperwave{R}
  \providecommand\mupvdispl{\delta}
  \providecommand\mupNwave{W}
  \providecommand\muplength{l}
  \providecommand\mupheight{h}
  \providecommand\mupmaglength{m}
  \providecommand\mupfacegap{g}
");

real h = 1, w = 1, H = 2.5, g = 0.75;

real T = 5;

for(int n=0; n<T; ++n) {
  magnet2d(w,h,(n*w+n*g,0),90+90*n);
  magnet2d(w,h,(n*w+n*g,H),-90-90*n);
}
draw( (-w/2,-h/2)--((T-1)*(w+g)+w/2,-h/2) );
draw( (-w/2,h/2)--((T-1)*(w+g)+w/2,h/2) );
draw( (-w/2,H-h/2)--((T-1)*(w+g)+w/2,H-h/2) );
draw( (-w/2,H+h/2)--((T-1)*(w+g)+w/2,H+h/2) );
