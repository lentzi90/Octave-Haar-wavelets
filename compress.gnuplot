unset colorbox;
unset key; unset tics; unset border;
set pal def (0 "white", 1 "black");
set yrange [*:*] reverse;
set terminal pdfcairo;
set output "comp.pdf";
f(x) = abs(x)>0 ? 1 : 0;
plot 'Data/compressed.mat' using 1:2:(f($3)) matrix with image;
