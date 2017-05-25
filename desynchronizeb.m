function [retval] = desynchronize (image,BITINROW,PROBABILITY)

% funkcja tworzaca szum powstajacy podczas przesy?ania
% oparty o desynchronizacje przesylu 
% Przyjete zalozenia: jezeli dany bit wystepuje wiecej niz BITINROW razy
% pojawia sie szansa na otrzymanie przeciwnego bitu.


heightImage = size(image,1);
widthImage = size(image,2);

reshapedImage = de2bi(image);
retval = reshapedImage;
lastValue = -1;
counter = 0;

for i = 1:heightImage*widthImage
    for b=1:8
        if retval(i,b)== lastValue
            counter = counter +1;
            if counter > BITINROW
                if(rand<PROBABILITY)
                    retval(i,b) = 1-retval(i,b);
                end
            end
        else
            lastValue = retval(i,b);
            counter = 1;
        end


    end
end
retval= reshape(bi2de(retval),heightImage,widthImage);

disp('done desynchronize')
end
