function [even,odd] = split(x)
  even = x(2:2:end);
  odd = x(1:2:end);
endfunction