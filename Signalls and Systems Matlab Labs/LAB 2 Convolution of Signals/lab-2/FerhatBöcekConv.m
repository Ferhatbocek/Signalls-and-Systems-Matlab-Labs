function [y] = EmirhanTasdevirenConv(x, h)
    total_len = length(x) + length(h) - 1;
    h_pad = [h, zeros(1, length(x) - 1)];
    x_pad = [x, zeros(1, length(h) - 1)];

    y = zeros(1, total_len);

    for i = 1:total_len
        for j = 1:i
            y(i) = y(i) + x_pad(j) * h_pad(i - j + 1);
        end
    end
end

