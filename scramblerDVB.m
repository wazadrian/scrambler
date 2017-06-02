function [ retval] = DVBScrambler( image)

m = size(image,1);
n = size(image,2);

key = [1 0 1 0 0 1 0 1 0 1 0 1 1 1 1 0 1 0 1 0 1 1 1];

retval = de2bi(image);
for i=1:n*m
    for b = 1:8
      bit = xor(key(18),key(23));
      key(23) = [];
      key = [bit key];
      bit = xor(bit, retval(i,b));
      retval(i,b) = bit; 
    end
end

retval= reshape(bi2de(retval),[m,n]);

disp('done scrambling')
end