close all
clear

[im, map] = imread('Image_Floue.png');

im=double(im);

S = size(im);

% Construction palette
gris=([0:255]/255)'*[1 1 1];

% Affichage image en niveaux de gris
figure(1);
image(im);
colormap(gris);

% Permutation des cadrans -> basses fréquences au centre de l'image
Rect = Rectangle(im);
H = fftshift(fft2(fftshift(Rect)));

% Calcul du spectre d'amplitude recadré sur une échelle log
logRectT=log(abs(H)+1);
maxi=max(max(logRectT));
mini=min(min(logRectT));

% Affichage du spectre d'amplitude sous forme d'image
figure(2);
image((logRectT-mini)/(maxi-mini)*255);
colormap(gris);


[iref, map] = imread('Image_Ref.png');

iref = double(iref);

figure(3)
image(iref)
colormap(gris)

Iref=fftshift(fft2(iref));
Iref_floue = Iref.*H;
iref_floue = real(ifft2(fftshift(Iref_floue)));
b = iref_floue - round(iref_floue);
B = fftshift(fft2(b));

figure(4)
image(iref_floue)
colormap(gris)

% Composantes du filtre de Wiener
H_abs_2 = abs(H).^2;
Pi = abs(Iref).^2;
Pb = abs(B).^2;

% Filtre de Wiener
W = 1./H .* ( H_abs_2 ./ (H_abs_2+(Pb./Pi)) );

im_filtre_simple = real(ifft2(fftshift(fftshift(fft2(im)).*H)));
im_filtre_wiener = real(ifft2(fftshift(fftshift(fft2(im)).*W)));


figure(5)
image(im_filtre_simple)
colormap(gris)

figure(6)
image(im_filtre_wiener)
colormap(gris)





















