function [retval] = repcounter (image)

% funkcja zlicza wystapienia takich samych pixeli obok siebie poziomo.
% W celu unikniecia zbyt duzej ilosci pustych kolumn przyjeto zalozenie, 
% ktore powoduje zerowanie licznika jesli ilosc powarzajacych sie pikseli 
% jest wieksza niz szerokosc zdjecia.
% 

heightImage = size(image,1);
widthImage = size(image,2);

retval = zeros(1,widthImage);
reshapedImage = reshape(image,1,widthImage*heightImage);
lastValue = -1;
counter = 0;
for i = 1:heightImage*widthImage
    if reshapedImage(i)== lastValue
        counter = counter + 1;
        if counter>widthImage-1
            retval(counter) = retval(counter) + 1;     
            counter = 1;
        end
    elseif lastValue == -1
        lastValue = reshapedImage(i);
        counter = counter + 1;
    else     
        retval(counter) = retval(counter) + 1;     
        lastValue = reshapedImage(i);
        counter = 1;
    end      
end
retval(counter) = retval(counter) + 1; 

disp('done counting')
end
