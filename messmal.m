clear all

tic
for i=1:10
	data(i,:)=sen_read;
end
toc

tic
for i=1:100
        data2(i,:)=sen_read;
end
toc


