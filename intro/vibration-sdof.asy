
import phdfig;

texpreamble("\
\providecommand\dispMass{x}\
\providecommand\massMass{m}\
\providecommand\stiffness{k}\
\providecommand\damping{c}\
\providecommand\forceIn{f}\
\providecommand\forceDisturb{F}\
");

real w = 5mm, dh = 20mm, sp = 10mm;

drawground( width=3sp );
drawspring((-sp,0),(-sp,dh),width=w,label="$\stiffness$");
drawdamper((0,0),(0,dh),width=w,label="$\damping$");
drawinputforce((sp,0),(sp,dh),width=w,label="$\forceIn$",labelpos=E);

real massh = 10mm, massw = 3sp;
drawmass( start=(0,dh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="$\massMass$");

drawmotion( start=(massw/2,dh+massh/2) ,
	    offset=5mm, length=5mm,
	    label="$\dispMass$" );

draw((0,dh+massh+7mm)--(0,dh+massh),Arrow);
label("$\forceDisturb$",(0,dh+massh+7mm),E);
