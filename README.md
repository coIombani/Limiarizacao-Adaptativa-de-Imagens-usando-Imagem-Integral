# Limiarização adaptativa de imagens

Trabalho de Processamento Digital de Imagens feito em MATLAB. Calcula um limiar para cada pixel a partir da média de sua vizinhança, usando imagem integral para obter as somas das regiões. O resultado é uma imagem binária.

## Como executar

Abra a pasta no MATLAB, com a Image Processing Toolbox disponível, e execute `main.m`. Para trocar a imagem, altere a chamada `imread` e os parâmetros `s` e `t` no início do script.

| Imagem | `s` (janela) | `t` (sensibilidade em %) |
| --- | ---: | ---: |
| `img1.png` | 5 | 10 |
| `img2.png` | 40 | 5 |
| `img14.png` | 50 | 7 |

A configuração inicial usa `img14.png`. O script mostra a entrada em tons de cinza, o resultado e o tempo de processamento. Como o raio é `floor(s/2)`, `s = 50` corresponde a uma janela de 51 × 51 pixels fora das bordas.

Autores: Lucas Lima e Edson Pereira Rosa Júnior.