function [ N_i_m_x ] = Byangtiao( i , m  , x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 计算B样条函数的基函数 N(i,m)
% i:起点在xi m：m次
% x：输入x， 这里只能是一个标量
% 输出 N（i，m）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if fix(i) ~= i
    error('目前仅支持i为整数！！！')
end
if m<0
 error('基函数的次数m必须大于0！！！')
elseif m == 0
     if (x>=i) && (x<(i+1))
         N_i_m_x = 1;
     else
         N_i_m_x = 0;
     end
else
     N_i_m_x = (x-i)/((i+m)-i)*Byangtiao(i,m-1,x)...
         + (i+m+1-x)/((i+m+1)-(i+1))*Byangtiao(i+1,m-1,x);
end

end

