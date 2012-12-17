
texpreamble("\providecommand\ZKSheight{h}");
texpreamble("\providecommand\ZKSwidth{w}");
texpreamble("\providecommand\ZKSlengthcomp[1]{L_c}");
texpreamble("\providecommand\ZKSvlengthcomp[1]{H_c}");
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
mass = (0,0);

real lbloffset = 2;
real lblgap = 0.25;
real coordlength = 3*lblgap;

real gr = 0.3;
real ns = 0.2;
real w = 0.2;
real mr = 0.15;
int  pp = 9;
pen  sp = defaultpen;

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

draw("$\ZKSvlengthcomp{0,0}$",
     (1.6 lblgap,base.y)--(1.6 lblgap,mass.y),
     Arrows(size=5));

draw("$\ZKSlengthcomp{0,0}$",align=N,
     (0,mass.y+lblgap)--(-fixr.x,mass.y+lblgap),
     Arrows(size=5));


// coords
pair Q = (0,mr);
dot(Q);
draw(Q+mass+(0,0)--Q+mass+(coordlength,0),Arrow,L="$\ZKSshift$",align=5E+1.5N);
draw(Q+mass+(0,0)--Q+mass+(0,coordlength),Arrow,L="$\ZKSdisp$",align=5N+1.5E);


