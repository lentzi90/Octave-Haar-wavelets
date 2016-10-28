num = 2;
lim = 64; #Must be power of 2!
st = 1;

x = 1:st:lim;
#x1 = linspace((1+2*num)/2, lim, lim/pow2(num))
x1 = linspace(1, lim, lim/pow2(num));

y = log(x);
#y = [8.0, 4.0, 1.0, 3.0, 5.0, 2.0, 3.0, 4.0];
[r, appr] = wave(y, num);
graphics_toolkit('gnuplot')
[xstair, ystair] = stairs(x, y);
[x1stairs, apprstairs] = stairs(x1, appr);
plot(x1stairs,apprstairs,"r", xstair, ystair)
%plot(x1, appr, "r", x, y)