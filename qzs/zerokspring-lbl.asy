
import phdfig;

pair base=(0,0);
pair fixl=(-40mm,20mm);
pair fixr=(40mm,20mm);
pair mass=(fixl+fixr)/2+(0,20mm);
pair unext=mass+(0,20mm);

real ns = 10mm;
real w = 10mm;

drawground();
drawground(fixl,angle=-90);
drawground(fixr,angle=90);

// unextended springs:
currentpen = gray(0.7);
drawspring(start=fixl,end=unext,nospring=ns,width=w,points=7);
drawspring(start=fixr,end=unext,nospring=ns,width=w,points=7);
draw(mass--unext,p=currentpen+dashed);

// springs:
currentpen = gray(0);
drawspring(start=base,end=mass,nospring=ns,width=w,points=5);
drawspring(start=fixl,end=mass,nospring=ns,width=w,points=7);
drawspring(start=fixr,end=mass,nospring=ns,width=w,points=7);

// mass
real mr = 5mm;
filldraw(circle(mass,mr),fillpen=white,drawpen=black);



