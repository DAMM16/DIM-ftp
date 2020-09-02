fvdp = @(t,y) [exp(-0.05*t)*cos(t)];

opt = odeset ("OutputFcn", @odeplot, "RelTol", 1e-10);
sol = ode45 (fvdp, [0 50*pi], [2], opt);