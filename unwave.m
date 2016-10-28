function ret = unwave(x, num) 
  %x is the vector of values [(a+b)/2, b-a], num is the number of transforms
  for n = num-1:-1:0 % transform num times
    for i = 0:columns(x)/pow2(n+1)-1
      % calculate a from [(a+b)/2, (a-b)/2]
      x(:,pow2(n+1)*i+1) = x(:,pow2(n+1)*i+1) + x(:,pow2(n+1)*i+1+pow2(n));
      % calculate b from [a, (a-b)/2]
      x(:,pow2(n+1)*i+1+pow2(n)) = x(:,pow2(n+1)*i+1) - 2*x(:,pow2(n+1)*i+1+pow2(n));
    endfor
  endfor
  ret = x;
endfunction