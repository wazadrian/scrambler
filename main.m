sourceImage = imread('img/1.jpg');

scrambledImage = scramble(sourceImage);

descrambledImage = descramble(scrambledImage);

figure('Name','Source Image');
image(sourceImage)

figure('Name','Scrambled Image');
image(scrambledImage)

figure('Name','Descrambled Image');
image(descrambledImage)