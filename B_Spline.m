function [ output ] = B_Spline( i,m,x )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����N_i_m��x��
% �����x������һ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len = length(x);                                                           % x�ĳ���
output = zeros(1,len);
for index = 1:len
    output(index) = Byangtiao(i,m,x(index));
end

end

