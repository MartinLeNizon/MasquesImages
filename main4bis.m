close all
clear

[im, map] = imread('GaryLarson.bmp');

im=double(im);

% Construction palette
gris=([0:255]/255)'*[1 1 1];

% Affichage image en niveaux de gris
figure(1);
image(im);
colormap(gris);

% Taille nouvelle image
S = size(im)./4;
IM = zeros(S);
IM2 = zeros(S);
for i=1:S(1)
    for j=1:S(2)
        IM(i,j) = im(4*i, 4*j);
        IM2(i,j) = floor( ( im(4*i,4*j)+im(4*i,4*j-1)+im(4*i,4*j-2)+im(4*i,4*j-3)+im(4*i-1,4*j)+im(4*i-1,4*j-1)+im(4*i-1,4*j-2)+im(4*i-1,4*j-3)+im(4*i-2,4*j)+im(4*i-2,4*j-1)+im(4*i-2,4*j-2)+im(4*i-2,4*j-3)+im(4*i-3,4*j)+im(4*i-3,4*j-1)+im(4*i-3,4*j-2)+im(4*i-3,4*j-3) )/16 );
    end
end

% Affichage image en niveaux de gris
figure(2);
image(IM);
colormap(gris);

IMfloutee = flou(IM, 3e-5);
figure(3);
image(IMfloutee);
colormap(gris);

figure(4);
image(IM2);
colormap(gris);



