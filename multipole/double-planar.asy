
import phdfig;

unitsize(0.8cm);

texpreamble("
  \providecommand\ax{\hat x}
  \providecommand\ay{\hat y}
  \providecommand\az{\hat z}
  \providecommand\muphdgap{d}
  \providecommand\muphdispl{\beta}
  \providecommand\mupvdispl{\delta}
");

real h = 1, w = 1, d=1.5h, hdispl = 0.7;

real T = 5;
real W = 10;

  magnet2d(w,h,(0*w,0), 90);
  magnet2d(w,h,(1*w,0),135);
  cuboid2d(w,h,(2*w,0));
  magnet2d(w,h,(3*w,0), 45);
  magnet2d(w,h,(4*w,0), 90);

  magnet2d(w,h,(W+0*w,0), 90);
  magnet2d(w,h,(W+1*w,0),135);
  cuboid2d(w,h,(W+2*w,0));
  magnet2d(w,h,(W+3*w,0), 45);
  magnet2d(w,h,(W+4*w,0), 90);

  magnet2d(w,h,(hdispl+0*w,d),-90);
  magnet2d(w,h,(hdispl+1*w,d),-135);
  cuboid2d(w,h,(hdispl+2*w,d));
  magnet2d(w,h,(hdispl+3*w,d),-45);
  magnet2d(w,h,(hdispl+4*w,d),-90);

  draw( (hdispl+4.5*w,d+h/2) -- (W-hdispl-0.5w,d+h/2) );
  draw( (hdispl+4.5*w,d-h/2) -- (W-hdispl-0.5w,d-h/2) );
  pair O = ( (hdispl+4.5*w)/2+(W-hdispl-0.5w)/2 ,0);
  dot( O );
  real aa = 0.9;
  draw( O--(O+(aa,0)) , Arrow(size=4pt) );
  draw( O--(O+(0,d)) , Arrow(size=4pt) ,L="$\mupvdispl$", align=SW);
  draw( O+(-aa,d) -- O+(aa,d) , dashed );
  label(O+(aa,0),L="$\muphdispl$",align=S);

  magnet2d(w,h,(W-hdispl+0*w,d),-90);
  magnet2d(w,h,(W-hdispl+1*w,d),-135);
  cuboid2d(w,h,(W-hdispl+2*w,d));
  magnet2d(w,h,(W-hdispl+3*w,d),-45);
  magnet2d(w,h,(W-hdispl+4*w,d),-90);

drawground(
   width    = 5w,
   origin   = (2w,-h/2),
   whiskers=15,
   wlen=0.3
);

drawground(
   width    = 5w,
   origin   = (W+2w,-h/2),
   whiskers=15,
   wlen=0.3
);

pair O = (-2,0);
real l = 0.7;
dot(O);
draw(O--O+(0,l),L="$\az$",align=2NE,Arrow(size=4pt));
draw(O--O+(l,0),L="$\ay$",align=2SE,Arrow(size=4pt));

// hdispl label

draw( (-w/2,h/2)--(-w/2,1.5*d) , dashed);
draw(
     (-w/2,d)--(hdispl-w/2,d),
     L="$\muphdgap$",
     Arrows(size=4pt),
     align=N);

draw( (W+9w/2,h/2)--(W+9w/2,1.5*d) , dashed);
draw(
     (W+9w/2,d)--(W-hdispl+9w/2,d),
     L="$\muphdgap$",
     Arrows(size=4pt),
     align=N);
