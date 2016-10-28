function ret = delintrans(x, num)
  
  detail = [];
  for n = num:-1:1;
    for i = 1:columns(x)/pow2(n)-2
      even1 = pow2(n)*(i-1)+1+pow2(n-1);
      odd1 = pow2(n)*i+1;
      even2 = pow2(n)*i+1+pow2(n-1);
      odd2 = pow2(n)*(i+1)+1;
      
      % Calculate odd
      x(:,odd1) -= (x(:,even1) + x(:,even2))/4;
      % Calculate even
      x(:,even2) += (x(:,odd1) + x(:,odd2))/2;

    endfor
  endfor
  ret = x;
endfunction