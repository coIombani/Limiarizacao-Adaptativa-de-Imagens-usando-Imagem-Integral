%Lucas Henrique Colombani dos Santos de Lima / 2265044
%Edson Pereira Rosa Júnior / 2206552
clc; clear; close all;

img = imread("img14.png");

if size(img, 3) == 3
    img = rgb2gray(img);
end

%img1: 5;10. img2: 40;5. img.14: 50;7.

s = 50; %janela
t = 7; %sensibilidade

tic;
imgBinaria = adaptiveThresholdIntegral(img, s, t);
toc;

figure(1); imshow(img); title('Original');
figure(2); imshow(imgBinaria); title(['Adaptativa (s=' num2str(s) ', t=' num2str(t) '%)']);

function output = adaptiveThresholdIntegral(input_img, s, t)
    
    img = double(input_img);
    [h, w] = size(img);
    
    intImg = cumsum(cumsum(img, 1), 2); %soma: tudo abaixo de coluna com td abaixo de linha, gerando a imagem integral
    
    output = false(h, w); %prapara uma matriz vazia de tam da imagem original
    r = floor(s/2); %raio de comparação, se 25 pixels, olhamos 12 em cada direção
    
    for i = 1:w
        for j = 1:h
            %define limites de bordas
            x1 = max(1, i - r); 
            x2 = min(w, i + r);
            y1 = max(1, j - r); 
            y2 = min(h, j + r);
            
            %pixels na janela atual
            count = (x2 - x1 + 1) * (y2 - y1 + 1);
            
            %soma da janela
            sum_val = intImg(y2, x2);
            if y1 > 1, sum_val = sum_val - intImg(y1-1, x2); end
            if x1 > 1, sum_val = sum_val - intImg(y2, x1-1); end
            if x1 > 1 && y1 > 1, sum_val = sum_val + intImg(y1-1, x1-1); end
            
            %se pixel for t% mais escuro que a média -> Preto
            if (img(j, i) * count) <= (sum_val * (100 - t) / 100)
                output(j, i) = 0;
            else
                output(j, i) = 1;
            end
        end
    end
    output = uint8(output * 255);
end