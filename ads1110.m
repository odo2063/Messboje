clear
close all

V=1;#1=00, 2=01, 4=10, 8=11
y=0
while(y<1)

test=i2c('/dev/i2c-1',bin2dec('1001000'));
i2c_write(test,uint8(bin2dec('10011100')));
tic;

for x=1:1e2
i2c_write(test,uint8(bin2dec('10011100')));
usleep(67000);
blub(x,:)=i2c_read (test,3);
time(x)=toc;

end

i2c_close (test)

#erg=bin2dec(strcat(dec2bin(blub(:,1), '00000000')) + uint16(blub(:,2));
jo=double(uint16(bin2dec(strcat(dec2bin(blub(:,1)),'00000000')))+uint16(blub(:,2)));

for x=1:length(jo)
	if jo(x)>=2^15
		jo(x)=jo(x)-2^16;
	end
end

erg=(jo/2^15)*2.048*V;
#(erg./(32768.*V)).*2.048
y=y+1

figure(1)
plot(time,erg,'*')
axis([min(time) max(time) min(erg) max(erg)])
grid minor
end
#>>> string='1111'
#string = 1111
#>>> bin2dec(string)
#ans =  15
#>>> bin2dec(string(2:end))
#ans =  7
#>>> string='11111111'
#string = 11111111
#>>> bin2dec(string)
#ans =  255
#>>> int8(bin2dec(string))
#ans = 127
#>>> string='01111111'
#string = 01111111
#>>> int8(bin2dec(string))
#ans = 127