unset colorbox;
unset key; unset tics; unset border;
set pal def (0 "white", 1 "black");
set cbrange [0:0.07];
set yrange [*:*] reverse;
set terminal pdfcairo;
set output "decomp.pdf";
plot 'Data/decomp.mat' using 1:2:(abs($3)) matrix with image;
