import phdfig;

size(8cm,8cm);
real Lc=14, Lm=12, Lgap=15, Disp=20;
real Rm=5, Ri=7, Ro=12, Rg=Ro-Ri;
real offset=2, vcnt = Ro+2*offset, hcnt=-Lc/2-3*offset;

draw((0,0)--(0,vcnt),dashed+grey);
draw((Disp,0)--(Disp,vcnt),dashed+grey);
draw((Disp-Lm/2,0)--(hcnt,0),dashed+grey);

coilxo(Ri,Ro,Lc,(0,0));
magnet2d(Lm,2*Rm,(Disp,0),0,0);

draw((0,Ro+offset)--(Disp,Ro+offset),Arrow(6pt),L="$\displ$",align=N);

draw( (Disp+Lm/2+offset,-Rm) -- (Disp+Lm/2+offset,Rm), Arrows(6pt),L="$2\oradiusMag$",align=E );

draw( (-Lc/2,-Ro-offset)--(Lc/2,-Ro-offset) , Arrows(6pt),L="$\lengthCoil$",align=S);
draw( (Disp-Lm/2,-Rm-offset)--(Disp+Lm/2,-Rm-offset) , Arrows(6pt),L="$\lengthMag$",align=S);

draw( (hcnt+2*offset,0)--(hcnt+2*offset,-Ri) , Arrow(6pt), L="$\iradiusCoil$", align=E );
draw( (hcnt+offset,0)--(hcnt+offset,-Ro) , Arrow(6pt), L="$\oradiusCoil$", align=W );

draw( (-Lc/2+Rg/6,-Ri+Rg/6) -- 
      (-Lc/2+Rg/6,-Ri+2*Rg/6) --
      (+Lc/2-Rg/6,-Ri+2*Rg/6) --
      (+Lc/2-Rg/6,-Ri+Rg/6)
    , L="$N_z$", align=N
);

draw( (+Lc/2+Rg/6,  -Ri-Rg/6) --
      (+Lc/2+2*Rg/6,-Ri-Rg/6) --
      (+Lc/2+2*Rg/6,-Ro+Rg/6) --
      (+Lc/2+Rg/6,  -Ro+Rg/6)
    , L="$N_r$", align=E
);