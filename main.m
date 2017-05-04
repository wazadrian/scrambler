sourceImage = imread('img/3small.png');

heightImage = size(sourceImage,1);
widthImage = size(sourceImage,2);

grayScale = rgb2gray(sourceImage);
rcGrayScale = repcounter(grayScale);

scrambledImage = scramble(grayScale);
rcScrambledImage = repcounter(scrambledImage);

descrambledImage = descramble(scrambledImage);
rcDescrambledImage = repcounter(descrambledImage);

figure('Name','Source Image');
subplot(3,1,1); 
imshow(grayScale)

subplot(3,1,2);
imhist(grayScale)

subplot(3,1,3);
x = 1:1:widthImage;
histogram(rcGrayScale,x)
bar(x,rcGrayScale)

figure('Name','Scrambled Image');
subplot(3,1,1); 
imshow(scrambledImage)

subplot(3,1,2);
imhist(scrambledImage)

subplot(3,1,3);
x = 1:1:widthImage;
histogram(rcScrambledImage,x)
bar(x,rcScrambledImage)

figure('Name','Descrambled Image');
subplot(3,1,1); 
imshow(descrambledImage)

subplot(3,1,2);
imhist(descrambledImage)

subplot(3,1,3);
x = 1:1:widthImage;
histogram(rcDescrambledImage,x)
bar(x,rcDescrambledImage)
