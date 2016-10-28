% this is for testing

img = imread("capo.jpg");
img = rgb2gray(img);
img = im2double(img);

  ex = ceil(log(rows(img))/log(2)); % exponent
  paddingBottom = zeros(pow2(ex) - rows(img), columns(img));
  img = [img; paddingBottom];
  
  % padding on the side
  ex = ceil(log(columns(img))/log(2));
  paddingSide = zeros(rows(img), pow2(ex) - columns(img));
  img = [img, paddingSide];

decomp = decompose(img);

decomp = decomp(:,1:end-columns(paddingSide));
decomp = decomp(1:end-rows(paddingBottom),:);