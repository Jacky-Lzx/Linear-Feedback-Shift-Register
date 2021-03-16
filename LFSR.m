function output = LFSR(seed, polynomial)
    len = size(seed, 2);
    pLen = size(polynomial, 2);
    output = zeros(2 ^ len - 1, len);
    output(1,:) = seed;
    
    count = zeros(1, 2 ^ len - 1);
    
    for i = 2:1:(2 ^ len - 1)
        for index = 2:1:len
            output(i, index) = output(i - 1, index - 1);
            t = output(i - 1, len);
            for pi = 1:1:pLen
                if (polynomial(pi) == len) || (polynomial(pi) == 0)
                    continue;
                end
                t = bitxor(t, output(i - 1, polynomial(pi)));
            end
            output(i, 1) = t;
        end
        number = get_num(output(i,:));
        if count(number) == 1
            % return when repeat happens
            % disp(i)
            output = output(1:i - 1, :);
            return
        else
            count(number) = 1;
        end
    end
end

function result = get_num(binary)
    len = size(binary, 2);
    result = 0;
    multiplier = 1;
    for i = 1:1:len
        result = result + multiplier * binary(i);
        multiplier = multiplier * 2;
    end
end