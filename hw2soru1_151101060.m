Img = imread('cameraman.tif');

figure,imshow(Img);
gaussianFilter(Img);
boxFilter(Img);


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


function boxFilter(Img)
[x,y] = size(Img);
weight = 1;
I = padarray(Img,[10 10]);
for i = 1:x-1
    for j = 1:y-1
        sum = uint16(0);
        for ii = i:i+21  
            for jj = j:j+21
                sum = sum + uint16(I(ii, jj))*weight;
            end
        end
        I2(i,j) = floor(sum/(441*weight));
    end
end
I2 = uint8(I2);
figure
imshow(I2)
end