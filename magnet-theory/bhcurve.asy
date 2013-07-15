
import phdfig;

texpreamble("
\providecommand\magH{\mathbf H}
\providecommand\magB{\mathbf B}
\providecommand\remanence{B_r}
\providecommand\coerce{H_c}
\providecommand\BHmax{[BH]_{\mathrm{max}}}
");

unitsize(0.5cm);

pair X = (1,0);
pair Y = (0,1);

pair AX = 5*X;
pair AY = 5*Y;

real r = 1.25;
filldraw( -r*AX -- (0,0) -- r*AY -- r*(-AX+AY) -- cycle , palegreen , invisible );

real Br = 2.5;
real Hc = 2;
real Hci = 3;

dot( (0,Br) , L="$\remanence$",NW);
dot( (-Hc,0), L="$-\coerce$" ,NW );

pair sat  = extension( (-Hc,0) , (0,Br) , (Hci,0) , (Hci,1) );
pair knee = extension( (-Hc,0) , (0,Br) , (-Hci,0) , (-Hci,1) );
pair satoff = (5.5,0);

dot( knee , blue );
label( "Knee" , knee , W );
label( "Saturation" , sat+satoff , NW);

draw( -knee -- (Hci,0), dotted );
label( "$\coerce{}_i$" , (Hci,0) , S);

// draw( (0,0) -- sat , dashed , Arrow(position=0.3) );

draw( sat -- knee , blue+dashed );
draw( knee -- -sat , blue+dashed );
draw( -sat -- -knee , blue+dashed );
draw( -knee -- sat , blue+dashed );

// AXES

draw( -AX -- AX , Arrows(size=6pt));
draw( -AY -- AY , Arrows(size=6pt));
label("$\magH$",AX,align=SE);
label("$\magB$",AY,align=NE);

// curves

draw( satoff+sat{-1,0} .. (-Hc,0) .. {-1,0}-sat-satoff , Arrow(position=0.6) );
draw( satoff+sat{-1,0} .. (-Hc,0) .. {-1,0}-sat-satoff , Arrow(position=1.5) );
draw( -sat-satoff{1,0} .. (Hc,0) .. {1,0}satoff+sat  , Arrow(position=0.55) );
draw( -sat-satoff{1,0} .. (Hc,0) .. {1,0}satoff+sat  , Arrow(position=1.5) );
