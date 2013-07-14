
unitsize(1mm);

import phdfig;

texpreamble("\
\providecommand\massMass{m_2} \
\providecommand\accBase{\ddot x_1} \
\providecommand\accMass{\ddot x_2} \
\providecommand\damping{c} \
\providecommand\stiffness{k} \
\providecommand\forceIn{f} \
\providecommand\BlockController{K} \
");

real w = 5, dh = 20, sp = 12;
real acc = 2;
real massh = 8, massw = 3*sp;

drawmass( start=(0,-massh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="");
drawmotion( start=(massw/2,-massh/2) ,
	    label="$\accBase$" , offset=5, length=5 );

drawspring((0,0),(0,dh),width=w,label="$\stiffness$",labelpos=E);
drawdamper((sp,0),(sp,dh),width=w,label="$\damping$",E);

drawmass( start=(0,dh),
	  height=massh,
	  left=massw/2,
	  right=massw/2 ,
	  label="$\massMass$");
drawmotion( start=(massw/2,dh+massh/2) ,
	    label="$\accMass$" , offset=5, length=5 );

filldraw ( shift((-0.5acc,dh+massh))*box((0,0),(acc,acc)) );

pair[] z;
z[0] = (0,dh+massh+acc);
z[1] = z[0] + (0,7.5);
z[2] = z[1] - (30,0);
z[3] = z[2] - (0,7.5);
real gainh=10;
z[4] = z[3] - (0,gainh);
z[5] = (z[3].x,0.5dh);
z[6] = (-sp-w/2,z[5].y);
draw( z[0]--z[1]--z[2]--z[3] , Arrow );
draw( z[4]--z[5]--z[6] , Arrow );

draw(shift(z[4]-0.5gainh)*box((0,0),(gainh,gainh)));
label("$\BlockController$",z[4]+(0,gainh/2));
drawinputforce( (-sp,0) ,(-sp,dh),width=w,label="$\forceIn$",labelpos=E);

