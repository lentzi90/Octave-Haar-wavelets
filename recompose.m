function result = recompose(img)
  % Number of transforms
  num = log(columns(img))/log(2);
  % Transpose image first to unwave columns.
  img = img';
  result = unwave(img, num);
  % Back to normal rotation.
  img = result';
  result = unwave(img, num);
endfunction