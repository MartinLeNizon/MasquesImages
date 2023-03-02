function Rect = Rectangle(im)

    Rect = zeros(size(im));
    S = size(Rect);
    a = 5; b = 17;
    Rect( floor(S(1)/2)-a:floor(S(1)/2)+a, floor(S(2)/2)-b:floor(S(2)/2)+b) = 1/( 385 );
% (2*a+1)*(2*b+1)
end