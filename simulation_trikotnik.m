%% simulation trikotnik
%simulira problem treh teles kjer so telesa ves čas oglišča
%enakostraničnega trikotnika

%zacetni podatki
t_end = 10;
pos = [-0.0833 0.7217 0; -0.5833 -0.1443 0; 0.4167 -0.1443 0];
vel = [-2.7678 0.7959 0; -0.6464 -0.4289 0; -0.6464 2.0206 0];
mase = [1; 1; 1];

%simulacija
[T, Y] = vrni_resitev(mase, pos, vel, t_end, 1);