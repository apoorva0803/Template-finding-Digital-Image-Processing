

function [x] = generate_x (b_im)

img_gray = b_im(:,:,3);

img_gray = int32(img_gray);
r = size(img_gray, 1);
c = size(img_gray, 2);
x = containers.Map('KeyType','int32', 'ValueType','any');


for i = 1: r
    for j = 1: c
        if isKey(x, img_gray(i, j))
            x(img_gray(i, j)) = [x(img_gray(i, j)); [i, j];];
        else
            x(img_gray(i, j)) = [i, j];
        end
    end
end


end