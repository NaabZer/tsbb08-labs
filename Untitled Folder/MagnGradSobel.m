Im = double(imread('lab7files/hus.tif'));

sobelx = [1 0 -1; 2 0 -2; 1 0 -1] /8;
Imsobelx = conv2(Im, sobelx, 'same');
sobely = sobelx';
Imsobely = conv2(Im, sobely, 'same');
Imgrad = sqrt(Imsobelx.^2+Imsobely.^2);
maxv = max(Imgrad(:));
binvect = [0:maxv/100:maxv];
histo = hist(Imgrad(:), binvect);

T=22;
ImgradT = Imgrad>T;
Imskel = bwmorph(ImgradT, 'skel', inf);

figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(Im, [0 255])
axis image; axis off; title('image'); colorbar;
subplot(2,2,2), imagesc(Imgrad)
axis image; axis off; title('magngrad'); colorbar;
subplot(2,2,3), plot(binvect, histo, '.-b');
axis tight; title('histogram')
subplot(2,2,4), imagesc(ImgradT)
axis image; axis off; title('threshholded'); colorbar;



figure(2)
colormap(gray(256))
subplot(1,1,1), imagesc(Imskel)
axis image; axis off; title('skeleton'); colorbar;

[cannyim1, T_aut] = edge(Im, 'canny');
figure(3)
subplot(1,1,1), imagesc(cannyim1)
title(T_aut)

T = 0.25
cannyim2 = edge(Im, 'canny', [0.4*T T])

figure(4)
subplot(1,1,1), imagesc(cannyim2)
title(T)

