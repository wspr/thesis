
texpreamble("\providecommand\ZKSheight{h}");
texpreamble("\providecommand\ZKSwidth{w}");
texpreamble("\providecommand\ZKSlength{L}");
texpreamble("\providecommand\ZKSvlength{H}");
texpreamble("\providecommand\ZKSdisp{x}");
texpreamble("\providecommand\ZKSshift{y}");

import phdfig;

unitsize(15mm);

real Lspring=2;
real Tspring=35;
pair fixl=(-Lspring*Cos(Tspring),0);
pair fixr=(Lspring*Cos(Tspring),0);
pair mass=(0,Lspring*Sin(Tspring));
pair base= mass-(0,Lspring);

real lbloffset = 2;
real lblgap = 0.5;
real coordlength = 1.5lblgap;

real gr = 0.3;
real ns = 0.2;
real w = 0.2;
real mr = 0.15;
int  pp = 9;
pen  sp = defaultpen;

// construction lines
draw(fixl--fixl+(0,mass.y)--mass,dashed+grey);

// ground:
drawpin(origin=base,height=0.25,wlen=0.08,whiskers=5);
drawpin(origin=fixl,height=0.25,wlen=0.08,whiskers=5,angle=-90,slant=50+90);
drawpin(origin=fixr,height=0.25,wlen=0.08,whiskers=5,angle=90);

//draw(fixl+(0,gr)--(fixl.x,0)--(fixr.x,0)--fixr+(0,gr));

// springs:
drawspring(start=base,end=mass,nospring=ns,width=w,
	   points=pp,springpen=sp);
drawspring(start=fixl,end=mass,nospring=ns,width=w,points=pp,
	   springpen=sp);
drawspring(start=fixr,end=mass,nospring=ns,width=w,points=pp,
	   springpen=sp);

// mass
filldraw(circle(mass,mr),fillpen=white,drawpen=black);

// labels
draw("$\ZKSheight$",align=W,
     fixl-(lblgap,0)--fixl+(-lblgap,mass.y),
     Arrows(size=5));

draw("$\ZKSvlength$",
     fixr+(lblgap,base.y)--fixr+(lblgap,mass.y),
     Arrows(size=5));

draw("$\ZKSwidth$",align=N,
     (0,mass.y+coordlength/2)--(-fixr.x,mass.y+coordlength/2),
     Arrows(size=5));

labeldistance(fixl,mass,label="$\ZKSlength$",arrowsize=5,offset=0.25,anchorpen=grey+dashed);
