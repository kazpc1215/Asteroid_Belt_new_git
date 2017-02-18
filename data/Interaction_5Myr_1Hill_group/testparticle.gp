reset
set term aqua dashed

set xl "semi-major axis[AU]" font "Times-Roman,30"
set yl "ecc" font "Times-Roman,30"
set xtics font "Times-Roman,30"
set ytics font "Times-Roman,30"
set title font "Times-Roman,25"
#set key font "Times-Roman,25"
set yr [0:0.5]
unset key
set lmargin 11
set tmargin 2
set title offset 0,-1.5
set yl offset -1,0

n = 2
j = 0

while (n<=2){
unset label
unset arrow

NUfile = "nu_SAT.dat"
NU6 = system("cat " . NUfile . " | awk \'NR==" . n . "{printf(\"%f\", $2" . ")}\'")
NU16 = system("cat " . NUfile . " | awk \'NR==" . n . "{printf(\"%f\", $3" . ")}\'")


JUPfile = "./N100_1/Jupiter.dat"
JUP_AXIS = system("cat " . JUPfile . " | awk \'NR==" . n . "{printf(\"%f\", $3" . ")}\'")

JUP_RH = system("cat " . JUPfile . " | awk \'NR==" . n . "{printf(\"%f\", $8" . ")}\'")

TIME = system("cat " . JUPfile . " | awk \'NR==" . n . "{printf(\"%e\", $1" . ")}\'")

TIME = TIME/2.0/pi/1000000.0 
set title sprintf("Time %.3f [Myr]",TIME)

unset surface
set contour
set cntrparam bspline
set cntrparam order 10
#set cntrparam levels incremental 2.8, 0.05, 3.2
set samples 1000
set isosamples 100
unset surface
set view 0,0
set xr [0:7]
set yr [0:1]
set zr [0:5]
I = 0.0
#
JUP_cont1RH = JUP_AXIS/(JUP_AXIS-JUP_RH) + 2.0*sqrt((JUP_AXIS-JUP_RH)/JUP_AXIS)
JUP_cont4RH = JUP_AXIS/(JUP_AXIS-4.0*JUP_RH) + 2.0*sqrt((JUP_AXIS-4.0*JUP_RH)/JUP_AXIS)
JUP_cont10RH = JUP_AXIS/(JUP_AXIS-10.0*JUP_RH) + 2.0*sqrt((JUP_AXIS-10.0*JUP_RH)/JUP_AXIS)
set cntrparam levels discrete JUP_cont1RH, JUP_cont4RH, JUP_cont10RH
set table "Jacobi_contour_JUP" 
splot JUP_AXIS/x+2.0*sqrt(x/JUP_AXIS)*sqrt(1.0-y*y)*cos(I)
unset table

JUP_RESO21 = (1.0/2.0)**(2.0/3.0)*JUP_AXIS
JUP_RESO52 = (2.0/5.0)**(2.0/3.0)*JUP_AXIS
JUP_RESO31 = (1.0/3.0)**(2.0/3.0)*JUP_AXIS


set arrow 1 from JUP_RESO21,0 to JUP_RESO21,0.6 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 2 from JUP_RESO52,0 to JUP_RESO52,0.6 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 3 from JUP_RESO31,0 to JUP_RESO31,0.6 nohead dt 2 lw 2 lc rgb "gray50"
#set arrow 4 from NU6,0 to NU6,0.8 nohead dt 2 lw 2 lc rgb "gray50"
set arrow 5 from NU16,0 to NU16,0.8 nohead dt 2 lw 2 lc rgb "gray50"


set label "2:1" center at JUP_RESO21,0.62 font "Times-Roman,25"
set label "5:2" center at JUP_RESO52,0.62 font "Times-Roman,25"
set label "3:1" center at JUP_RESO31,0.62 font "Times-Roman,25"
#set label "{/Symbol n}_6" center at NU6,0.84 font "Times-Roman,25"
set label "{/Symbol n}_{16}" center at NU16,0.84 font "Times-Roman,25"

set xr [1.5:6]


#plot for [i=1:100] sprintf("./N100_1/test_particle%03d.dat",i) every ::j::j u 3:2 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_2/test_particle%03d.dat",i) every ::j::j u 3:2 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_3/test_particle%03d.dat",i) every ::j::j u 3:2 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_4/test_particle%03d.dat",i) every ::j::j u 3:2 w p pt 5 lc rgb "black",\
"./N100_1/Jupiter.dat" every ::j::j u 3:2:8 w circle lt 1,\
"./N100_1/Saturn.dat" every ::j::j u 3:2:8 w circle lt 2,\
"./N100_1/Uranus.dat" every ::j::j u 3:2:8 w circle lt 3,\
"./N100_1/Neptune.dat" every ::j::j u 3:2:8 w circle lt 4,\
JUP_AXIS/x - 1.0 lt 1 dt 2
#"Jacobi_contour_JUP" u 1:2 w l dt 2 lt 1 lw 2



set yl "inc[rad]"
plot for [i=1:100] sprintf("./N100_1/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_2/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_3/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_4/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_5/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_6/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_7/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
for [i=1:100] sprintf("./N100_8/test_particle%03d.dat",i) every ::j::j u 3:5 w p pt 5 lc rgb "black",\
"./N100_1/Jupiter.dat" every ::j::j u 3:5:8 w circle lt 1,\
"./N100_1/Saturn.dat" every ::j::j u 3:5:8 w circle lt 2,\
"./N100_1/Uranus.dat" every ::j::j u 3:5:8 w circle lt 3,\
"./N100_1/Neptune.dat" every ::j::j u 3:5:8 w circle lt 4

n = n + 1
j = j + 1
}




