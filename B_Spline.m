function [ output ] = B_Spline( i,m,x )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 计算N_i_m（x）
% 这里的x可以是一个矩阵
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len = length(x);                                                           % x的长度
output = zeros(1,len);
for index = 1:len
    output(index) = Byangtiao(i,m,x(index));
end

end

