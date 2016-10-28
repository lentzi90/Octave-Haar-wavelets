function result = compress(img, fact)
  % This function takes the decomposed image img
  % and compresses it by removing fact*total of
  % the detail coefficients.
  
  % Total numer of non zero elements.
  total = nnz(img);
  % get rid of zeros since we are looking for smallest absolute value that is non zero
  img(~img) = inf;
  
  % The compression factor. We are going to remove compFactor*total values.
  compFactor = fact;
  str = sprintf('Compression factor: %d%%',compFactor*100);
  disp(str);
  % measuring time and displaying loading bar
  barhandle = waitbar(0,'Compressing...');
  tic();
  
  % get the min values of every column and the index in the column for every value
  % colind = [index of first rows min, ind of second rows min...]
  [values, colind] = min(abs(img));
  % the global minimum value and index of the column where it is
  [minval, ind] = min(values);
  
  for i = 1:round(compFactor*total)
    % This is not needed the first time through the loop.
    % Get a new min of the column that had the global minimum.
    [values(ind), colind(ind)] = min(abs(img(:,ind)));
    % Get global minimum
    [minval, ind] = min(values);
    
    % remove the minimum
    img(colind(ind), ind) = inf;

    % update progress
    if (mod(i, 5000) == 0)
      progress = i/(compFactor*total);
      waitbar(progress, barhandle);
    endif
  endfor
  
  img(isinf(img)) = 0; % put back the zeros
  toc();
  close(barhandle);
  result = img;
endfunction