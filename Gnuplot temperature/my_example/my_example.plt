set terminal pdfcairo enhanced color font "sans,6" fontscale 1.0 linewidth 1 rounded dashlength 1 background "white" size 25cm,15cm 
set encoding utf8
set output "my_example_global_temperature_in_years.pdf"

set style line 80 linetype 1 linecolor "#363636" linewidth 3 
set style line 81 lt 0
set style line 81 lt rgb "0x00D3D3D3"
set style line 81 lw 2.5
set grid back linestyle 81
set style line 1 lt rgb "#BB0000" lw 4 pt 0
set style line 2 lt rgb "#00BB00" lw 4 pt 0
set style line 3 lt rgb "#0000BB" lw 4 pt 0

set xtics nomirror
set ytics nomirror
set title "Global Temperature Over Several Years By Individual Models" font "sans-Bold"
set ylabel "Global temperature [°C]"
set xlabel "Time [year]"
set key bottom left Left title "Models:"

set xrange [1931:1999]
set yrange [11:14.5]

set label 11 center at graph 0.5,char 1 "DataSource: http://www.climatedata.info/temperature/data-downloads/" font ",5"
set bmargin 6

f(x) = a + b*x + c*x**2 + d*x**3
fit f(x) "data.txt" index 1 using 1:2 via a,b,c,d

plot "data.txt" index 0 title "CGCM3" w lp ls 1, \
"" index 1 title "CSIRO Mk3" with lines ls 2, \
"" index 2 title "GFDL CM2.1" with lines ls 3, f(x)

#pause -1