x = linspace(0, 2*pi, 10);
y = sin(x);

y2 = y;
x2 = linspace(0, 2*pi, columns(y2));

N = 4; % number of times to run cubic
for i = 1:N
  y2 = cubic(y2);
endfor
x2 = linspace(0, 2*pi, columns(y2));
plot(x,y, x2, y2, "g")