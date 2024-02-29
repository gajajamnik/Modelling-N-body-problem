
function [T, Y] = vrni_resitev(mase, zac_polozaji, zac_hitrosti, tk, plot)
%vrne resitev sistema NDE
%INPUT
%mase...vektor mas N delcev
%zac_polozaji...matrika zacetnih polozajev N delcev [x y z]
%zac_hitrosti...matrika zacetnih hitrosti N delcev [x' y' z']
%tk...koncen cas
%
%OUTPUT:
%T...vektor casov v ketrih je izracunan sistem NDE
%Y...rezultat sistema NDE, v vsaki vrstici so podatki za dolocen cas:
%    [x1 y1 z1 x1' y1' z1' x2 y2 z2 x2' ... x_N y_N z_N x_N' y_N' z_N']

%% podatki
n = 1000; %stevilo delilnih tock
t = linspace(0,tk,n); %matrika časovnih intervalov
N = length(mase); %stevilo delcev
zac_pogoji = [zac_polozaji zac_hitrosti];
zac_pogoji = reshape(zac_pogoji', [1, 6*N]); %zacetne pogoje preoblikujemo v obliko, ki jo sprejme ode

%% rešitev diferencialne enačbe
[T, Y] = ode113(@(t,Y) pospesek(t, mase, Y), t, zac_pogoji);

n = size(T, 1);

%% izrišemo graf
Y_graf = reshape(Y.', [6, N, n]); %preoblikujemo v obliko za risanje grafa

%dolocimo fiksne meje grafa
x_max = max(max(Y_graf(1, :, :)));
x_min = min(min(Y_graf(1, :, :)));
y_max = max(max(Y_graf(2, :, :)));
y_min = min(min(Y_graf(2, :, :)));
z_max = max(max(Y_graf(3, :, :)));
z_min = min(min(Y_graf(3, :, :)));


%simulacija
if plot == 1

    figure
    hold all
    grid on
    grid minor
    box on
    view(3)
    for i=1:n
        if (i~=1 && i~=n)
            plot3(Y_graf(1, :, i), Y_graf(2, :, i), Y_graf(3, :, i), 'b.', MarkerSize=3)
            xlim([x_min x_max])
            ylim([y_min y_max])
            %zlim([z_min z_max]) %zakomentiramo če je gibanje 2d
       
            pause(0.01)
        elseif(i == 1)
            %izris začetnih točk
            plot3(Y_graf(1, :, 1), Y_graf(2, :, 1), Y_graf(3, :, 1), 'g.', MarkerSize=20)
        else
            %izris končnih točk
            plot3(Y_graf(1, :, n), Y_graf(2, :, n), Y_graf(3, :, n), 'r.', MarkerSize=20)
        end
    end
    xlabel('x')
    ylabel('y')
    zlabel('z')
end

%saveas(fig, 'osmica', 'png')


end