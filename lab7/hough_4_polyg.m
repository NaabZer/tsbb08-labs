% Load image
% ==========================
im = imread("lab7files/polyg.tif");

figure(1);
subplot(2,3,1), imagesc(im);
axis image; axis xy; colorbar;
title("Image");

% Canny edge lines
% ========================
T = 0.45;
[cannyim1, T_aut] = edge(im, "canny", [0.4*T T]);
subplot(2,3,2), imagesc(cannyim1);
axis image; axis xy; colorbar;
title("Canny");

% Call the Hough transform
% ========================
[H,T,R] = hough(cannyim1, "Theta", -90:89);
subplot(2,3,3), imagesc(T,R,H);
xlabel("\theta"), ylabel("\rho");
title("Hough transform"), colorbar;

% Detect peaks
% ============
P  = houghpeaks(H,4,"threshold", ceil(0.5*max(H(:))));
x = T(P(:,2));
y = R(P(:,1));
hold on
plot(x,y,"s","color","red"), hold off

% Inverse Hough transform give Hough lines
% ========================================

% Small dilation to make sure lines connect
se = strel('disk',2);
into_hough = imdilate(cannyim1,se)
subplot(2,3,4), imagesc(into_hough), hold on
title("dilated"),
axis image; axis xy; colorbar;
hold off
        
lines = houghlines(into_hough,T,R,P,"FillGap",40,"MinLength",40);
% Overlay Hough lines on image
% ============================
subplot(2,3,5), imagesc(im), hold on
title("Result"),
axis image; axis xy; colorbar;
for k = 1:length(lines)
    disp(lines(k))
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),"LineWidth",2,"Color","green");
end
hold off
