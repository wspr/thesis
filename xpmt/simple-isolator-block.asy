
texpreamble("\
  \providecommand\laplaceBase{X}\
  \providecommand\laplaceMass{Y}\
  \providecommand\Block[1][]{G_{#1}}\
  \providecommand\BlockController{K}");

import phdfig;
import flowchart;

size(8cm);

block GAIN1=rectangle("\makebox[1cm]{$\Block[1]$}",(0,0),dx=10);
block SUM=circle("$\sum$",(1.25,0));
block GAIN2=rectangle("\makebox[1cm]{$\Block[2]$}",(2.5,0),dx=10);
block CONTROL=rectangle("\makebox[1cm]{$\BlockController$}",(2.5,-1),dx=10);

draw(GAIN1);
draw(GAIN2);
draw(SUM);
draw(CONTROL);

add(new void(frame f, transform t) {
    picture pic;

    draw(pic,
	 Label("\raisebox{0.5ex}{$s^2\laplaceBase$}",0,W),
	 path(new pair[]{GAIN1.left(t)-(30,0),GAIN1.left(t)},Vertical),
	 Arrow,PenMargin);

    draw(pic,
	 path(new pair[]{GAIN1.right(t),SUM.left(t)},Horizontal),
	 Arrow,PenMargin);

    draw(pic,
	 path(new pair[]{SUM.right(t),GAIN2.left(t)},Horizontal),
	 Arrow,PenMargin);

    draw(pic,
    	 Label("\raisebox{0.5ex}{$s^2 \laplaceMass$}",1,E),
	 path(new pair[]{GAIN2.right(t),GAIN2.right(t)+(45,0)},Horizontal),
	 Arrow,PenMargin);

    dot(pic,GAIN2.right(t)+(20,0));
    draw(pic,
	 path(new pair[]{GAIN2.right(t)+(20,0),CONTROL.right(t)},Vertical),
	 Arrow,PenMargin);

    draw(pic,
	 Label("$F$",1,SW),
	 path(new pair[]{CONTROL.left(t),SUM.bottom(t)},Horizontal),
	 Arrow,PenMargin);

    add(f,pic.fit());
});
