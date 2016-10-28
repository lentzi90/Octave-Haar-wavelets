function compressed = compressRGB(img, fact)
  img = im2double(img);
  % Split into R,G and B
  imgr = img(:,:,1); imgg = img(:,:,2); imgb = img(:,:,3);
  % Compression
  compr = compressImage(imgr, fact);
  compg = compressImage(imgg, fact);
  compb = compressImage(imgb, fact);
  % Put back together
  compressed(:,:,1) = compr;
  compressed(:,:,2) = compg;
  compressed(:,:,3) = compb;
  % Fix rounding errors
  compressed = im2double(im2uint8(compressed));
endfunction