#function [temp pressure humidity]= env_read()
function [temp press hum]= env_read()
adr=118;

dev=i2c('/dev/i2c-2', adr);
#data=zeros(119,1);
#data_bin=zeros(119,1);

i2c_write(dev, uint8([hex2dec('f2') bin2dec('101')]));
i2c_write(dev, uint8([hex2dec('f4') bin2dec('10110101')]));
usleep(200000)
for i=1:119
	i;
	
	
	i2c_write(dev, uint8(135+i));
	#sleep(1.5)
	#i2c_write(dev, uint8(hex2dec('AA')));
	#sleep(1)
	data(i)=i2c_read(dev, 1);
	#data_bin(:,i)=dec2bin(data,8);
	#data=strcat(data(1,:), data(2,:));
	#temp(i)=sen2temp(data);
	
	
	
end
i2c_close(dev);

tempc1=bin2dec(strcat(dec2bin(data(2),8),dec2bin(data(1),8)));
tempc2=bin2dec(strcat(dec2bin(data(4),8),dec2bin(data(3),8)));
tempc3=bin2dec(strcat(dec2bin(data(6),8),dec2bin(data(5),8)));

pressc1=bin2dec(strcat(dec2bin(data(8),8),dec2bin(data(7),8)));#
pressc2=bin2dec(strcat(dec2bin(data(10),8),dec2bin(data(9),8)))-(2^16);
pressc3=bin2dec(strcat(dec2bin(data(12),8),dec2bin(data(11),8)));
pressc4=bin2dec(strcat(dec2bin(data(14),8),dec2bin(data(13),8)));
pressc5=bin2dec(strcat(dec2bin(data(16),8),dec2bin(data(15),8)))-(2^16);
pressc6=bin2dec(strcat(dec2bin(data(18),8),dec2bin(data(17),8)))-(2^16);
pressc7=bin2dec(strcat(dec2bin(data(20),8),dec2bin(data(19),8)));
pressc8=bin2dec(strcat(dec2bin(data(22),8),dec2bin(data(21),8)))-(2^16);
pressc9=bin2dec(strcat(dec2bin(data(24),8),dec2bin(data(23),8)));

humc1=bin2dec(dec2bin(data(26),8));
humc2=bin2dec(strcat(dec2bin(data(91),8),dec2bin(data(90),8)));
humc3=bin2dec(dec2bin(data(92),8));
data95=dec2bin(data(94),8);
humc4=bin2dec(strcat(dec2bin(data(93),8),data95(1:4)));
humc5=bin2dec(strcat(dec2bin(data(95),8),data95(5:8)));
humc6=bin2dec(dec2bin(data(96),8))-256;

#Temperatur ausrechnen
data117=dec2bin(data(117),8);
tempm=bin2dec(strcat(dec2bin(data(115),8),dec2bin(data(116),8),data117(5:8)));

var1=((tempm/16384)-(tempc1/1024))*tempc2;
var2=(((tempm/131072)-(tempc1/8192))^2)*tempc3;
t_fine=var1+var2;
temp=t_fine/5120;

#Druck ausrechnen
data114=dec2bin(data(114),8);
pressm=bin2dec(strcat(dec2bin(data(112),8),dec2bin(data(113),8),data114(5:8)));

var1=(t_fine/2.0)-64000;
var2=(var1*var1)*pressc6/(2^15);
var2=var2+(var1*pressc5*2);
var2=(var2/4)+(pressc4*(2^16));
var1=(((var1*var1)*pressc3/524288)+(pressc2*var1))/524288;
var1=(1+(var1/(2^15)))*pressc1;
press=(2^20)-pressm;
press=(press-(var2/4096))*6250/var1;
var1=pressc9*(press^2)/(2^31);
var2=press*pressc8/(2^15);
press=press+((var1+var2+pressc7)/16);
press=press/100;

#Luftfeuchtigkeit ausrechnen
humm=bin2dec(strcat(dec2bin(data(118),8),dec2bin(data(119),8)));

varH=t_fine-76800;
varH=(humm-(humc4*64+humc5/16384*varH))*(humc2/65536*(1+humc6/67108864*varH*(1+humc3/67108864*varH)));
hum=varH*(1-humc1*varH/524288);




end
