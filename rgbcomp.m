% Load image
img = imread("standard pictures/kodim23.png");
%img = imread("capo2.jpg");

factor = 0.5;

img = im2double(img);
comp = compressRGB(img,factor);

% Display result
imshow([img, comp]);