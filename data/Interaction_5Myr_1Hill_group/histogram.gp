reset
set term aqua dashed

set xl "semi-major axis[AU]" font "Times-Roman,30"
set yl "N" font "Times-Roman,30"
set xtics font "Times-Roman,30"
set ytics font "Times-Roman,30"
set title font "Times-Roman,25"
#set key font "Times-Roman,25"
set xr [1.5:4]
set yr [0:45]
unset key
set lmargin 11
set tmargin 2
set title offset 0,-1.5
set yl offset -1,0

n = 7

JUPfile = "./N100_1/Jupiter.dat"
JUP_AXIS = system("cat " . JUPfile . " | awk \'NR==" . n . "{printf(\"%f\", $3" . ")}\'")
#JUP_AXIS = system("cat " . JUPfile . " | awk \'END{printf(\"%f\", $3" . ")}\'")
TIME = system("cat " . JUPfile . " | awk \'NR==" . n . "{printf(\"%e\", $1" . ")}\'")
#TIME = system("cat " . JUPfile . " | awk \'END{printf(\"%e\", $1" . ")}\'")
TIME = TIME/2.0/pi/1000000.0 


NUfile = "nu_SAT.dat"
NU6 = system("cat " . NUfile . " | awk \'NR==" . n . "{printf(\"%f\", $2" . ")}\'")
NU16 = system("cat " . NUfile . " | awk \'NR==" . n . "{printf(\"%f\", $3" . ")}\'")



JUP_RESO21 = (1.0/2.0)**(2.0/3.0)*JUP_AXIS
JUP_RESO52 = (2.0/5.0)**(2.0/3.0)*JUP_AXIS
JUP_RESO31 = (1.0/3.0)**(2.0/3.0)*JUP_AXIS


set arrow 1 from JUP_RESO21,0 to JUP_RESO21,30 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 2 from JUP_RESO52,0 to JUP_RESO52,30 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 3 from JUP_RESO31,0 to JUP_RESO31,30 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 4 from NU6,0 to NU6,35 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 5 from NU16,0 to NU16,35 nohead dt 2 lw 2 lc rgb "gray50"


set label "2:1" center at JUP_RESO21,32 font "Times-Roman,25"
set label "5:2" center at JUP_RESO52,32 font "Times-Roman,25"
set label "3:1" center at JUP_RESO31,32 font "Times-Roman,25"
set label "{/Symbol n}_6" center at NU6,37 font "Times-Roman,25"
set label "{/Symbol n}_{16}" center at NU16,37 font "Times-Roman,25"


if (n == 7){
set title sprintf("Time %.3f [Myr], Total 765",TIME)
plot "mainbelt_histogram_5Myr.dat" w boxes
}
if (n == 6){
set title sprintf("Time %.3f [Myr], Total 797",TIME)
plot "mainbelt_histogram_1Myr.dat" w boxes
}
if (n == 5){
set title sprintf("Time %.3f [Myr], Total 800",TIME)
plot "mainbelt_histogram_100kyr.dat" w boxes
}
if (n == 4){
set title sprintf("Time %.3f [Myr], Total 800",TIME)
plot "mainbelt_histogram_10kyr.dat" w boxes
}
if (n == 3){
set title sprintf("Time %.3f [Myr], Total 800",TIME)
plot "mainbelt_histogram_1kyr.dat" w boxes
}
if (n == 2){
set title sprintf("Time %.3f [Myr], Total 800",TIME)
plot "mainbelt_histogram_0yr.dat" w boxes
}

