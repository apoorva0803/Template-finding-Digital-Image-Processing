function [r,c] = i_spy ( object_im, big_im, x )

Ro = size(object_im, 1);
Co = size(object_im, 2);
Rb = size(big_im, 1);
Cb = size(big_im, 2);

o_gray = int32(object_im(:,:,3));
b_gray = int32(big_im(:,:,3));

data = x(o_gray(1)); % Find upper left matching intensity in big image

r = 0;
c = 0;
for j = 1 : length(data) % Loop over filtered pixels 
    
    row = data(j, 1);
    col = data(j, 2);
    
    if row + Ro - 1 <= Rb && col + Co -1 <= Cb
        if isequal(o_gray(1, 1), b_gray(row, col)) && ...
                isequal(o_gray(Ro , 1), b_gray(row + Ro - 1, col)) && ...
                isequal(o_gray(1 , Co), b_gray(row, col + Co -1)) && ...
                isequal(o_gray(Ro , Co), b_gray(row + Ro - 1, col + Co - 1))
            
            
            if isequal(o_gray(1:Ro, 1:Co), b_gray(row:row+(Ro-1), col:col+(Co-1)))
                r = row;
                c = col;
                return ;
            else
                r = 0;
                c = 0;
            end
        end
    end
end
end

