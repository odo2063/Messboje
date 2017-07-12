function sub_create_plots(day_count, anzahl)
	status=0;
	if (anzahl=='all')
		start_date='10-Jul-2017';
		anzahl=daysact(start_date,date);
		status=1;
	end
	### 7 Tage
	#data1=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-6),'.csv'));
	#data2=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-5),'.csv'));
	#data3=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-4),'.csv'));
	#data4=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-3),'.csv'));
	#data5=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-2),'.csv'));
	#data6=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-1),'.csv'));
	#data7=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count),'.csv'));
	#data=[data1; data2; data3; data4; data5; data6; data7];
	data=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-(anzahl-1)),'.csv'));
	for x=day_count-(anzahl-2):day_count
	  data1=csvread(strcat('/home/chip/boje/html/data/',num2str(x),'.csv'));
	  data=[data; data1];
	end

	if (status==1)
                anzahl=9999;
        end

	
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Sauerstoffgehalt ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Sauerstoffgehalt in %')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_sauerstoff.png"), '-color', '-dpng', '-S800,600' );
	
	# Wassertemperaturen
	h=figure("visible","off");
                #plot(data(:,1),"linewidth",5)
                pcolor(data(:,2:10)')
		shading interp
		colorbar
		title(strcat('Wassertemperatur ', num2str(anzahl), ' Tage'))
                xlabel('Stunde')
                ylabel('Abstand zum Grund')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		cbh = findobj( gcf(), 'tag', 'colorbar');
		set(cbh, 'xlabel', 'Temperatur in °C');
                grid minor
                print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_wassertemperatur.png"), '-color', '-dpng', '-S800,600' );
	
	# Lufttemperatur
# 	h=figure("visible","off");
#                 plot(data(:,11),"linewidth",3)
#                 title('Lufttemperatur 7 Tage')
#                 xlabel('Stunde')
#                 ylabel('Temperatur in °C')
# 		FS = findall(h,'-property','FontSize');
# 		set(FS,'FontSize',14);
#                 grid minor
#                 print("/home/chip/boje/html/plots/7tage_lufttemp.png", '-color', '-dpng', '-S800,600' );
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Lufttemperatur ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Temperatur in °C')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_lufttemp.png"), '-color', '-dpng', '-S800,600' );
	# Luftdruck
# 	h=figure("visible","off");
#                 plot(data(:,12),"linewidth",3)
#                 title('Luftdruck 7 Tage')
#                 xlabel('Stunde')
#                 ylabel('Luftdruck in mbar')
# 		FS = findall(h,'-property','FontSize');
# 		set(FS,'FontSize',14);
#                 grid minor
#                 print("/home/chip/boje/html/plots/7tage_luftdruck.png", '-color', '-dpng', '-S800,600' );
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Luftdruck ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Luftdruck in mbar')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_luftdruck.png"), '-color', '-dpng', '-S800,600' );
	# Luftfeuchte
# 	h=figure("visible","off");
#                 plot(data(:,13),"linewidth",3)
#                 title('Luftfeuchte 7 Tage')
#                 xlabel('Stunde')
#                 ylabel('Luftfeuchte in rel%')
# 		FS = findall(h,'-property','FontSize');
# 		set(FS,'FontSize',14);
#                 grid minor
#                 print("/home/chip/boje/html/plots/7tage_luftfeuchte.png", '-color', '-dpng', '-S800,600' );
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Luftfeuchte ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Luftfeuchte in rel%')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_luftfeuchte.png"), '-color', '-dpng', '-S800,600' );
	# Wasserleitwert
#         h=figure("visible","off");
#                 plot(data(:,14),"linewidth",3)
#                 title('Wasserleitwert 7 Tage')
#                 xlabel('Stunde')
#                 ylabel('Leitwert in S/cm')
# 		FS = findall(h,'-property','FontSize');
# 		set(FS,'FontSize',14);
#                 grid minor
#                 print("/home/chip/boje/html/plots/7tage_leitwert.png", '-color', '-dpng', '-S800,600' );
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Wasserleitwert ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Leitwert in S/cm')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_leitwert.png"), '-color', '-dpng', '-S800,600' );
	# Batterispannung
# 	h=figure("visible","off");
#                 plot(data(:,15),"linewidth",3)
#                 title('Batteriespannung 7 Tage')
#                 xlabel('Stunde')
#                 ylabel('Spannung in V')
# 		FS = findall(h,'-property','FontSize');
# 		set(FS,'FontSize',14);
#                 grid minor
#                 print("/home/chip/boje/html/plots/7tage_batteriespannung.png", '-color', '-dpng', '-S800,600' );
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Batteriespannung ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Spannung in V')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_batteriespannung.png"), '-color', '-dpng', '-S800,600' );
	# Gewässertiefe
# 	h=figure("visible","off");
#                 plot(data(:,16),"linewidth",3)
#                 title('Tiefe 7 Tage')
#                 xlabel('Stunde')
#                 ylabel('Tiefe in cm')
# 		FS = findall(h,'-property','FontSize');
# 		set(FS,'FontSize',14);
#                 grid minor
#                 print("/home/chip/boje/html/plots/7tage_Tiefe.png", '-color', '-dpng', '-S800,600' );
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title(strcat('Tiefe ', num2str(anzahl), ' Tage'))
		xlabel('Stunde')
		ylabel('Tiefe in cm')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print(strcat("/home/chip/boje/html/plots/", num2str(anzahl), "tage_tiefe.png"), '-color', '-dpng', '-S800,600' );


end







