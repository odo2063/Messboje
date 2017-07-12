function temp = sen_read()

adr=[72; 73; 74; 75; 76; 77; 78; 79];


for i=1:8
	i;
	dev=i2c('/dev/i2c-2', adr(i));
	
	i2c_write(dev, uint8(hex2dec('51')));
	sleep(1.5)
	i2c_write(dev, uint8(hex2dec('AA')));
	#sleep(1)
	data=i2c_read(dev, 2);
	data=dec2bin(data,8);
	data=strcat(data(1,:), data(2,:));
	temp(i)=sen2temp(data);
	
	i2c_close(dev);
	
end

end
