%% simulation Euler
%simulira problem treh teles pri katerem so telesa ves čas kolinearna
%to je rešitev Eulerjevega problema

% zacetni podatki
mase = [3; 2; 1];
pos = [-0.8821567671 0 0; 0.5178432329 0 0; 1.6107838353 0 0];
vel = [-0.2792477603 0.6557964988 -0.7057254136; 0.1639238834 0.01 0.4142745864; 0.5098955142 -1.1974588179 1.2886270682];
t_end = 2.5;

%simulacija
[T, Y] = vrni_resitev(mase, pos, vel, t_end, 1);