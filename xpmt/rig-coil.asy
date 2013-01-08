
import phdfig;

texpreamble("\
\providecommand\RadiusMag{r_m}\
\providecommand\HeightMag{h_m}\
\providecommand\RadiusICoil{r_1}\
\providecommand\RadiusOCoil{r_2}\
\providecommand\HeightCoil{h_c}\
\providecommand\GapCoil{g_c}\
");

unitsize(2mm);

real magR = 9.5/2, magH = 12.7;
real coilRi = 6, coilRo = 8, coilH = 5, coilG = magH/2;
real shimRi = 5.5, shimRo = 9, shimHx = 3;

draw((magH,0)--(27,0),grey+dashed);

real a=5pt;
real x=15;
path p = (x,0)--(x,magR);
draw(p,Arrow(a),L="$\RadiusMag$",align=E);
x = 20;
p = (x,0)--(x,coilRi);
draw(p,Arrow(a),L="$\RadiusICoil$",align=E);
x = 25;
p = (x,0)--(x,coilRo);
draw(p,Arrow(a),L="$\RadiusOCoil$",align=E);

real y = 10;
p = (-coilH/2,y)--(coilH/2,y);
draw(p,Arrows(a),L="$\strut\HeightCoil$",align=N);
p = (coilH/2+coilG,y)--(3coilH/2+coilG,y);
draw(p,Arrows(a),L="$\strut\HeightCoil$",align=N);
p = (coilH/2,y)--(coilH/2+coilG,y);
draw(p,Arrows(a),L="$\strut\GapCoil$",align=N);

y = -y;
p = (coilH/2+coilG/2-magH/2,y)--(coilH/2+coilG/2+magH/2,y);
draw(p,Arrows(a),L="$\HeightMag$",align=S);

dual_coil(Lm=magH , Rm=magR ,Lc=coilH,R1=coilRi,R2=coilRo,Gap=coilG,Disp=coilG/2+coilH/2,Origin=(0,0));

pair[] z;
z[0] = (-coilH/2-shimHx,shimRi);
z[1] = (z[0].x,shimRo);
z[2] = z[1]+(shimHx,0);
z[3] = (z[2].x,coilRi);
z[4] = z[3]+(coilH,0);
z[5] = (z[4].x,shimRo);
z[6] = z[5]+(coilG,0);
z[7] = (z[6].x,coilRi);
z[8] = z[7]+(coilH,0);
z[9] = (z[8].x,shimRo);
z[10] = z[9]+(shimHx,0);
z[11] = (z[10].x,shimRi);

draw(z[0]--z[1]--z[2]--z[3]--z[4]--z[5]--z[6]--z[7]--z[8]--z[9]--z[10]--z[11]--cycle);


z[0] = (-coilH/2-shimHx,-shimRi);
z[1] = (z[0].x,-shimRo);
z[2] = z[1]+(shimHx,0);
z[3] = (z[2].x,-coilRi);
z[4] = z[3]+(coilH,0);
z[5] = (z[4].x,-shimRo);
z[6] = z[5]+(coilG,0);
z[7] = (z[6].x,-coilRi);
z[8] = z[7]+(coilH,0);
z[9] = (z[8].x,-shimRo);
z[10] = z[9]+(shimHx,0);
z[11] = (z[10].x,-shimRi);

draw(z[0]--z[1]--z[2]--z[3]--z[4]--z[5]--z[6]--z[7]--z[8]--z[9]--z[10]--z[11]--cycle);

