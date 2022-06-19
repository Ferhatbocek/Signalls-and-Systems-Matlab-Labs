function [y] = ArdaMetinAkdarconvolve(x,h)

    total_length = length(x) + length(h)-1;
    h_pad = [h, zeros(1,length(x)-1)];
    x_pad = [x, zeros(1,length(h)-1)];

    y=zeros(1,total_length);

    for i=1:total_length
        for j=1:i
            y(i)=y(i)+x_pad(j)*h_pad(1+i-j);
        end
    end
   
