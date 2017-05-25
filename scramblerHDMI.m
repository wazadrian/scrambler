function [retval] = scramblerHDMI (image)

m = size(image,1);
n = size(image,2);


retval = de2bi(image);
key = [1 0 1 0 1 0 1 0 1 0 1 1 1 1 0 1];

for i = 1:n*m
   for b = 1:8
       
   bit = key(16);
   
   retval(i,b) = xor(bit, retval(i,b));
   
   key = circshift(key,1);
   key(13) = xor(key(1),key(13));
   key(12) = xor(key(1),key(12));
   key(11) = xor(key(1),key(11));
    
    end    
end    

retval= reshape(bi2de(retval),[m,n]);

disp('done scrambling')
end