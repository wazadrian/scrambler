sourceImage = imread('img/1.jpg');

heightImage = size(sourceImage,1);
widthImage = size(sourceImage,2);

grayScale = rgb2gray(sourceImage);
rcGrayScale = repcounter(grayScale);

scrambledImage = scramble(grayScale);
rcScrambledImage = repcounter(scrambledImage);

receivedPicture = desynchronize(grayScale);
rcReceivedPicture = repcounter(receivedPicture);


%descrambledImage = descramble(scrambledImage);
%rcDescrambledImage = repcounter(descrambledImage);

receivedScrambledPicture = desynchronize(scrambledImage);
receivedDescrambledPicture = descramble(receivedScrambledPicture);
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
