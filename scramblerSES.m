function [retval] = scramblerSES (image)

%http://www.etsi.org/deliver/etsi_etr/100_199/192/01_60/etr_192e01p.pdf


m = size(image,1);
n = size(image,2);

retval = de2bi(image);
key = [1 0 1 0 0 1 0 1 0 1 0 1 1 1 1 0 1 0 1 0];
clock =0;

for i = 1:n*m
   for b = 1:8
       
   bit = xor(key(3),key(20));
   key(20) = [];
   
   
   if key(1)~=1 && key(3)~=1
    clock = clock + 1;
   end
   
   if clock == 32
    clock = 0;
    bit = xor(bit, 1);
   end
   
   bit = xor(bit, retval(i,b));
   key = [bit key];
   retval(i,b) = bit; 
       
   end    
end    

retval= reshape(bi2de(retval),[m,n]);

disp('done scrambling')
end
