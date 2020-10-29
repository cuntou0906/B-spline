function [ output , xk ] = B_Spline_fit( x , y , m, x0)
% x: 指定横坐标 y指定纵坐标 (均为一个列向量)
% m: B样条的阶数
% x0 =[x1 x2] 指定拟合的范围需要整数
% output 在多解的情况，第一列为特解 ，其余列为通解的基向量
% xk 是样条函数起点的所有取值
x1 = floor(x0(1));                                                         % 负无穷取整数
x2 = ceil(x0(2));                                                          % 正无穷取整数

xk = (x1-m):1:(x2-1);                                                      % 样条函数的 x的取值
r = length(x);                                                             % 行数
c = length(xk);                                                            % 列数
MagicA = zeros(r,c);
for i = 1:r                                                                % 初始化样条矩阵
    for j = 1:c
        MagicA(i,j) = B_Spline( xk(j) , m , x(i) );
    end
end
MagicA_b = [MagicA y];                                                     % 增广矩阵
R_A = rank(MagicA);                                                        % 样条矩阵的秩
R_A_b = rank(MagicA_b);                                                    % 增广矩阵的秩
if (R_A==R_A_b)&&(R_A ==c)                                                 % 唯一解
    output = MagicA\y;
elseif (R_A==R_A_b)&&(R_A <c)                                              % 多解
    output = MagicA\y;
    C = null(MagicA,'r');
    output = [output C];
else                                                                       % 最小二乘解
    output = MagicA\y;
    warning('拟合结果为最小二乘解，不会过所有数据点！！')
end
end

