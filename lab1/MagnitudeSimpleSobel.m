im = double(imread('images/circle.tif'));
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255])
axis image; axis off; title('original image'); colorbar
cd = [1 0 -1]/2;

sobelx = conv2(cd, [1;2;1]/4);

imdx = conv2(im,cd,'same');
subplot(2,2,3), imagesc(imdx, [0 160])
axis image; axis off; title('imdx image'); colorbar

imsx = conv2(im, sobelx,'same');
subplot(2,2,4), imagesc(imsx, [0 160])
axis image; axis off; title('sobelx image'); colorbar

figure(2)
colormap(gray(256))

subplot(1,2,1), imagesc(imdx, [75 160])
axis image; axis off; title('imdx image'); colorbar

subplot(1,2,2), imagesc(imsx, [75 160])
axis image; axis off; title('sobelx image'); colorbar
