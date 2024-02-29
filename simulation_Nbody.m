%% N-body simulation
% simuliramo gibanje N teles v prostoru
rng(42);
t_end = 10;

%začetni pogoji - naključno generiramo
N = 8;
mase = ones(N, 1);
pos = randn(N,3);
vel = randn(N,3);


%sproži simulacijo
tic
[T, Y] = vrni_resitev(mase, pos, vel, t_end, 1);
toc




