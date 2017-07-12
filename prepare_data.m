function prepare_data()

date1='01-Jan-2017'

for i=0:daysact(date1,date)-1
	x=rand(24,16)
	csvwrite(strcat('html/data/',num2str(i),'.csv'),x)
end
