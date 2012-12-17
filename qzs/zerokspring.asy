
import phdfig;

size(6cm,6cm);

pair base=(0,0);
pair fixl=(-2,1);
pair fixr=(2,1);
pair mass=(fixl+fixr)/2+(0,1);
pair unext=mass+(0,1);

real gr = 0.3;
real ns = 0.5;
real w = 0.5;

// ground:
//draw(base-(gr,0)--base+(gr,0));
//draw(fixl-(0,gr)--fixl+(0,gr));
//draw(fixr-(0,gr)--fixr+(0,gr));

draw(fixl+(0,gr)--(fixl.x,0)--(fixr.x,0)--fixr+(0,gr));

// springs:
drawspring(start=base,end=mass,nospring=ns,width=w,points=5);
drawspring(start=fixl,end=mass,nospring=ns,width=w,points=7);
drawspring(start=fixr,end=mass,nospring=ns,width=w,points=7);

// unextended springs:
currentpen = gray(0.7);
drawspring(start=fixl,end=unext,nospring=ns,width=w,points=7);
drawspring(start=fixr,end=unext,nospring=ns,width=w,points=7);
draw(mass--unext,p=currentpen+dashed);

// mass
real mr = 0.25;
filldraw(circle(mass,mr),fillpen=white,drawpen=black);



