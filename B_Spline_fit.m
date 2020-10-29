function [ output , xk ] = B_Spline_fit( x , y , m, x0)
% x: ָ�������� yָ�������� (��Ϊһ��������)
% m: B�����Ľ���
% x0 =[x1 x2] ָ����ϵķ�Χ��Ҫ����
% output �ڶ����������һ��Ϊ�ؽ� ��������Ϊͨ��Ļ�����
% xk ������������������ȡֵ
x1 = floor(x0(1));                                                         % ������ȡ����
x2 = ceil(x0(2));                                                          % ������ȡ����

xk = (x1-m):1:(x2-1);                                                      % ���������� x��ȡֵ
r = length(x);                                                             % ����
c = length(xk);                                                            % ����
MagicA = zeros(r,c);
for i = 1:r                                                                % ��ʼ����������
    for j = 1:c
        MagicA(i,j) = B_Spline( xk(j) , m , x(i) );
    end
end
MagicA_b = [MagicA y];                                                     % �������
R_A = rank(MagicA);                                                        % �����������
R_A_b = rank(MagicA_b);                                                    % ����������
if (R_A==R_A_b)&&(R_A ==c)                                                 % Ψһ��
    output = MagicA\y;
elseif (R_A==R_A_b)&&(R_A <c)                                              % ���
    output = MagicA\y;
    C = null(MagicA,'r');
    output = [output C];
else                                                                       % ��С���˽�
    output = MagicA\y;
    warning('��Ͻ��Ϊ��С���˽⣬������������ݵ㣡��')
end
end

