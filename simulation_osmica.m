%% osmica simulacija
%simulira problem treh teles pri katerem se telesa gibljejo po osmici

%zacetni podatki
t_end = 60; 
mase = [1; 1; 1]; 
pos = [-0.97000436 0.24308753 0; 0.97000436 -0.24308753 0; 0 0 0];
vel = [-0.93240737/2 -0.86473146/2 0; -0.93240737/2 -0.86473146/2 0; 0.93240737 0.86473146 0];

%simulacija
[T, Y] = vrni_resitev(mase, pos, vel, t_end, 1);
