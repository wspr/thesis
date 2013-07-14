
settings.prc=false;
settings.render=0;

import phdfig;
import three;

size(4cm,4cm);
currentprojection=orthographic(2,2,2,up=Y);

real Nm = 17, Nr = 2, Nz = 5;

real rm = 1, rc=2, Rc=2.5;
real dz = 3, lm = 2, lc = 2;

for (int nm=0; nm <= Nm; ++nm) {
  draw(circle((0,0,dz+nm*lm/Nm),rm,normal=Z));
}
for (int nz=0; nz <= Nz; ++nz) {
for (int nr=0; nr <= Nr; ++nr) {
  draw(circle((0,0,nz*lc/Nz),rc+(Rc-rc)*nr/Nr,normal=Z));
}
}

