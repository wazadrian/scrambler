
prompt = {'Enter file name:','Scrambler Type(SES/V34/V34A):','Maximum bits in a row without errors:','Probability of desynchronization:'};
dialogTitle = 'Input';
numberLines = 1;
defaultAnswers = {'6.png','SES','8','0.05'};
input = inputdlg(prompt,dialogTitle,numberLines,defaultAnswers);

if size(input)== 0
    return;
end
file = cell2mat(strcat('img/',input(1)));
scramblerType = cell2mat(input(2));

synchronization = str2double(input(3));
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
else
    scrambledImage = scramblerSES(grayScale); %scrambler domyslny
end
rcScrambledImage = repcounterb(scrambledImage);

receivedPicture = desynchronizeb(grayScale,synchronization,probability);
rcReceivedPicture = repcounterb(receivedPicture);


%descrambledImage = descramble(scrambledImage);
%rcDescrambledImage = repcounter(descrambledImage);

receivedScrambledPicture = desynchronizeb(scrambledImage,synchronization,probability);

if strcmp(scramblerType,'V34')
    receivedDescrambledPicture = descramblerV34(receivedScrambledPicture);
elseif strcmp(scramblerType,'V34A')
    receivedDescrambledPicture = descramblerV34A(receivedScrambledPicture);
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
