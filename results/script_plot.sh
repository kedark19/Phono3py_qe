#!bin/sh
rm -rf zkappa
n1=`grep -n 'Thermal conductivity' result | awk -F: '{print $1}' | head -1`
n2=`grep -n 'Thermal conductivity' result | awk -F: '{print $1}' | tail -1`
#n=`wc -l result | awk '{print $1}'`
l1=`expr $n1 + 1`
l2=`expr $n2 - 1`
`awk "NR>=$l1&&NR<=$l2" result  >> zkappa`
#`sed '1d' zkappa > zplot_data`
#plotting kappa
cat > plot_kappa <<EOS
#set encoding iso_8859_15
#set terminal postscript enhanced solid color "Helvetica" 17
set term pdf enhanced solid color font "Times,20" size 8.0,6.0
set output "kappa.pdf"

set label sprintf ("Lattice Thermal conductivity of Si") at screen 0.5,0.95 center font ",25 bold" textcolor rgb "blue"

set size 0.95,0.95
set xrange[100:1000]
set xlabel "Temperature (T)"
set ylabel "Lattice Thermal conductivity ({/Symbol k})"
plot "zkappa" u 1:2 w l lw 3 title sprintf("Kappa")
EOS
gnuplot plot_kappa

