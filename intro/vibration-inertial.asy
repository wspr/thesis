
import phdfig;

texpreamble("\
\providecommand\massBase{m_1} \
\providecommand\massMass{m_2} \
\providecommand\massAbsorb{m_3} \
\providecommand\dispBase{x_1} \
\providecommand\dispMass{x_2} \
\providecommand\dispAbsorb{x_3} \
\providecommand\dampingRel{c} \
\providecommand\dampingAbsorb{c_a} \
\providecommand\stiffnessRel{k} \
\providecommand\stiffnessAbsorb{k_a} \
\providecommand\forceAbsorb{f_a} \
");

real w = 5mm, dh = 20mm, sp = 15mm;

real massh = 7mm, massw = 3sp;

drawmass( start=(0,-massh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="");

drawmotion( start=(massw/2,-massh/2) ,
	    offset=5mm, length=5mm,
	    label="$\dispBase$" );

drawspring((-1.5sp/2,0),(-1.5sp/2,dh),width=w,label="$\stiffnessRel$");
drawdamper((1.5sp/2,0),(1.5sp/2,dh),width=w,label="$\dampingRel$");

drawmass( start=(0,dh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="$\massMass$");

drawmotion( start=(massw/2,dh+massh/2) ,
	    offset=5mm, length=5mm,
	    label="$\dispMass$" );

real yabs = 2dh+massh;

drawspring((-sp,yabs-dh),(-sp,yabs),width=w,label="$\stiffnessAbsorb$");
drawdamper((0,yabs-dh),(0,yabs),width=w,label="$\dampingAbsorb$");
drawinputforce((sp,yabs-dh),(sp,yabs),width=w,label="$\forceAbsorb$");

drawmass( start=(0,yabs),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="$\massAbsorb$");

drawmotion( start=(massw/2,yabs+massh/2) ,
	    offset=5mm, length=5mm,
	    label="$\dispAbsorb$" );

label("\makebox[0pt][r]{Ground}",(-massw/2-3mm,-massh/2),align=E);
label("\makebox[0pt][r]{Mass}",(-massw/2-3mm,dh+massh/2),align=E);
label("\makebox[0pt][r]{Inertial mass}",(-massw/2-3mm,yabs+massh/2),align=E);
