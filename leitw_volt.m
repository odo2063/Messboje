function erg=leitw_volt()
V=1;#1=00, 2=01, 4=10, 8=11
y=1;

#erzeuge Objekt mit dem gesprochen werden soll
test=i2c('/dev/i2c-1',bin2dec('1001000'));
#Sage Opjekt es soll einmal messen (ADS1110)
i2c_write(test,uint8(bin2dec('10011100')));
#Warte bis Messung fertig ist
usleep(67000);
#Hole Messergebnis
blub(y,:)=i2c_read (test,3);
#Schließe Opjekt
i2c_close (test)
#Extrahiere Messdaten aus empfangenen Bytes
jo=double(uint16(bin2dec(strcat(dec2bin(blub(:,1)),'00000000')))+uint16(blub(:,2)));
#Umrechnen der Messwerte
for x=1:length(jo)
	if jo(x)>=2^15
		jo(x)=jo(x)-2^16;
	end
end

erg=(jo/2^15)*2.048*V;


end
