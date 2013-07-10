
import phdfig;

texpreamble("\
\providecommand\mass{M} \
\providecommand\dispBase{x_1} \
\providecommand\dispMass{x_2} \
\providecommand\dampingRel{c} \
\providecommand\dampingAbs{c_{\textrm{sky}}} \
\providecommand\stiffnessRel{k} \
\providecommand\forceIn{f} \
");

real w = 5mm, dh = 20mm, sp = 10mm;

real massh = 7mm, massw = 3sp;

drawmass( start=(0,-massh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 );

drawmotion( start=(massw/2,-massh/2) ,
	    offset=5mm, length=5mm,
	    label="$\dispBase$" );

drawspring((-sp,0),(-sp,dh),width=w,label="$\stiffnessRel$");
drawdamper((0,0),(0,dh),width=w,label="$\dampingRel$");
drawinputforce((sp,0),(sp,dh),width=w,label="$\forceIn$",labelpos=E);

drawmass( start=(0,dh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="$\mass$");
drawmotion( start=(massw/2,dh+massh/2) ,
	    offset=5mm, length=5mm,
	    label="$\dispMass$" );
