function x2 = cubic(x)
  x2 = zeros(1,columns(x)); % initialisera x2 (lika lang som x an sa lange)
  for n = 1:columns(x) % satter in varden fran x, x2 for ratt langd
    x2(2*n-1) = x(n);
  endfor
  for n = 3:columns(x)-1
    x2(2*n-2) = -1/16*x(n-2)+9/16*x(n-1)+9/16*x(n)-1/16*x(n+1);
  endfor
  x2(1:3) = linwave(x(1:2));
  x2(end-2:end) = linwave(x(end-1:end));
endfunction