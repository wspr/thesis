
import phdfig;

real width = 6cm, h = 1cm, w, W=1;
real vshift, gap=2cm, label=0.7cm;

real smallarrow = 4pt;


vshift = 0;
real R = 8;
real N = R*W+1;
for(int n=0; n<N; ++n) {
  w = width/N;
  magnet2d(w,h,(n*w+w/2,vshift),90+360/R*n);
};

draw( (0,vshift-label)--(width-w,vshift-label) , L="One wavelength", S, Arrows(size=smallarrow));

vshift = gap;
real R = 4;
real N = R*W+1;
for(int n=0; n<N; ++n) {
  w = width/N;
  magnet2d(w,h,(n*w+w/2,vshift),90+360/R*n);
};

draw( (0,vshift-label)--(width-w,vshift-label) , L="One wavelength", S, Arrows(size=smallarrow));


vshift = 2*gap;
real R = 2;
real N = R*W+1;
for(int n=0; n<N; ++n) {
  w = width/N;
  magnet2d(w,h,(n*w+w/2,vshift),90+360/R*n);
};

draw( (0,vshift-label)--(width-w,vshift-label) , L="One wavelength", S, Arrows(size=smallarrow));
