clear all 
yr=  @(x)  sin(x)+1+exp(sin(x));
f=@(x,y)  y.*cos(x)-sin(x).*cos(x);
dfx=@(x,y) -y.*sin(x)-(cos(x).*cos(x)-sin(x).*sin(x));
dfy=@(x,y) cos(x);
% ��������� ������� ������������� ���������������� ��������� 
% dy/dx=y.*cos(x)-sin(x).*cos(x) ������ �� ���������� [A;B] � ����� dx 
A=0.0; 
B=20.; 
dx=01; 
x=[A:dx:B]'; 
nn=size(x); 
n=nn(1); 
YR(1:1:n)=yr(x);  
% YR �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� �������������� ������� 
% y01 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ������ ������ ������ 
% y02 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� �������� ������ ������ 
% y03 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ����������� ������ ������ 
% y04 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ������ ����� 
% y05 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ������������� ������ ������ 
% y06 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ������ �����-����� ������� ������� 
% y07 �������� y �� ���������� [A;B] � ����� dx,  
 
% ���������� �� ����������������� ����� ������-�������� ������� ������� 
% y08 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ����������������� ����� ������-�������� �������� ������� 
% y09 �������� y �� ���������� [A;B] � ����� dx,  
% ���������� �� ����������������� ����� ������-�������� ���������� ������� 
y01(1)=2; 
y02(1)=2; 
y03(1)=2; 
y03(2)=y03(1)+dx*f(x(1),y03(1)); 
y04(1)=2; 
y05(1)=2; 
y06(1)=2; 
y07(1)=2; 
y08(1)=2; 
y09(1)=2; 
for i=1:1:(n-1) 
y01(i+1)=y01(i)+dx*f(x(i),y01(i)); 
y02(i+1)=(y02(i)/dx-sin(x(i+1))*cos(x(i+1)))/(1/dx-cos(x(i+1))); 
y04(i+1)=y04(i)+dx/2.*(f(x(i),y04(i))+f(x(i+1),y04(i)+dx*f(x(i),y04(i)))); 
y05(i+1)=y05(i)+dx*(f(x(i),y05(i))+dx/2.*(dfx(x(i),y05(i))+dfy(x(i),y05(i))*f(x(i),y05(i
)))); 
end 
for i=2:1:(n-1) 
y03(i+1)=y03(i-1)+2.*dx*f(x(i),y03(i)); 
end
 
err01=mean(abs(y01-YR));   
err02=mean(abs(y02-YR)); 
err03=mean(abs(y03-YR)); 
err04=mean(abs(y04-YR)); 
err05=mean(abs(y05-YR)); 
a=0.5; 
for i=1:1:(n-1) 
y06(i+1)=y06(i)+dx*((1-
a)*f(x(i),y06(i))+a*f(x(i)+dx/(2*a),y06(i)+dx/(2*a)*f(x(i),y06(i)))); 
end 
err06=mean(abs(y06-YR)); 
for i=1:1:(n-1) 
y07(i+1)=y07(i)+dx*f(x(i),y07(i)); 
y08(i+1)=y08(i)+dx*f(x(i),y08(i)); 
y09(i+1)=y09(i)+dx*f(x(i),y09(i)); 
end 
for i=2:1:(n-1) 
y07(i+1)=y07(i)+dx*(3./2.*f(x(i),y07(i))-1./2.*f(x(i-1),y07(i-1))); 
y08(i+1)=y08(i)+dx*(3./2.*f(x(i),y08(i))-1./2.*f(x(i-1),y08(i-1))); 
y09(i+1)=y09(i)+dx*(3./2.*f(x(i),y09(i))-1./2.*f(x(i-1),y09(i-1))); 
end 
err07=mean(abs(y07-YR)); 
for i=3:1:(n-1) 
y08(i+1)=y08(i)+dx*(23./12.*f(x(i),y08(i))-16./12.*f(x(i-1),y08(i-1))+5./12.*f(x(i-
2),y08(i-2))); 
y09(i+1)=y09(i)+dx*(23./12.*f(x(i),y09(i))-16./12.*f(x(i-1),y09(i-1))+5./12.*f(x(i-
2),y09(i-2))); 
end 
err08=mean(abs(y08-YR)); 
for i=4:1:(n-1) 
y09(i+1)=y09(i)+dx*(55./24.*f(x(i),y09(i))-59./24.*f(x(i-1),y09(i-1))+37./24.*f(x(i-
2),y09(i-2))-9./24.*f(x(i-3),y09(i-3))); 
end 
err09=mean(abs(y09-YR)); 
[err01 err02 err03 err04 err05 err06 err07 err08 err09]' 
figure(1) 
plot(x,YR,x,y03)