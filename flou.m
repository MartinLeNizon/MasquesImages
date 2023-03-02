function im_traitee = flou(im, k);

%% Filtrages

H = @(k,u,v) exp(-k*(u^2+v^2));

% Ouverture de l'image
% [im, map] = imread(s);

% Construction palette
gris=([0:255]/255)'*[1 1 1];

% Affichage de l image en niveaux de gris
% figure(1);
% image(im);
% colormap(gris);

% Passage en réels pour calcul de transformée de fourier fft2
im=double(im);
IM=fft2(im);

% Permutation des cadrans -> basses fréquences au centre de l'image
IM=fftshift(IM);

% Calcul du spectre d'amplitude recadré sur une échelle log
logIM=log(abs(IM)+1);
maxi=max(max(logIM));
mini=min(min(logIM));

% Affichage du spectre d'amplitude sous forme d'image
% figure(2);
% image((logIM-mini)/(maxi-mini)*255);
% colormap(gris);

%% Traitement
S = size(im);
for i=1:S(1)
    for j=1:S(2)
        IMT(i,j) = IM(i,j)*H(k, i-(S(1))/2, j-(S(2))/2);
    end
end

% Calcul du spectre d'amplitude recadré sur une échelle log
logIMT=log(abs(IMT)+1);
maxiT=max(max(logIMT));
miniT=min(min(logIMT));

% Affichage du spectre d'amplitude de l'image traitée sous forme d'image
% figure(3);
% image((logIMT-miniT)/(maxiT-miniT)*255);
% colormap(gris);

% Calcul de la TF inverse qui donne le résultat de l'image après traitement
im_traitee=real(ifft2(fftshift(IMT)));

% Affichage de l'image traitée
% figure(4);
% image(im_traitee);
% colormap(gris);