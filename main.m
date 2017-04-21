sourceImage = imread('img/1.jpg');
grayScale = rgb2gray(sourceImage);

scrambledImage = scramble(grayScale);

descrambledImage = descramble(scrambledImage);

figure('Name','Source Image');
imshow(grayScale)

figure('Name','Scrambled Image');
imshow(scrambledImage)

figure('Name','Descrambled Image');
imshow(descrambledImage)