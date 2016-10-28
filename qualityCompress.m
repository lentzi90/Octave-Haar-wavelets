function result = qualityCompress(img, n = 1)
  % Compresses the image until the norm of the difference
  % to the original image is more than n.
  % TODO: Add padding!
  
  diffnorm = 0;
  fact = 0.1;
  
  % Decompose image
  [decomp, appr, detail] = decompose(img);
  
  % Zero out appr to protect it in the compression
  num = log(rows(decomp))/log(2);
  decomp(1,:) = 0;
  
  while diffnorm < n
    % Compress the decomposed image
    decomp = compress(decomp,fact);
    % Calculate diffnorm
    diff = img - recompose([appr;decomp(2:end,:)]);
    diffnorm = norm(diff,2)
  endwhile
  
  result = recompose([appr;decomp(2:end,:)]);
endfunction