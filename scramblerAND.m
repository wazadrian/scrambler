function [retval] = scramblerAND (image)

%nie dzia³a proof of concept
%zostawiam by pokazaæ ¿e nie ka¿dy uk³ad logiczny dzia³a

m = size(image,1);
n = size(image,2);


retval = de2bi(image);


key = [1 0 1 0 0 1 0 1 0 1 0 1 1 1 1 0 1 0 1 0 1 1 1];

for i = 1:n*m
   for b = 1:8
       
    bit = and(key(18),key(23));
    key(23) = [];
    bit = and(bit, retval(i,b));
    key = [bit key];
    retval(i,b) = bit;
   
    end    
end    

retval= reshape(bi2de(retval),[m,n]);

disp('done scrambling')
end