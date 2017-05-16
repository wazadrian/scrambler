function [retval] = desynchronize (image)

% funkcja tworzaca szum powstajacy podczas przesy?ania
% oparty o desynchronizacje przesylu 
% Przyj?te zalozenia: je?eli dany kolor wyst?puje wiecej ni? 5 razy
% pojawia sie szansa na przesuniecie pikseli w obrazie
% w celu zwalczania desynchronizacji zastosowano metode odnawiania,
% która z okreslonym czasem przywraca synchronizacje w przesyle
% w celu umo?liwienia prostej modyfikacji do testów wyszczegolniono
% zmienne dotyczace ilosci pikseli po, ktorej nastepuje synchronizacja
% oraz prawdopodobienstwo wystapienia bledu


SYNCHRONIZATION=64;
PROBALILITY=0.05;

heightImage = size(image,1);
widthImage = size(image,2);


reshapedImage = reshape(image,1,widthImage*heightImage);
retval = reshapedImage;
lastValue = -1;
counter = 0;
shift= 0;
timer = 0;

for i = 1:heightImage*widthImage
    if timer == SYNCHRONIZATION
        shift= 0;  
        timer = 0;
    end
    timer = timer + 1;
    retval(i)=reshapedImage(i-shift);
    if timer+shift>SYNCHRONIZATION
        retval(i)=255;
    end

    if reshapedImage(i)== lastValue
        counter = counter + 1;
        if counter>5
            if(rand<PROBALILITY)
            shift = shift + 1;  
            end
        end
    elseif lastValue == -1
        lastValue = reshapedImage(i);
        counter = counter + 1;
    else         
        lastValue = reshapedImage(i);
        counter = 1;
    end      
end

retval = reshape(retval,heightImage,widthImage);

disp('done desynchronize')
end
