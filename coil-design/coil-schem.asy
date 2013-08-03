import phdfig;

texpreamble("
\providecommand\dispaxial{z}
\providecommand\oradiusMag{r_m}
\providecommand\lengthCoil{L_c}
\providecommand\lengthMag{L_m}
\providecommand\iradiusCoil{r_c}
\providecommand\oradiusCoil{R_c}
\providecommand\turnsZCoil{N_z}
\providecommand\turnsRCoil{N_r}
");

size(8cm,8cm);
real as=4pt;
real Lc=14, Lm=12, Lgap=15, Disp=20;
real Rm=5, Ri=7, Ro=12, Rg=Ro-Ri;
real offset=2, vcnt = Ro+2*offset, hcnt=-Lc/2-3*offset;

draw((0,0)--(0,vcnt),dashed+grey);
draw((Disp,0)--(Disp,vcnt),dashed+grey);
draw((Disp-Lm/2,0)--(hcnt,0),dashdotted+grey);

coilxo(Ri,Ro,Lc,(0,0));
magnet2d(Lm,2*Rm,(Disp,0),0,0);

draw((0,Ro+offset)--(Disp,Ro+offset),Arrow(size=as),L="$\dispaxial$",align=N);

draw( (Disp+Lm/2+offset,-Rm) -- (Disp+Lm/2+offset,Rm), Arrows(size=as),L="$2\oradiusMag$",align=E );

draw( (-Lc/2,-Ro-offset)--(Lc/2,-Ro-offset) , Arrows(size=as),L="$\lengthCoil$",align=S);
draw( (Disp-Lm/2,-Rm-offset)--(Disp+Lm/2,-Rm-offset) , Arrows(size=as),L="$\lengthMag$",align=S);

draw( (hcnt+2*offset,0)--(hcnt+2*offset,-Ri) , Arrow(size=as), L="$\iradiusCoil$", align=E );
draw( (hcnt+offset,0)--(hcnt+offset,-Ro) , Arrow(size=as), L="$\oradiusCoil$", align=W );

draw( (-Lc/2+Rg/6,-Ri+Rg/6) --
      (-Lc/2+Rg/6,-Ri+2*Rg/6) --
      (+Lc/2-Rg/6,-Ri+2*Rg/6) --
      (+Lc/2-Rg/6,-Ri+Rg/6)
    , L="$\turnsZCoil$", align=N
);

draw( (+Lc/2+Rg/6,  -Ri-Rg/6) --
      (+Lc/2+2*Rg/6,-Ri-Rg/6) --
      (+Lc/2+2*Rg/6,-Ro+Rg/6) --
      (+Lc/2+Rg/6,  -Ro+Rg/6)
    , L="$\turnsRCoil$", align=E
);
