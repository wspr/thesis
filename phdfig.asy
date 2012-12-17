
import three;
defaultpen(fontsize(11pt));

/*******************
      Variables
 *******************/

texpreamble("
  \providecommand\ax{\mathbf x}
  \providecommand\ay{\mathbf y}
  \providecommand\az{\mathbf z}
");


/*******************
      Magnets
 *******************/

void magnet2d(real width, real height, pair dist, real magangle, real magrotate=0) {
  path magnet_path =
       (+width/2,+height/2)--(-width/2,+height/2)--
       (-width/2,-height/2)--(+width/2,-height/2)--cycle;

  real s = 0.8*min(width,height)/2;
  path arrow_path =
    (-s*Cos(magangle),-s*Sin(magangle))--
    (+s*Cos(magangle),+s*Sin(magangle));

  filldraw(shift(dist)*rotate(magrotate)*magnet_path,white,black);
  draw(shift(dist)*rotate(magrotate)*arrow_path,Arrow(arrowhead=HookHead,size=4pt));
}

void drawcube(triple c, triple o=(0,0,0)) {
  draw(shift(o)*(
    (c.x,  c.y, c.z)--
    (-c.x, c.y, c.z)--
    (-c.x,-c.y, c.z)--
    ( c.x,-c.y, c.z)--cycle));
  draw(shift(o)*(
    (c.x,  c.y,-c.z)--
    (-c.x, c.y,-c.z)--
    (-c.x,-c.y,-c.z)--
    ( c.x,-c.y,-c.z)--cycle));
  draw(shift(o)*((c.x , c.y, c.z)--( c.x, c.y,-c.z)));
  draw(shift(o)*((-c.x, c.y, c.z)--(-c.x, c.y,-c.z)));
  draw(shift(o)*((c.x ,-c.y, c.z)--( c.x,-c.y,-c.z)));
  draw(shift(o)*((-c.x,-c.y, c.z)--(-c.x,-c.y,-c.z)));
}


/*******************
        Coil
 *******************/

void coilxo(real inner, real outer, real length, pair dist, real sep = (outer-inner)/3, real xosize = (outer-inner)/15 , bool swap = false){

  path coil_path =
       (+length/2,+(outer-inner)/2)--(-length/2,+(outer-inner)/2)--
       (-length/2,-(outer-inner)/2)--(+length/2,-(outer-inner)/2)--cycle;

  draw(shift( (0,+(outer+inner)/2) + dist) *coil_path);
  draw(shift( (0,-(outer+inner)/2) + dist) *coil_path);

  real Nz = floor(length/sep);
  real Nr = floor( (outer-inner)/sep );

  path[] X = (-xosize,xosize) -- (xosize,-xosize) ^^ (-xosize,-xosize) -- (xosize,xosize);
  path[] O = scale(xosize)*unitcircle;

  pair Opadding = ( -sep*(Nz-1)/2 ,  inner+((outer-inner)-sep*(Nr-1))/2 );
  pair Xpadding = ( -sep*(Nz-1)/2 , -outer+((outer-inner)-sep*(Nr-1))/2 );

  if (swap) {
    pair tmp = Xpadding;
    Xpadding = Opadding;
    Opadding = tmp;
  }

  for(int zz=0; zz<Nz; ++zz) {
    for(int rr=0; rr<Nr; ++rr) {
      draw( shift( Xpadding+( zz*sep , rr*sep )+dist )*X );
      draw( shift( Opadding+( zz*sep , rr*sep )+dist )*O );
    }
  }

}

void coil2d_half(real width, real height, pair dist) {
  path coil_path =
       (+width/2,+height/2)--(-width/2,+height/2)--
       (-width/2,-height/2)--(+width/2,-height/2)--cycle;

  path cross_path = (+width/2,+height/2)--(-width/2,-height/2);
  draw(shift(dist)*cross_path);
  path cross_path = (-width/2,+height/2)--(+width/2,-height/2);
  draw(shift(dist)*cross_path);

  draw(shift(dist)*coil_path);
}

void coil2d(real inner, real outer, real length, pair dist){
  coil2d_half(length,outer-inner,(0,+inner+(outer-inner)/2)+dist);
  coil2d_half(length,outer-inner,(0,-inner-(outer-inner)/2)+dist);
}

void voice_coil(real Lm,real Rm,real Lc,real R1,real R2,real disp,pair origin){
  coil2d(R1,R2,Lc,origin);
  magnet2d(Lm,2*Rm,(disp,0)+origin,0);
}

void voice_coil_hole(real Lm,real Rm,real Rm_inner,real Lc,real R1,real R2,real disp,pair origin){
  coil2d(R1,R2,Lc,origin);
  magnet2d(Lm,(Rm-Rm_inner),(disp,(Rm+Rm_inner)/2)+origin,0);
  magnet2d(Lm,(Rm-Rm_inner),(disp,-(Rm+Rm_inner)/2)+origin,0);
}

void dual_coil(real Lm,real Rm,real Lc,real R1,real R2,real Gap,real Disp,pair Origin){
  coil2d(R1,R2,Lc,Origin);
  coil2d(R1,R2,Lc,Origin+(Lc+Gap,0));
  magnet2d(Lm,2*Rm,(Disp,0)+Origin,0);
}

void circle_of_circles(real N, real outerR, real centresR, real smallR, pair origin){
  draw(circle(origin,outerR));
  for (int ii=0; ii<N; ++ii){
    filldraw(circle(origin+centresR*(Cos(90+ii*360/N),Sin(90+ii*360/N)),smallR),lightgrey);
  }
}

real tesselationRadius(real R,real g,real n){
  return (R*sin(pi/n) - g/2)/(1 + sin(pi/n));
}


/*******************
     Vibrations
 *******************/

void drawspring(pair start = (0,0),
		pair end,
		string label="",
		pair labelpos=W,
		real nospring = abs(start-end)/6,
		real width =  abs(start-end)/10,
		int  points = 6 ,
		pen  springpen = defaultpen) {
  real n = ceil(points/2);
  real m = floor(points/2);
  real l = abs(start-end);
  real h = l-2*nospring;
  path p = (0,0)--(0,nospring);
  real turnheight = h/points;

  p = p -- (width/2*(2*fmod(2,2)-1),nospring+turnheight/2);

  for(int ii=2; ii<=points; ++ii) {
    p = p -- (width/2*(2*fmod(ii+1,2)-1),nospring+turnheight*(ii-0.5));
  }

  p = p--(0,l-nospring)--(0,l);
  draw(shift(start)*rotate(degrees(end-start)-90,(0,0))*p,p=springpen);

  if ( label != "" ){
    label(label,0.5(start+end),3labelpos);
  }

}

void drawdamper( pair start = (0,0),
		 pair end = (0,40mm),
		 string label = "",
		 pair labelpos = W,
		 real width = 10mm) {

  real l = abs(start-end);
  real damph = width;
  real dh = l/2-width/2;
  real fh = dh+width/2;
  path[] p = (0,0)--
    (0,dh)^^ // lower stem
    (-width/2,dh+damph)--
    (-width/2,dh)--
    (0,dh)--
    (width/2,dh)--
    (width/2,dh+damph)^^
    (0,fh)--(0,l)^^ // upper stem
    (-width/4,fh)--(width/4,fh); // upper stem bar

  draw(shift(start)*rotate(degrees(end-start)-90,(0,0))*p);

  if ( label != "" ){
    label(label,0.5(start+end),3labelpos);
  }
}

void drawmass( pair start = (0,0),
	       real height = 10mm,
	       real left = 10mm,
	       real right = 10mm,
	       string label = "",
	       pair labelpos = W ) {

  draw(shift(start)*box((-left,0),(right,height)));

  if ( label != "" ){
    label("\strut"+label,start+((right-left)/2,height/2));
  }
}

void drawinputforce
(
  pair start = (0,0),
  pair end = (0,40mm),
  string label = "",
  pair labelpos = W,
  real width = 10mm
)
{
  real l = abs(start-end);
  path[] p = (0,0)--
    (0,l/2-width/2)^^ // lower stem
    circle((end-start)/2,width/2)^^
    (0,l/2+width/2)--(0,l); // upper stem

  draw(shift(start)*rotate(degrees(end-start)-90,(0,0))*p);

  if ( label != "" ){
    label(label,0.5(start+end),3labelpos);
  }
}

void drawground
(
  real width    = 20mm,
  pair origin   = (0,0),
  real angle    = 0,
  real wlen     = 3mm,
  real whiskers = round(width/wlen),
  real slant    = 50
)
{
  real wgap = width/(whiskers-1); // gap between each whisker
  path[] p = (-width/2,0) -- (width/2,0); // ground line
  path[] w = (0,0) -- rotate(slant,(0,0))*(-wlen,0); // a single whisker
  for(int ii=0; ii<whiskers; ++ii) {
    p = p^^shift(-width/2+ii*wgap)*w; // all whiskers (single path)
  }
  draw(shift(origin)*rotate(angle,(0,0))*p);
}

void drawgroundwhiskers
(
  real width    = 20mm,
  pair origin   = (0,0),
  real angle    = 0,
  real wlen     = 3mm,
  real whiskers = round(width/wlen),
  real slant    = 50
)
{
  real wgap = width/(whiskers-1); // gap between each whisker
  path[] p;
  path[] w = (0,0) -- rotate(slant,(0,0))*(-wlen,0); // a single whisker
  for(int ii=0; ii<whiskers; ++ii) {
    p = p^^shift(-width/2+ii*wgap)*w; // all whiskers (single path)
  }
  draw(shift(origin)*rotate(angle,(0,0))*p);
}

void drawpin
(
  real height   = 20mm,
  real groundratio = 1.2,
  pair origin   = (0,0),
  real angle    = 0,
  real wlen     = 3mm,
  real whiskers = round(height/wlen),
  real slant    = 50
)
{
  real w = height/Tan(55);
  drawground(width=2w*groundratio,
	     angle=angle,
	     origin=origin+height*dir(angle-90),
	     wlen=wlen,
	     whiskers=whiskers,
	     slant=slant);
  path[] p = (-w,-height)--(w,-height)--(0,0)--cycle;
  draw(shift(origin)*rotate(angle,(0,0))*p);
  filldraw(circle(origin,height/10));
}

void drawpinonly
(
  real height   = 20mm,
  pair origin   = (0,0),
  real angle    = 0
)
{
  real w = height/Tan(55);
  path[] p = (-w,-height)--(w,-height)--(0,0)--cycle;
  draw(shift(origin)*rotate(angle,(0,0))*p);
  filldraw(circle(origin,height/10));
}

void drawmotion
(
  pair   start          ,
  real   angle    = 90  ,
  real   offset   = 1 ,
  real   length   = 1 ,
  string label    = ""  ,
  pair   labelpos = NE
)
{
  pair z1, z2, z3;
  z1 = start;
  z2 = z1+offset*dir(angle-90);
  z3 = z2+length*dir(angle);
  draw( z1--z2--z3 , Arrow );
  label(label,position=z3,align=labelpos);
}


void labeldistance
(
  pair   start ,
  pair   end   ,
  real   offset    = 0.05*length(end-start) ,
  string label     = "" ,
  pair   labelpos  = dir(degrees(end-start)-90) ,
  real   arrowsize = 8 ,
  pen    anchorpen = grey
)
{
  real ang = degrees(end-start);
  pair shift = offset*dir(ang-90);
  draw(start--start+shift,p=anchorpen);
  draw(end--end+shift,p=anchorpen);
  draw(start+shift--end+shift,Arrows(size=arrowsize),L=label,align=labelpos);
}
