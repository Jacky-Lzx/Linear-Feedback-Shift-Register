function num_arr = LFSR_num_output(seed, polynomial)
    bits_arr = LFSR(seed, polynomial);
    len = size(bits_arr, 1);
    num_arr = zeros(1, len);
    for i = 1:len
        num_arr(i) = get_num(bits_arr(i,:));
    end
end

function result = get_num(binary)
    len = size(binary, 2);
    result = 0;
    multiplier = 1;
    for i = len:-1:1
        result = result + multiplier * binary(i);
        multiplier = multiplier * 2;
    end
end