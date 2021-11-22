Img = imread('cameraman.tif');

figure,imshow(Img);
gaussianFilter(Img);


function gaussianFilter(Img)
I = double(Img);
sigma = 1;
[x,y]=meshgrid(-10:10,-10:10);
M = size(x,1)-1;
N = size(y,1)-1;
expo = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(expo)/(2*pi*sigma*sigma);
Output=zeros(size(I));
I = padarray(I,[10 10]);
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        Output(i,j)=sum(Temp(:));
    end
end
Output = uint8(Output);
figure,imshow(Output);

end
