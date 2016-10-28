function [ret, appr, detail] = wave(x, num)
  % Transforms the vector x num times.
  % ret = the vector transformed in place
  % appr = the approximation given by the averages
  % detail = the detail coefficients
  detail = [];
  for n = 1:num % transform num times
    % number of columns is halved each time
    for i = 0:columns(x)/pow2(n)-1 
      % detail coefficients: [a, b] -> [a, (a-b)/2]
      x(:,pow2(n)*i+1+pow2(n-1)) = (x(:,pow2(n)*i+1) - x(:,pow2(n)*i+1+pow2(n-1)))/2;
      % avrages: [a, (a-b)/2] -> [(a+b)/2, (a-b)/2]
      x(:,pow2(n)*i+1) = x(:,pow2(n)*i+1) - x(:,pow2(n)*i+1+pow2(n-1));
    endfor
    detail = [x(:,linspace(1+pow2(n-1),columns(x)-pow2(n-1)+1,columns(x)/pow2(n))), detail];
  endfor
  ret = x;
  appr = x(:,linspace(1, columns(x)-pow2(num)+1, columns(x)/pow2(num)));
endfunction
