
import phdfig;

unitsize(1cm);

// major axes
pair massgap = (0,2);
pair blockw = (2,0);
pair blockh = (0,2);
pair condw = (0.2,0);
pair condh = (0,1.8);
pair mag = (1,1);
pair maggap = (0.5,0);
pair arrowgap = (-0.2,0);
pair arrowh = (0,0.7);
pair magdist = massgap+blockh/2+blockw/2+condw+maggap+(mag.x/2,0);

drawspring(start=(0,0),end=massgap,nospring=0.3,width=0.8,points=5);

path block = (0,0) -- blockw -- blockw+blockh -- blockh -- cycle;
path cond = (0,0) -- condw -- condw+condh -- condh -- cycle;
path motion = (0,0) -- arrowgap -- arrowgap+arrowh;

draw(shift(massgap-0.5*blockw)*block);
filldraw(shift(massgap+0.5*blockw+0.5*(blockh-condh))*cond,lightgrey);
draw(shift(massgap+blockh/2-blockw/2)*motion,Arrow);

magnet2d(mag.x,mag.y,magdist,180);

drawground(width=1,wlen=0.2);
