%Compute LBP Features
function feature = GenerateGrayLBPFeatures(im, blockSize)

sizeTemp = size(im);
width = sizeTemp(2);
height = sizeTemp(1);
counter = 0;
endWidth = floor(width/blockSize)*blockSize - blockSize+1;
endHeight = floor(height/blockSize)*blockSize - blockSize+1;
im = rgb2gray(im);
%Scanning
for j=1:floor(blockSize/2):endHeight
    for i=1:floor(blockSize/2):endWidth
        cur_block = im(j:j+blockSize-1, i:i+blockSize-1, :);
        counter = counter+1;
        feature(:, counter) = LBP(cur_block);
        feature(:, counter) = feature(:, counter)/norm(feature(:, counter));
    end
end

feature = feature';
feature = feature(:);
feature = feature';
