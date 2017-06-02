
prompt = {'Enter file name:','Scrambler Type(SES/V34/V34A/HDMI/DVB):','Maximum bits in a row without errors:','Probability of desynchronization:'};
dialogTitle = 'Input';
numberLines = 1;
defaultAnswers = {'6.png','SES','8','0.05'};
input = inputdlg(prompt,dialogTitle,numberLines,defaultAnswers);

if size(input)== 0
    return;
end
file = cell2mat(strcat('img/',input(1)));
scramblerType = cell2mat(input(2));

bitsinrow = str2double(input(3));
probability = str2double(input(4));
sourceImage = imread(file);

heightImage = size(sourceImage,1);
widthImage = size(sourceImage,2);

grayScale = rgb2gray(sourceImage);
rcGrayScale = repcounterb(grayScale);

if strcmp(scramblerType,'V34')
    scrambledImage = scramblerV34(grayScale);
elseif strcmp(scramblerType,'V34A')
    scrambledImage = scramblerV34A(grayScale);
elseif strcmp(scramblerType,'HDMI')
    scrambledImage = scramblerHDMI(grayScale);
elseif strcmp(scramblerType,'DVB')
scrambledImage = scramblerDVB(grayScale);
else
    scrambledImage = scramblerSES(grayScale); %scrambler domyslny
end
rcScrambledImage = repcounterb(scrambledImage);
disp('original image')
receivedPicture = desynchronizeb(grayScale,bitsinrow,probability);
rcReceivedPicture = repcounterb(receivedPicture);


%descrambledImage = descramble(scrambledImage);
%rcDescrambledImage = repcounter(descrambledImage);
disp('scrambled image')
receivedScrambledPicture = desynchronizeb(scrambledImage,bitsinrow,probability);

if strcmp(scramblerType,'V34')
    receivedDescrambledPicture = descramblerV34(receivedScrambledPicture);
elseif strcmp(scramblerType,'V34A')
    receivedDescrambledPicture = descramblerV34A(receivedScrambledPicture);
elseif strcmp(scramblerType,'HDMI')
    receivedDescrambledPicture = descramblerHDMI(receivedScrambledPicture);
elseif strcmp(scramblerType,'DVB')
    receivedDescrambledPicture = scramblerDVB(receivedScrambledPicture);
else
    receivedDescrambledPicture = descramblerSES(receivedScrambledPicture); %scrambler domyslny
end
%rcReceivedDescrambledPicture = repcounter(receivedDescrambledPicture);

figure('Name','Source Image');
subplot(3,1,1); 
imshow(grayScale)

subplot(3,1,2);
imhist(grayScale)

subplot(3,1,3);
x = 1:1:widthImage;
bar(x,rcGrayScale)

figure('Name','Scrambled Image');
subplot(3,1,1); 
imshow(scrambledImage)

subplot(3,1,2);
imhist(scrambledImage)

subplot(3,1,3);
x = 1:1:widthImage;
bar(x,rcScrambledImage)

figure('Name','Received Image');
%subplot(3,1,1); 
imshow(receivedPicture)

%subplot(3,1,2);
%imhist(receivedPicture)

%subplot(3,1,3);
%x = 1:1:widthImage;
%bar(x,rcReceivedPicture)

figure('Name','Received descrambled Image');
%subplot(3,1,1); 
imshow(receivedDescrambledPicture)

%subplot(3,1,2);
%imhist(receivedDescrambledPicture)

%subplot(3,1,3);
%x = 1:1:widthImage;
%bar(x,rcReceivedDescrambledPicture)
