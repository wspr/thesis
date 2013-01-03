size(0,6cm);

texpreamble("
\providecommand\nforceZ{f_z(d,h)}\
\providecommand\heq{h_{eq}}
\providecommand\feq{f_{eq}}
\providecommand\ngap{d}
\providecommand\mdim{a}
\providecommand\ndispZ{h}
\providecommand\dmax{\delta}
");

real ee=0.5,
heq=2,
fmin=0.5,
dmax=0.8,
gp=4,
ht=3,
xover=0.7,
xmax=gp+xover;

real u=0.6;   // axes overshoot
real fmax, feq;
real t=0.05; // tick length

path bound=(-gp,0)--(-gp,ht);
path balance=(-heq,0)--(-heq,ht);


fill((0,0)--(-ee,0)--(-ee,ht)--(0,ht)--cycle,lightgrey);
fill((-gp,0)--(-gp,ht)--(-xmax,ht)--(-xmax,0)--cycle,lightgrey);

// force curve
path force=(0,fmin){left}::(-gp-xover/2,ht);

// min/max lines
pair t1, t2;
t2=intersectionpoint(force,(-heq-dmax,0)--(-heq-dmax,ht));
t1=intersectionpoint(force,(-heq+dmax,0)--(-heq+dmax,ht));


fmax=intersectionpoint(force,bound).y;
feq =intersectionpoint(force,balance).y;

// bounds
fill((-xmax,fmax)--(0,fmax)--(0,ht)--(-xmax,ht)--cycle,lightgrey);
fill((-xmax,fmin)--(0,fmin)--(0,0)--(-xmax,0)--cycle,lightgrey);
draw((-ee,0)--(-ee,ht),grey);
draw(bound,grey);
draw((-heq,0)--(-heq,feq)--(0,feq),grey);

draw((-xmax,fmin)--(0,fmin),grey);
draw((-xmax,fmax)--(0,fmax),grey);

draw((-heq-dmax,0)--t2);
draw(t1--(t1.x,t2.y),dashed);
draw((-heq+dmax,0)--t1);
real ah=0.1;
draw(t2+(0,ah)--(t1.x,t2.y+ah),Arrows);
label("$2\dmax/\mdim$",((t1.x+t2.x)/2,t2.y+ah),N);

// bound labels
label("\vbox{\baselineskip=0.9\baselineskip\hbox{Upper}\hbox{bound}}",(-xmax,fmax),W);
label("\vbox{\baselineskip=0.9\baselineskip\hbox{Lower}\hbox{bound}}",(-xmax,fmin),W);

draw(force,linewidth(1pt)+squarecap);

// axes
draw((-xmax,0)--(u,0),Arrows(size=4pt));
draw((0,-u)--(0,ht),Arrows(size=4pt));
label("Normalised displacement, $\ndispZ$",(-xmax/2,-u));
label("\vbox{\baselineskip=0.9\baselineskip\hbox{Normalised}\hbox{force, $\nforceZ$}}",(0,0.65 ht),align=E);

// ticks
draw((-ee,-t)--(-ee,+t));
draw((-heq,-t)--(-heq,+t));
draw((-gp,-t)--(-gp,+t));
draw((-t,feq)--(t,feq));
draw((-t,-heq+dmax)--(t,-heq+dmax));

// axes labels
label("$\feq{}$",(0,feq),E);

label("\strut$-\epsilon$",(-ee,0),S);
label("\strut$\heq{}$",(-heq,0),S);
label("$\ndispZ\sb{\text{max}}$",(-heq+dmax,0),S);
label("\strut$-\ngap+1$",(-gp,0),S);
