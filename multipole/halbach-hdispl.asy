
import phdfig;

texpreamble("
  \providecommand\ax{\hat x}
  \providecommand\ay{\hat y}
  \providecommand\az{\hat z}
  \providecommand\muphdispl{\beta}
  \providecommand\mupvdispl{\delta}
");

real h = 1cm, w = 1cm, d=1.5h, hdispl = 1.5cm;

real T = 5;

for(int n=0; n<T; ++n)
  magnet2d(w,h,(n*w,0),-90+90*n);

for(int n=0; n<T; ++n)
  magnet2d(w,h,(hdispl+n*w,d),90-90*n);

pair O = (-2cm,0cm);
real l = 0.7cm;
dot(O);
draw(O--O+(0,l),L="$\az$",align=2NE,Arrow(size=4pt));
draw(O--O+(l,0),L="$\ay$",align=2SE,Arrow(size=4pt));

// hdispl label

draw( (-w/2,h/2)--(-w/2,1.5*d) , dashed);
draw(
     (-w/2,d)--(hdispl-w/2,d),
     L="$\muphdispl$",
     Arrow(size=4pt),
     align=N);

// vdispl label

draw( (T*w-w/2,0) -- (T*w+hdispl+0.5cm,0) , dashed);
draw( (T*w-w/2+hdispl,d) -- (T*w+hdispl+0.5cm,d) , dashed);
draw(
     (T*w+hdispl,0)--(T*w+hdispl,d),
     L="$\mupvdispl$",
     Arrow(size=4pt),
     align=E);
