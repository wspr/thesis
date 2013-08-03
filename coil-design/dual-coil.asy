import phdfig;

size(5cm,5cm);
real Lc=15, Lm=12.7, Lgap=15, Disp=Lc/3+Lgap/3;
real Rm=5, Ri=7, Ro=12;
real offset = 2;


draw((0,Ro)--(0,Ro+2*offset),dashed+grey);
draw((0,-Ro)--(0,-Ro-2*offset),dashed+grey);
draw((Disp,Rm)--(Disp,Ro+2*offset),dashed+grey);
draw((Lc+Lgap,Ro)--(Lc+Lgap,Ro+2*offset),dashed+grey);
draw((Lc+Lgap,-Ro)--(Lc+Lgap,-Ro-2*offset),dashed+grey);

coilxo(Ri, Ro, Lc, (0,0) );
coilxo(Ri, Ro, Lc, (Lgap+Lc,0) ,swap=true );
magnet2d(Lm,2*Rm,(Disp,0),0);

draw((0,-Ro-offset)--(Lgap+Lc,-Ro-offset),Arrows,L="\providecommand\coilDualGap{G}$\coilDualGap$",align=N);
draw((0,Ro+offset)--(Disp,Ro+offset),Arrow,L="$\dispaxial$",align=N);
