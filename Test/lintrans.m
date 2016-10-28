function [trans, appr, detail] = lintrans(x, num)
  %x = [zeros(rows(x),1), x, zeros(rows(x),1)];
  detail = [];
  for n = 1:num;
    for i = 1:columns(x)/pow2(n)-2
      even1 = pow2(n)*(i-1)+1+pow2(n-1);
      odd1 = pow2(n)*i+1;
      even2 = pow2(n)*i+1+pow2(n-1);
      odd2 = pow2(n)*(i+1)+1;
      
      % Predict even from odd and store detail.
      x(:,even2) -= (x(:,odd1) + x(:,odd2))/2;
      % Update odd.
      x(:,odd1) += (x(:,even1) + x(:,even2))/4;
    endfor
    detail = [x(:,linspace(1+pow2(n-1),columns(x)-pow2(n-1)+1,columns(x)/pow2(n))), detail];
  endfor
  appr = x(:,linspace(1, columns(x)-pow2(num)+1, columns(x)/pow2(num)));
  trans = x;
endfunction