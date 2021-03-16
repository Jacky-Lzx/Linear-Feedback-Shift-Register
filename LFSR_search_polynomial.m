function poly_num_arr = LFSR_search_polynomial(n)
    raw = 1:1:n - 1;
    seed = zeros(1, n);
    seed(n) = 1;

    poly_2bit_arr = zeros(2^n, n);
    index = 1;
    for i = 1:1:n - 1
        poly_test = nchoosek(raw, i);
        len = size(poly_test);
        for j = 1:1:len
            result = LFSR(seed, poly_test(j, :));
            if size(result, 1) == (2 ^ n - 1)
                for k = 1:1:i
                    poly_2bit_arr(index, poly_test(j, k)) = 1;
                end
                poly_2bit_arr(index, n) = 1;
                index = index + 1;
            end
        end
    end
    
    poly_2bit_arr = poly_2bit_arr(1:index - 1,:);


    poly_num_arr = zeros(index - 1, n);
    for i = 1:index - 1
        t = 1;
        for j = 1:n
            if poly_2bit_arr(i, j) == 1
                poly_num_arr(i, t) = j;
                t = t + 1;
            end
        end
    end

end