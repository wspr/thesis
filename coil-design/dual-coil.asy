import phdfig;

size(5cm,5cm);
real Lc=7, Lm=12.7, Lgap=15, Disp=Lc/3+Lgap/3;
real Rm=5, Ri=7, Ro=10;
real offset = 2, scl = 1.2;


draw((0,0)--(0,scl*Ro),dashed+grey);
draw((Disp,0)--(Disp,scl*Ro),dashed+grey);
draw((Lc+Lgap,0)--(Lc+Lgap,scl*Ro),dashed+grey);

dual_coil(Lm,Rm,Lc,Ri,Ro,Lgap,Disp,(0,0));

draw((0,-Ro-offset)--(Lgap+Lc,-Ro-offset),Arrows,L="$G$",align=N);
draw((0,Ro+offset)--(Disp,Ro+offset),Arrow,L="$d_1$",align=N);
draw((Lc+Lgap,Ro+offset)--(Disp,Ro+offset),Arrow,L="$d_2$",align=N);
