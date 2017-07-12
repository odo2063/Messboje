function temperatur=sen2temp(hex)
  bin=hex;#dec2bin(hex);
  #temp(1)=str2num(bin(2))*2^6;
  #temp(2)=str2num(bin(3))*2^5;
  #temp(3)=str2num(bin(4))*2^4;
  #temp(4)=str2num(bin(5))*2^3;
  #temp(5)=str2num(bin(6))*2^2;
  #temp(6)=str2num(bin(7))*2^1;
  #temp(7)=str2num(bin(8))*2^0;
  #temp(8)=str2num(bin(9))*2^-1;
  #temp(9)=str2num(bin(10))*2^-2;
  #temp(10)=str2num(bin(11))*2^-3;
  #temp(11)=str2num(bin(12))*2^-4;
  
  for i=1:11
    temp(i)=str2num(bin(i+1))*2^(7-i);
  end
    
  temperatur=sum(temp);
  
  bin(1)=str2num(bin(1));
  
  if bin(1)==1
    temperatur=temperatur-128;
  end
end
  
