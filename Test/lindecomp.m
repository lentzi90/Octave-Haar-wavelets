function [result, coarser, detail] = lindecomp(img) 
  num = log(columns(img))/log(2);
  % Transform rows.
  [result, coarser, detail] = lintrans(img, num);
  % Transpose
  coarser = result';
  num = log(columns(coarser))/log(2);
  % Transform columns.
  [ret, coarser, detail] = lintrans(coarser, num);
  % Transpose back to original orientation.
  result = ret'; coarser = coarser'; detail = detail';
endfunction