
%Vizualizimi i një imazhi në shkallë gri
D = imread('tulipan.jpg');
Dgray = rgb2gray(D);
subplot (1, 2, 1); imshow(D); title ('Imazhi Origjinal');
subplot (1, 2, 2); imshow (Dgray); title ('Imazhi në Shkallë Gri');


%Shfaqja e informatave të imazhit dhe ruajtja në një format tjetër
D = imread('tulipan.jpg');      
imfinfo('tulipan.jpg')          
imwrite(D, 'tulipan.png');      


%Simulimi i një imazhi me matrice të rastësishme
A = randi ([0, 255], 10, 10);   
D = imread('tulipan.jpg');
subplot(2, 2, 1); imagesc(A); title('Matricë rastësishme - imagesc');
subplot(2, 2, 2); imshow(uint8(A)); title('Matricë rastësishme - imshow');
subplot(2, 2, 3); imagesc(D); title('Imazhi tulipan.jpg - imagesc');
subplot(2, 2, 4); imshow(D); title('Imazhi tulipan.jpg - imshow');


%Shtimi i një shiriti ngjyrash
D = imread('tulipan.jpg');
figure; 
subplot(1, 2, 1); 
imagesc(D); 
title('Imazhi tulipan.jpg - imagesc');
colorbar; 
subplot(1, 2, 2); 
imshow(D); 
title('Imazhi tulipan.jpg - imshow');
colorbar; 


%Shfaqja e imazheve në grid
image = imread('tulipan.jpg');
gray_image = rgb2gray(image);
colormap_image = gray2ind (gray_image, 256); 
colormap_image = ind2rgb (colormap_image, parula(256)); 
figure;
subplot (1, 3, 1); imshow(image); title('Original');
subplot (1, 3, 2); imshow(gray_image); title('Grayscale');
subplot (1, 3, 3); imshow(colormap_image); title ('Colormap - Parula');
figure;
subplot (3, 1, 1); imshow(image); title('Original');
subplot (3, 1, 2); imshow(gray_image); title('Grayscale');
subplot (3, 1, 3); imshow(colormap_image); title ('Colormap - Parula');


%Manipulimi i pikselëve
tulip_image = imread('tulipan.jpg');
figure;
imshow(tulip_image);
title ('Imazhi Origjinal');
tulip_image(100, 100, :) = [255, 0, 0];
tulip_image(98:102, 98:102, :) = repmat(reshape([0, 255, 0], 1, 1, 3), [5, 5]);
figure;
imshow(tulip_image);
title ('Imazhi I Modifikuar');



%Shfaqja e kanaleve RGB individualisht
img = imread('tulipan.jpg');
figure;
subplot (1, 3, 1); imshow(img(:, :, 1)); title('Kanali i Kuq');
subplot (1, 3, 2); imshow(img(:, :, 2)); title('Kanali i Gjelbër');
subplot (1, 3, 3); imshow(img(:, :, 3)); title('Kanali i Kaltër');



%Konvertimi i imazhit
img = imread('tulipan.jpg'); 
img_gray = rgb2gray(img);
img_hsv = rgb2hsv(img);
subplot (1,3,1), imshow(img), title ('Imazhi origjinal');
subplot (1,3,2), imshow(img_gray), title ('Imazhi në shkallë gri');
subplot (1,3,3), imshow(img_hsv), title ('Imazhi në HSV');



%Ilustrimi i konvolucionit 2D me kernelin Gaussian
img = rgb2gray(imread('tulipan.jpg'));
h = fspecial('gaussian', [5 5], 2);
convImg = imfilter(img, h);
subplot (1, 2, 1); imshow(img); title ('Imazhi Gri');
subplot(1, 2, 2); imshow(convImg); title('Pas Konvolucionit Gaussian');



%Aplikimi i operacioneve në imazh
tulip_image = imread('tulipan.jpg');
figure;
imshow(tulip_image);
title('Imazhi Origjinal');
subtracted_image = tulip_image - 50;  
figure;
imshow(subtracted_image);
title('Zbritja nga 50');

multiplied_image = tulip_image * 1.5;  
figure;
imshow(multiplied_image);
title('Shumëzimi me 1.5');

divided_image = tulip_image / 2;  
figure;
imshow(divided_image);
title('Pjestimi me 2');

logical_image = tulip_image;
logical_image(:,:,1) = logical_image(:,:,1) & 100;  
figure;
imshow(logical_image);
title('Operacion Logjik (AND në Kuqe)');

threshold_image = tulip_image(:,:,1) > 100;  
figure;
imshow(threshold_image);
title('Thresholding');

log_image = uint8(log(1 + double(tulip_image)) * 255 / log(256));  
figure;
imshow(log_image);
title('Transformimi Logaritmik');

gamma_image = uint8(255 * (double(tulip_image) / 255) .^ 0.5);  
figure;
imshow(gamma_image);
title('Transformimi Gama');



%Histogrami dhe shtrirja e kontrastit
img = imread('tulipan.jpg');
figure;
imshow(img);
title ('Imazhi Origjinal');
figure;
imhist(img);
title ('Histogrami i Imazhit Origjinal');
low_high = stretchlim(img); 

