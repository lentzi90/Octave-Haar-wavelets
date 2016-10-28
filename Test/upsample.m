function a = upsample(x, num) # num is the number of times to double the sampling
  a = zeros(1, pow2(num)*columns(x));
  for i = 0:columns(x)-1
    #a(2*i+1) = x(i+1);
    #a(2*i+2) = x(i+1);
    for n = 1:pow2(num)
      a(2*num*i+n) = x(i+1);
    endfor
  endfor

endfunction