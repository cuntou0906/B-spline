% x = -7:0.1:7;
% y=B_Spline(-1,2,x)
% plot(x,y)
% axis([-7 7,-3,3])

x = [0 1 2 1.5 3 4 2.5]';                                                      % �������
y = [2 2.8 1.2 6.4 4.6 2.2 0.9]';                                              % �������
m = 5;                                                                      % ����
x0 = [0,3];
[ argk , xk ] = B_Spline_fit( x , y , m, x0);                              % B�������

fit_x =-3:0.1:5;                                                           % ��������
fit_y = zeros(size(fit_x));                                                % ��ʼ��

for tt  = 1:length(xk)
    fit_y = fit_y + argk(tt,1) * B_Spline(xk(tt), m ,fit_x );
end

figure(1)
plot(fit_x,fit_y)
hold on
grid on
plot(x,y,'*')