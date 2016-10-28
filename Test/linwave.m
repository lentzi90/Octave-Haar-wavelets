function x2 = linwave(x)
  x2 = zeros(1,columns(x)); % initialisera x2 (lika lang som x an sa lange)
  for n = 1:columns(x) % satter in varden fran x, x2 for ratt langd
    x2(2*n-1) = x(n);
    if n != columns(x) % kan inte interpolera efter sista x-vardet.
      x2(2*n) = (x(n)+x(n+1))/2; % interpolerar linjart
    endif
  endfor
endfunction