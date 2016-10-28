unset colorbox;
unset key; unset tics; unset border;
set pal def (0 "yellow", 1 "black");
set yrange [*:*] reverse;
set terminal pdfcairo;
set output "smile.pdf";
plot 'Data/smile.mat' matrix with image;