img_adjusted = imadjust(img, low_high, []);
figure;
imshow(img_adjusted);
title ('Imazhi me Kontrast të Shtrirë');
figure;
imhist(img_adjusted);
title ('Histogrami i Imazhit të Përmirësuar');



%Përmirësimi i imazhit me metoda të ndryshme
imazhi = imread('tulipan.jpg');
imazhi_gri = rgb2gray(imazhi); 
mask = fspecial('average', [3 3]); 
imazhi_mesatar = imfilter(imazhi_gri, mask);
motion_filter = fspecial('motion', 20, 45); 
imazhi_motion = imfilter(imazhi_gri, motion_filter);
imazhi_zhurme = imnoise(imazhi_gri, 'salt & pepper', 0.02); 
imazhi_median = medfilt2(imazhi_zhurme, [3 3]); 
imazhi_skaje = edge (imazhi_gri, 'canny');
gaussian_filter = fspecial('gaussian', [5 5], 1); 
imazhi_gaussian = imfilter(imazhi_gri, gaussian_filter);
log_filter = fspecial('log', [5 5], 0.5); 
imazhi_log = imfilter(imazhi_gri, log_filter);
imazhi_zero_crossing = imbinarize(imazhi_log, 0);
figure;
subplot (3, 3, 1), imshow(imazhi), title ('Imazhi Origjinal');
subplot (3, 3, 2), imshow(imazhi_mesatar), title ('Pixel Neighbourhoods');
subplot (3, 3, 3), imshow(imazhi_motion), title ('Motion Blur');
subplot (3, 3, 4), imshow(imazhi_zhurme), title ('Noise Addition');
subplot (3, 3, 5), imshow(imazhi_median), title ('Rank Filtering');
subplot (3, 3, 6), imshow(imazhi_skaje), title ('Edge Detection');
subplot (3, 3, 7), imshow(imazhi_gaussian), title ('Gaussian Filtering');
subplot (3, 3, 8), imshow(imazhi_zero_crossing), title ('Zero-Crossing Detector');



%Rivendosja e imazhit
imazhi_origjinal = imread('tulipan.jpg');
blur_filter = fspecial('motion', 20, 45); 
imazhi_turbulluar = imfilter(imazhi_origjinal, blur_filter, 'conv', 'same');imazhi_me_zhurme = imnoise(imazhi_turbulluar, 'gaussian', 0, 0.01); 
PSF = blur_filter; 
imazhi_rivendosur = deconvreg(imazhi_me_zhurme, PSF);
figure;
subplot (2, 2, 1), imshow(imazhi_origjinal), title ('Imazhi Origjinal');
subplot (2, 2, 2), imshow(imazhi_turbulluar), title ('Imazhi me Blur');
subplot (2, 2, 3), imshow(imazhi_me_zhurme), title ('Imazhi me Blur dhe Noise');
subplot (2, 2, 4), imshow(imazhi_rivendosur, []), title('Imazhi i Rivendosur');



%Transformimet Barrel dhe Pincushion
imazhi = imread('tulipan.jpg');
imazhi_gri = rgb2gray(imazhi); 
[rows, cols] = size(imazhi_gri);
[x, y] = meshgrid(1:cols, 1:rows);
xc = cols / 2; 
yc = rows / 2; 
x_norm = (x - xc) / xc;
y_norm = (y - yc) / yc;
r = sqrt(x_norm.^2 + y_norm.^2);
factor_barrel = 1 + 0.5 * r.^2; 
x_barrel = x_norm .* factor_barrel;
y_barrel = y_norm .* factor_barrel;
factor_pincushion = 1 - 0.5 * r.^2; 
x_pincushion = x_norm .* factor_pincushion;
y_pincushion = y_norm .* factor_pincushion;
x_barrel = x_barrel * xc + xc;
y_barrel = y_barrel * yc + yc;
x_pincushion = x_pincushion * xc + xc;
y_pincushion = y_pincushion * yc + yc;
imazhi_barrel = interp2(double(imazhi_gri), x_barrel, y_barrel, 'linear', 0);
imazhi_pincushion = interp2(double(imazhi_gri), x_pincushion, y_pincushion, 'linear', 0);
figure;
subplot (1, 3, 1), imshow(imazhi_gri), title ('Imazhi Grid');
subplot (1, 3, 2), imshow(uint8(imazhi_barrel)), title ('Barrel Distortion');
subplot (1, 3, 3), imshow(uint8(imazhi_pincushion)), title ('Pincushion Distortion');



%Operacionet morfologjike
imazhi = imread('tulipan.jpg');
imazhi_gri = rgb2gray(imazhi); 
imazhi_binar = imbinarize(imazhi_gri);
SE = strel('disk', 5); 
imazhi_dilation = imdilate(imazhi_binar, SE);
imazhi_erosion = imerode(imazhi_binar, SE);
figure;
subplot (1, 3, 1), imshow(imazhi_binar), title ('Imazhi Binar');
subplot (1, 3, 2), imshow(imazhi_dilation), title ('Pas Dilation');
subplot (1, 3, 3), imshow(imazhi_erosion), title ('Pas Erosion');





