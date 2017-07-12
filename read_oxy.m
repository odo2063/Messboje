function [oxy temp]=read_oxy()
x=real(dlmread('/home/chip/boje/datalog8', '\t',2,0));
oxy=x(1,3);
temp=x(1,7);
end
