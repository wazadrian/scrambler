function [retval] = descramble (image)

m = size(image,1);
n = size(image,2);


retval = de2bi(image);


key = [1 0 1 0 0 1 0 1 0 1 0 1 1 1 1 0 1 0 1 0 1 1 1];

for i = 1:n*m
for b = 1:8
bit = xor(key(18),key(23));
key(23) = [];
bit = xor(bit, retval(i,b));
key = [retval(i,b) key];
retval(i,b) = bit; 
end    
end    

retval= reshape(bi2de(retval),[m,n]);

disp('done re-scrambling')
end
