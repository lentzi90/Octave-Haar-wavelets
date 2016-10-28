function [compressed, decomposed] = compressImage(img, fact)
  % Compress the image img using the compression factor fact.
  
  % Add padding if needed.
  % bottom padding
  ex = ceil(log(rows(img))/log(2)); % exponent
  paddingBottom = zeros(pow2(ex) - rows(img), columns(img));
  img = [img; paddingBottom];
  
  % padding on the side
  ex = ceil(log(columns(img))/log(2));
  paddingSide = zeros(rows(img), pow2(ex) - columns(img));
  img = [img, paddingSide];
  
  % Decompose image
  [img, appr, detail] = decompose(img);
  
  % Zero out appr in img to protect it in the compression
  num = log(rows(img))/log(2);
  img(1,:) = 0;
  
  % Compress the decomposed image
  img = compress(img,fact);
  
  % Put back appr
  img(1,:) = appr;
  
  % Decomposed image without padding
  decomposed = img(:,1:end-columns(paddingSide));
  decomposed = decomposed(1:end-rows(paddingBottom),:);
  
  % Recompose the image
  compressed = recompose(img);
  
  % Remove padding
  compressed = compressed(:,1:end-columns(paddingSide));
  compressed = compressed(1:end-rows(paddingBottom),:);
endfunction