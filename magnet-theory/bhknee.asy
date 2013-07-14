
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

real Br = 3;
real Hc = 2;
real Hci = 1.5;

pair sat  = extension( (-Hc,0) , (0,Br) , (Hci,0) , (Hci,1) );
pair knee = extension( (-Hc,0) , (0,Br) , (-Hci,0) , (-Hci,1) );
pair satoff = (3.1,0);

dot( knee , blue );
label( "Knee" , knee , W );
dot( (0,Br) , L="$\remanence$",NW);

label( L="$\coerce=\coerce{}_i$",(Hci+0.2,0.1),NE);
dot( (Hci,0) );

// draw( (0,0) -- sat , dashed , Arrow(position=0.3) );

draw(  sat  --  knee , blue+dashed );
draw(  knee -- -sat  , blue+dashed );
draw( -sat  -- -knee , blue+dashed );
draw( -knee --  sat  , blue+dashed );

// AXES

draw( -AX -- AX , Arrows(size=6pt));
draw( -AY -- AY , Arrows(size=6pt));
label("$\magH$",AX,align=SE);
label("$\magB$",AY,align=NE);


// curves

draw( satoff+sat{-1,0} .. (-Hci,0) .. {-1,0}-sat-satoff , Arrow(position=0.5) );
draw( satoff+sat{-1,0} .. (-Hci,0) .. {-1,0}-sat-satoff , Arrow(position=1.5) );
draw( -sat-satoff{1,0} .. (Hci,0) .. {1,0}satoff+sat  , Arrow(position=0.5) );
draw( -sat-satoff{1,0} .. (Hci,0) .. {1,0}satoff+sat  , Arrow(position=1.5) );
