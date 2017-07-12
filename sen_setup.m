function data = sen_setup()

adr=[72; 73; 74; 75; 76; 77; 78; 79]


for i=1:8
	i;
	dev=i2c('/dev/i2c-2', adr(i));
	printf('Gerät da\n');
	i2c_write(dev, uint8(hex2dec('22')));
	#i2c_write(dev, uint8(hex2dec('AC1')))
	i2c_write(dev, uint8([172 13]));
	printf('Greife auf Configregister zu\n');
	#bit7 - read-only Conversation complete
	#bit6 - Temp High Flag
	#bit5 - Temp Low Flag
	#bit4 - read-only NV Memory Busy
	#bit3 - Res-Bit1
	#bit2 - Res-Bit0 (00->9bit, 01->10bit, 10->11bit, 11->12bit)
	#bit1 - Thermostat on/off
	#bit0 - 1SHOT mode on/off
	
	#i2c_write(dev, uint8(bin2dec('10001101')))
	#i2c_write(dev, uint8(hex2dec('1')))
	printf('Schreibe Register\n');
	i2c_write(dev, uint8(hex2dec('AC')));
	printf('Greife in Configregister\n');
	data(i)=i2c_read(dev, 1);
	printf('Lese Configregister\n');
	i2c_close(dev);
	
end

end
