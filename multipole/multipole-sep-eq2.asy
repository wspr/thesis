
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

real S = 0;
for(int n=0; n<T; ++n) {
  magnet2d(w,h,(S+n*w+n*g,0),90);
  magnet2d(w,h,(S+n*w+n*g,H),-90);
}
draw( (S-w/2,-h/2)--(S+(T-1)*(w+g)+w/2,-h/2) );
draw( (S-w/2,h/2)--(S+(T-1)*(w+g)+w/2,h/2) );
draw( (S-w/2,H-h/2)--(S+(T-1)*(w+g)+w/2,H-h/2) );
draw( (S-w/2,H+h/2)--(S+(T-1)*(w+g)+w/2,H+h/2) );

