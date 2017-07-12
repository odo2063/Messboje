#!/usr/bin/octave-cli
graphics_toolkit ('gnuplot')

cd /home/chip/boje

data=read_sensors;

t=clock;
date1='01-Jan-2017';
day_count=daysact(date1,date);

if (t(4)==0)
	csvwrite(strcat('/home/chip/boje/html/data/',num2str(day_count),'.csv'),data);
else
	bigdata=csvread(strcat('/home/chip/boje/html/data/',num2str(day_count),'.csv'));
	bigdata=[bigdata; data];
	csvwrite(strcat('/home/chip/boje/html/data/',num2str(day_count),'.csv'),bigdata);
end

create_plots(day_count);

cd html
system("tar -jcf zip/data.tar.bz2 data/");
system("tar -jcf zip/plots.tar.bz2 plots/");
