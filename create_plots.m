function create_plots(day_count)
	### aktueller Tag
	data=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count),'.csv'));
	
	# Sauerstoff
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title('Sauerstoffgehalt Heute')
		xlabel('Stunde')
		ylabel('Sauerstoffgehalt in %')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print("/home/chip/boje/html/plots/heute_sauerstoff.png", '-color', '-dpng', '-S800,600' );
	
	# Wassertemperaturen
	h=figure("visible","off");
                #plot(data(:,1),"linewidth",5)
                pcolor(data(:,2:10)')
		shading interp
		colorbar
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		cbh = findobj( gcf(), 'tag', 'colorbar');
		set(cbh, 'xlabel', 'Temperatur in °C');
		title('Wassertemperatur Heute')
                xlabel('Stunde')
                ylabel('Abstand zum Grund')
                grid minor
                print("/home/chip/boje/html/plots/heute_wassertemp.png", '-color', '-dpng', '-S800,600' );
	
	# Lufttemperatur
	h=figure("visible","off");
                plot(data(:,11),"linewidth",3)
                title('Lufttemperatur Heute')
                xlabel('Stunde')
                ylabel('Temperatur in °C')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/heute_lufttemp.png", '-color', '-dpng', '-S800,600' );

	# Luftdruck
	h=figure("visible","off");
                plot(data(:,12),"linewidth",3)
                title('Luftdruck Heute')
                xlabel('Stunde')
                ylabel('Luftdruck in mbar')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/heute_luftdruck.png", '-color', '-dpng', '-S800,600' );

	# Luftfeuchte
	h=figure("visible","off");
                plot(data(:,13),"linewidth",3)
                title('Luftfeuchte Heute')
                xlabel('Stunde')
                ylabel('Luftfeuchte in rel%')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/heute_luftfeuchte.png", '-color', '-dpng', '-S800,600' );

	# Wasserleitwert
        h=figure("visible","off");
                plot(data(:,14),"linewidth",3)
                title('Wasserleitwert Heute')
                xlabel('Stunde')
                ylabel('Leitwert in S/cm')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/heute_leitwert.png", '-color', '-dpng', '-S800,600' );

	# Batterispannung
	h=figure("visible","off");
                plot(data(:,15),"linewidth",3)
                title('Batteriespannung Heute')
                xlabel('Stunde')
                ylabel('Spannung in V')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/heute_batteriespannung.png", '-color', '-dpng', '-S800,600' );

	# Gewässertiefe
	h=figure("visible","off");
                plot(data(:,16),"linewidth",3)
                title('Tiefe Heute')
                xlabel('Stunde')
                ylabel('Tiefe in cm')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/heute_Tiefe.png", '-color', '-dpng', '-S800,600' );

	### 7 Tage
	data1=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-6),'.csv'));
	data2=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-5),'.csv'));
	data3=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-4),'.csv'));
	data4=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-3),'.csv'));
	data5=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-2),'.csv'));
	data6=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count-1),'.csv'));
	data7=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count),'.csv'));
	data=[data1; data2; data3; data4; data5; data6; data7];

	# Sauerstoff
	h=figure("visible","off");
		plot(data(:,1),"linewidth",3)
		title('Sauerstoffgehalt 7 Tage')
		xlabel('Stunde')
		ylabel('Sauerstoffgehalt in %')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		grid minor
		print("/home/chip/boje/html/plots/7tage_sauerstoff.png", '-color', '-dpng', '-S800,600' );
	
	# Wassertemperaturen
	h=figure("visible","off");
                #plot(data(:,1),"linewidth",5)
                pcolor(data(:,2:10)')
		shading interp
		colorbar
		title('Wassertemperatur 7 Tage')
                xlabel('Stunde')
                ylabel('Abstand zum Grund')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
		cbh = findobj( gcf(), 'tag', 'colorbar');
		set(cbh, 'xlabel', 'Temperatur in °C');
                grid minor
                print("/home/chip/boje/html/plots/7tage_wassertemp.png", '-color', '-dpng', '-S800,600' );
	
	# Lufttemperatur
	h=figure("visible","off");
                plot(data(:,11),"linewidth",3)
                title('Lufttemperatur 7 Tage')
                xlabel('Stunde')
                ylabel('Temperatur in °C')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/7tage_lufttemp.png", '-color', '-dpng', '-S800,600' );

	# Luftdruck
	h=figure("visible","off");
                plot(data(:,12),"linewidth",3)
                title('Luftdruck 7 Tage')
                xlabel('Stunde')
                ylabel('Luftdruck in mbar')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/7tage_luftdruck.png", '-color', '-dpng', '-S800,600' );

	# Luftfeuchte
	h=figure("visible","off");
                plot(data(:,13),"linewidth",3)
                title('Luftfeuchte 7 Tage')
                xlabel('Stunde')
                ylabel('Luftfeuchte in rel%')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/7tage_luftfeuchte.png", '-color', '-dpng', '-S800,600' );

	# Wasserleitwert
        h=figure("visible","off");
                plot(data(:,14),"linewidth",3)
                title('Wasserleitwert 7 Tage')
                xlabel('Stunde')
                ylabel('Leitwert in S/cm')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/7tage_leitwert.png", '-color', '-dpng', '-S800,600' );

	# Batterispannung
	h=figure("visible","off");
                plot(data(:,15),"linewidth",3)
                title('Batteriespannung 7 Tage')
                xlabel('Stunde')
                ylabel('Spannung in V')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/7tage_batteriespannung.png", '-color', '-dpng', '-S800,600' );

	# Gewässertiefe
	h=figure("visible","off");
                plot(data(:,16),"linewidth",3)
                title('Tiefe 7 Tage')
                xlabel('Stunde')
                ylabel('Tiefe in cm')
		FS = findall(h,'-property','FontSize');
		set(FS,'FontSize',14);
                grid minor
                print("/home/chip/boje/html/plots/7tage_Tiefe.png", '-color', '-dpng', '-S800,600' );
	### 14 Tage
	sub_create_plots(day_count, 14);
	
	### 30 Tage
	sub_create_plots(day_count, 30);

	### 90 Tage
	sub_create_plots(day_count, 90);

	### 180 Tage
	#sub_create_plots(day_count, 180);

	### Alle Tage
	sub_create_plots(day_count, 'all');


end







