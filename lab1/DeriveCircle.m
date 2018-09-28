im = double(imread('images/circle.tif'));
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255])
axis image; axis off; title('original image'); colorbar
cd = [1 0 -1]/2;
imdx = conv2(im,cd,'same');
subplot(2,2,3), imagesc(imdx, [-128 127])
axis image; axis off; title('imdx image'); colorbar

rcd = [1; 0; -1]/2;
imdy = conv2(im,rcd,'same');
subplot(2,2,4), imagesc(imdy, [-128 127])
axis image; axis off; title('imdy image'); colorbar

cd2 = conv(cd, cd);
rcd2 = conv2(rcd, rcd);

imdy2 = conv2(im, rcd2,'same');
imdx2 = conv2(im, cd2,'same');
grad = sqrt(pow2(imdx2) + pow2(imdy2));
subplot(2,2,2), imagesc(grad, [-128 127]);
axis image; axis off; title('gradient image'); colorbar