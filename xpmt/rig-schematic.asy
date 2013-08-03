
texpreamble("
  \providecommand\BlockInertiaLength{a}
  \providecommand\BlockInertiaHeight{b}
  \providecommand\BlockInertiaOffset{d}
  \providecommand\LengthRigMagnets{ L_m }
  \providecommand\HeightRigMagnets{ h_m }
  \providecommand\LengthSensor{ L_s }
  \providecommand\HeightSensor{ h_s }
  \providecommand\HeightRig{ H }
  \providecommand\OriginBeam{ o_b }
  \providecommand\DisplSensor{ x_s }
  \providecommand\OriginMagLow{ o_m }
  \providecommand\OriginMagHigh{ o_n }
  \providecommand\OriginMagGap{ x_0 }
  \usepackage{minibox}
");

import phdfig;

unitsize(1mm);

real frameW = 55, frameH = 70, frameD = 5, frameT = 5, frameB = 70;
real emH = 10, emRi = 8, emRo = 12, emMagR = 5, emMagH = 6, emMagGap = 4;

real magY = 5; // height of shaker magnet above ground

real groundW = 15, groundH = 5, groundY = 5, groundWhiskers = 7;
real whiskersL = 0.6*groundH;

real beamY = 20, beamL = 1.8(frameW-frameT), beamH = 7;
real magX = 0.98beamL, magW = 5, magH = 6, magSep = 10, magGap = 3;
real suppW = 0.6*magW;
real pinY = 20, pinH = 5;

real lw_body = 1pt;
real lw_dim  = 0.4pt;
defaultpen(linewidth(lw_body));

real coilRi = 4, coilRo = 6, coilH = 7;

real sensorX = 50, sensorH = 20, sensorW = 8, sensorSuppH = 7, sensorSuppW = 3;

real a = 5pt; // arrow size
real tmp;

pair[] z=new pair[200];
path[] p;
pair O = (0,0);

// ground shaker

z[1] = O + (frameT/2,0);
z[2] = O - (frameT/2,0);
z[3] = z[1] + (0,magY);
z[4] = z[2] + (0,magY);
draw(z[1]--z[3]--z[4]--z[2]--cycle); // shaker magnet support

drawground(width=groundW,wlen=whiskersL,whiskers=groundWhiskers);
magnet2d(width=2emMagR,height=emMagH,dist=(0,magY+emMagH/2),magangle=90);
label("\minibox{Ground\\Shaker}",(21,magY+emMagH/2));

// shaker coil

z[9] =  (emRi, magY+emMagH+emMagGap);
z[10] = (emRo, z[9].y);
z[11] = z[10]-(0,emH);
z[12] = z[9] -(0,emH);

p = z[9]--z[10]--z[11]--z[12]--cycle^^z[9]--z[11]^^z[10]--z[12];

draw(p);
draw(shift(-2emRi-(emRo-emRi))*p);

// FRAME (bottom half)

z[13] = z[10];
z[14] = (-z[10].x,z[10].y);
z[15] = z[13]+(0,frameT);
z[16] = z[14]+(0,frameT);
z[17] = ( frameT/2,z[15].y);
z[18] = (-frameT/2,z[16].y);
z[19] = z[17] + (0,frameD);
z[20] = z[18] + (0,frameD);

// top half

z[21] = ( frameB,z[19].y);
z[22] = (-frameB,z[21].y);
z[23] = z[21] + (0,frameT);
z[24] = z[22] + (0,frameT);
z[25] = ( frameW,z[23].y);
z[26] = (-frameW,z[24].y);
z[27] = z[25] + (0,frameH);
z[28] = z[26] + (0,frameH);

draw(z[13]--z[15]--z[17]--z[19]--z[21]--z[23]--z[25]--z[27]--z[28]--z[26]--z[24]--z[22]--z[20]--z[18]--z[16]--z[14]--cycle);


// inner

// SE, SW, NE, NW
z[29] = z[25] + (-frameT,0);
z[30] = z[26] + ( frameT,0);
z[31] = z[27] - (frameT,frameT);
z[32] = z[28] + (frameT,-frameT);


// ground and springs

z[131] = 0.5*(z[23]+z[25]);
z[132] = 0.5*(z[24]+z[26]);
z[33] = z[131] + (0,frameH+groundY);
z[34] = z[132] + (0,frameH+groundY);

drawspring(z[131],z[33],points=12);
drawspring(z[132],z[34],points=12);

label(L=rotate(90)*("Support springs"),(z[131]+z[33])/2+(10,0));

drawground(z[33],angle=180,width=groundW,wlen=whiskersL,whiskers=groundWhiskers);
drawground(z[34],angle=180,width=groundW,wlen=whiskersL,whiskers=groundWhiskers);

// beam

z[35] = z[30] +  (pinH,pinY);

drawpinonly( origin = z[35],
	 height = pinH,
	 angle  = -90);

label("\minibox{Pin\\joint}",z[35],NE);

z[36] = z[35] + (beamL,0);
z[37] = z[36] + (0,-beamH);
z[38] = z[35] + (0,-beamH);

draw(z[35]--z[36]--z[37]--z[38]--cycle);

label(L="Beam",(z[35]+z[36]+z[37]+z[38])/4);

// MAGNETS

pair magCentre = z[30] + (magX,0);

// base support
z[40] = magCentre + (-suppW/2,0);
z[41] = z[40] + (suppW,0);
z[42] = (z[41].x,z[35].y) - (0,magGap+beamH+magH);
z[43] = z[42] - (suppW,0);

pair magBaseCentre = z[42]-(suppW/2,0)+(0,magH/2);

// base magnet
z[44] = (magCentre.x + magW/2 , z[43].y);
z[45] = z[44] + (0,magH);
magnet2d(width=magW,height=magH,dist=magBaseCentre,magangle=90);

// floating magnets
z[50] = z[45] + (0,magGap);
z[51] = z[50] + (0,magH);
z[52] = z[51] - (magW,0);
z[53] = z[50] - (magW,0);
p = z[50]--z[51]--z[52]--z[53]--cycle;

pair magTopCentre = z[50]+(-magW/2,2magSep+3magH+magH/2+magGap);
pair magFloatLowCentre = z[50]+(-magW/2,magH/2);
pair magFloatMidCentre = magFloatLowCentre + (0,magSep+magH);
pair magFloatHighCentre = magFloatLowCentre + (0,2magSep+2magH);

magnet2d(width=magW,height=magH,dist=magTopCentre,magangle=-90); // (:top magnet)
magnet2d(width=magW,height=magH,dist=magFloatLowCentre,magangle=-90); // (:top magnet)
magnet2d(width=magW,height=magH,dist=magFloatMidCentre,magangle=-90); // (:top magnet)
magnet2d(width=magW,height=magH,dist=magFloatHighCentre,magangle=-90); // (:top magnet)

// floating supports
z[54] = z[51] + (-magW/2+suppW/2,0);
z[55] = z[54] + (0,magSep);
z[56] = z[55] - (suppW,0);
z[57] = z[54] - (suppW,0);
p = z[54]--z[55]--z[56]--z[57]--cycle;
filldraw(p,white);
draw( shift((0,magSep+magH)) *p );

// top support
z[60] = z[50] + (-magW/2+suppW/2,2magSep+4magH+magGap);
z[61] = (z[60].x , z[31].y);
z[62] = z[61] - (suppW,0);
z[63] = z[60] - (suppW,0);




// INNER

// sensor support:
z[311] = z[32] + (sensorX,0);
z[312] = z[311] - (0,sensorSuppH);
z[313] = z[312] - (sensorSuppW,0);
z[314] = z[313] + (0,sensorSuppH);


// coil support:
pair coilCentre = z[50] + (-magW/2,magSep+1.5magH);
z[75] = coilCentre + (coilRo,suppW/2); // NW
z[76] = ( z[29].x , z[75].y ); // NE
z[77] = z[76] - (0,suppW); // SE
z[78] = z[75] - (0,suppW); // SW

draw(z[29]
     --z[77]--z[78]--z[75]--z[76]     // (:coil)
     --z[31]
     --z[61]--z[60]--z[63]--z[62]     // (:top magnet support)
     --z[311]--z[312]--z[313]--z[314] // (:sensor)
     --z[32]
     --z[30]
     --z[40]--z[43]--z[42]--z[41]     // (:bottom magnet support)
     --cycle );

label(L="Frame",z[30]/2+z[29]/2,N);

// sensor

path sens = (0,0)--(sensorW,0)--(sensorW,-sensorH)--(0,-sensorH)--cycle;
draw(shift(z[313]+(sensorSuppW/2-sensorW/2,0))*sens);

pair sensorbase = z[313]+(sensorSuppW/2,-sensorH);

// coil

z[70] = coilCentre + (coilRi,coilH/2);
z[71] = z[70] + (coilRo-coilRi,0);
z[72] = z[71] - (0,coilH);
z[73] = z[70] - (0,coilH);
p = z[70]--z[71]--z[72]--z[73]--cycle^^z[70]--z[72]^^z[71]--z[73];

draw(p);
draw( shift( (-(coilRo+coilRi),0) )*p );

// labels


draw( shift(20,0)*(z[30]--z[32]) , Arrows(a) , L="$\HeightRig$" , align=W , p=linewidth(lw_dim));

tmp = z[32].y+15;
draw( (z[35].x,tmp)--(magCentre.x,tmp) , Arrows(a) , p=linewidth(lw_dim));
label( (magCentre.x,tmp) , L="$\LengthRigMagnets$" , align=E );

tmp = z[32].y+10;
draw( (z[35].x,tmp)--(sensorbase.x,tmp) , Arrows(a) , p=linewidth(lw_dim));
label( (sensorbase.x,tmp), L="$\LengthSensor$", align=E );
label("Sensor",sensorbase-(0,2.5));

tmp = -20;
draw((tmp,z[36].y)--(tmp,sensorbase.y) , Arrows(a) , L="$\DisplSensor$" , align=W , p=linewidth(lw_dim));
draw((tmp,sensorbase.y)--(tmp,z[32].y) , Arrows(a) , L="$\HeightSensor$" , align=W , p=linewidth(lw_dim));
draw( (tmp,z[35].y) -- (tmp,z[30].y)   , Arrows(a) , L="$\OriginBeam$" , align=W , p=linewidth(lw_dim));




tmp = magBaseCentre.x - 25;
draw( shift(tmp,0)*((0,z[30].y)--(0,magBaseCentre.y+magH/2)) , Arrows(a) , L="$\OriginMagLow$",align=W, p=linewidth(lw_dim));
draw( shift(tmp,0)*((0,z[32].y)--(0,magTopCentre.y-magH/2))  , Arrows(a) , L="$\OriginMagHigh$",align=W, p=linewidth(lw_dim));

// draw( shift(5,0)*( magBaseCentre -- magFloatLowCentre ) , Arrows(a) , L="$\OriginMagGap$",align=SE, p=linewidth(lw_dim));

label( shift(-3,0)*( magBaseCentre ) , L="\minibox[r]{Lower\\magnets}", W);
label( shift(-3,0)*( magTopCentre ) , L="\minibox[r]{Upper\\magnets}", W);

draw( shift(-25,0)*( magFloatLowCentre-(0,magH/2) -- magFloatHighCentre+(0,magH/2)) , Arrows(a) , L="$\HeightRigMagnets$" , align=W , p=linewidth(lw_dim));

label(L=shift(-30,0)*rotate(90)*("Actuator"), magFloatLowCentre/2 + magFloatHighCentre/2);

