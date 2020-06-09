% If it is not decimal, using a heading 1/0 to express negative/positive
% Only in decimal, will have '+' and '-' sign
% example: if it is -8 (dec), it will be 110 (oct)
% if it is +8 (dec), it will be 010(oct)

p1_pos_ans = fun_p1(43.85);
p1_neg_ans = fun_p1(-43.85);

p2_pos_ans = fun_p2("0101011.11011001");
p2_neg_ans = fun_p2("1101011.11011001");

p3_1_pos_ans = fun_p3_1(43.85);
p3_1_neg_ans = fun_p3_1(-43.85);

p3_2_pos_ans = fun_p3_2("02B.D99");
p3_2_neg_ans = fun_p3_2("12B.D99");

p4_1_pos_ans = fun_p4_1(43.85, 2);
p4_1_neg_ans = fun_p4_1(-43.85, 16);

p4_2_pos_ans = fun_p4_2("075.456", 8); % change positive 75.456 (oct) to decimal 
p4_2_neg_ans = fun_p4_2("175.456", 8); % change negative 75.456 (oct) to decimal 


function [output] = fun_p1(input)
    base = 2;
    dictionary = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
    output = "";
    sign = "0";
    if input < 0
        sign = "1";
        input = abs(input);
    end
    
    decimal = floor(input);
    fraction = input-decimal;
    
    while decimal > 0
        binary = mod(decimal, base);
        output = dictionary(binary+1) + output;
        decimal = floor(decimal/base);
    end
    
    if output == ""
        output = "0.";
    else
        output = output + ".";
    end
    
    f_cnt = 0;
    while fraction > 0 && f_cnt < 8
        fraction = fraction*base;
        dec = floor(fraction);
        output = output + dictionary(dec+1);
        fraction = fraction-dec;
        f_cnt = f_cnt + 1;
    end
    
    output = sign+output;
    
end

function [output] = fun_p2(input)
    base = 2;
    sign = 1;
    dictionary = containers.Map({'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15});
    if input{1}(1) == '1'
        sign = -1;
    end
    input{1} = input{1}(2:length(input{1}));
    
    dot_idx = 1;
    
    for i=1:length(input{1})
        if input{1}(i) == '.'
            dot_idx = i;
        end
    end
    
    output = 0;
    exp = dot_idx-2;
    for i=1:length(input{1})
        if i ~= dot_idx
            output = output + power(base, exp)*dictionary(input{1}(i));
            exp = exp - 1;
        end
    end
    output = output * sign;
end

function [output] = fun_p3_1(input)
    base = 16;
    dictionary = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
    output = "";
    sign = "0";
    if input < 0
        sign = "1";
        input = abs(input);
    end
    
    decimal = floor(input);
    fraction = input-decimal;
    
    while decimal > 0
        binary = mod(decimal, base);
        output = dictionary(binary+1) + output;
        decimal = floor(decimal/base);
    end
    
    if output == ""
        output = "0.";
    else
        output = output + ".";
    end
    
    f_cnt = 0;
    while fraction > 0 && f_cnt < 3
        fraction = fraction*base;
        dec = floor(fraction);
        output = output + dictionary(dec+1);
        fraction = fraction-dec;
        f_cnt = f_cnt + 1;
    end
    
    output = sign+output;
end

function [output] = fun_p3_2(input)
    base = 16;
    sign = 1;
    dictionary = containers.Map({'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15});
    if input{1}(1) == '1'
        sign = -1;
    end
    input{1} = input{1}(2:length(input{1}));
    
    dot_idx = 1;
    
    for i=1:length(input{1})
        if input{1}(i) == '.'
            dot_idx = i;
        end
    end
    
    output = 0;
    exp = dot_idx-2;
    for i=1:length(input{1})
        if i ~= dot_idx
            output = output + power(base, exp)*dictionary(input{1}(i));
            exp = exp - 1;
        end
    end
    output = output * sign;
end

function [output] = fun_p4_1(input, N)
    base = N;
    dictionary = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
    output = "";
    sign = "0";
    if input < 0
        sign = "1";
        input = abs(input);
    end
    
    decimal = floor(input);
    fraction = input-decimal;
    
    while decimal > 0
        binary = mod(decimal, base);
        output = dictionary(binary+1) + output;
        decimal = floor(decimal/base);
    end
    
    if output == ""
        output = "0.";
    else
        output = output + ".";
    end
    
    f_cnt = 0;
    while fraction > 0 && f_cnt < 5
        fraction = fraction*base;
        dec = floor(fraction);
        output = output + dictionary(dec+1);
        fraction = fraction-dec;
        f_cnt = f_cnt + 1;
    end
    
    output = sign+output;
end

function [output] = fun_p4_2(input, N)
    base = N;
    sign = 1;
    dictionary = containers.Map({'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15});
    if N == 10
       output = input;
    else
        if input{1}(1) == '1'
            sign = -1;
        end
        input{1} = input{1}(2:length(input{1}));

        dot_idx = 1;

        for i=1:length(input{1})
            if input{1}(i) == '.'
                dot_idx = i;
            end
        end

        output = 0;
        exp = dot_idx-2;
        for i=1:length(input{1})
            if i ~= dot_idx
                output = output + power(base, exp)*dictionary(input{1}(i));
                exp = exp - 1;
            end
        end
        output = output * sign;
    end
end