gmt set PS_MEDIA A4
gmt makecpt -Crainbow -T0.1/500/1 -Z -Qo > EQ.cpt

earthquakefile='Station.txt'
out_ps=Earthquake.ps

gmt psbasemap -R119/123/21/26 -Jm4 -B1 -K -Xc -Yc -P > $out_ps
gmt pscoast -R -J -Df -Ia -W1 -O -K >> $out_ps
gmt psscale -Ceq.cpt -Dx8c/-1.5c+w12c/0.5c+jTC+h -Qo -Bx1+l"Vertical Peak Ground Acceleration (cm/s@+2@+)" -O -K >> $out_ps
awk -F'[,=]' 'NR>5 {print $6, $8, $14}' $earthquakefile | gmt psxy -R -J -St0.25 -Ceq.cpt -O -K >> $out_ps
echo 121.58 23.98 | gmt psxy -R -J -Sa0.5 -G255/0/0 -O -K >> $out_ps
echo 121.00 26.50 22,1,black 0 CM 2019/04/09 NO.27 Earthquake | gmt pstext -R -J -F+f+a+j -N -O >> $out_ps
