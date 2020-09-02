x=-2:1:2;
  y=sin(x.^3);
  figure;
  plot(x,y,'o'); hold on
  t=-2:0.01:2;
  plot(t,polyinterp(x,y,t),'r');
  plot(t,sin(t.^3),'g');
  legend('Puntos','Interpolacion','Curva original');