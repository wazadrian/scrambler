sourceImage = imread('img/1.jpg');
grayScale = rgb2gray(sourceImage);

scrambledImage = scramble(grayScale);

descrambledImage = descramble(scrambledImage);

figure('Name','Source Image');
subplot(2,1,1); 
imshow(grayScale)

subplot(2,1,2);
imhist(grayScale)

figure('Name','Scrambled Image');
subplot(2,1,1); 
imshow(scrambledImage)

subplot(2,1,2);
imhist(scrambledImage)

figure('Name','Descrambled Image');
subplot(2,1,1); 
imshow(descrambledImage)

subplot(2,1,2);
imhist(descrambledImage)