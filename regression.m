n=input('number of data points: ');
D=zeros(2,n);
for i=1:n
    fprintf('\ninput x%d',i)
    D(1,i)=input(' : ');
    fprintf('input y%d',i)
    D(2,i)=input(' : ');
end
I=0; j=1; DatMat=zeros(5,5); deg=0; Y=zeros(1,5); coeff=zeros(5,5);
for i=1:5
while deg<=(4+I)
    DatMat(i,j)=sum((D(1,:).^deg));
    deg=deg+1;
    j=j+1;
end
j=1;
I=I+1;
deg=I;
Y(i)=sum(D(2,:).*(D(1,:).^(deg-1)));
end
sy=sum((D(2,:)-(sum(D(2,:))/n)).^2);
for i=1:4
X=DatMat((1:i+1),(1:i+1));
B=Y(1:i+1);
A=mldivide(X,B');
fprintf('\ncoeffecients for %d degree polynomial regression (a0 to a%d)',i,i)
fprintf('a0 = %f\n',A(1));
for j=1:(i+1)
    fprintf('a%d = %f\n',(j-1),A(j));
end
coeff(i,1:i+1)=A;
end 
 syms x
 i=[(D(1,1)-5):0.1:(D(1,n)+5)];
 figure
 scatter(D(1,:),D(2,:)) , grid on
 hold on
 f(x)=coeff(1,1:2)*[1,x]';
 e2=sum((D(2,:)-f(D(1,:))).^2);
 r2=(sy-e2)/sy;
 fprintf('\nregression coeffecient of 1st order: %f',r2)
 plot(i,f(i)) , grid on 
 hold on
 f(x)=coeff(2,1:3)*[1,x,x^2]';
 e2=sum((D(2,:)-f(D(1,:))).^2);
 r2=(sy-e2)/sy;
 fprintf('\nregression coeffecient of 2nd order: %f',r2)
 plot(i,f(i)) , grid on
 hold on
 f(x)=coeff(3,1:4)*[1,x,x^2,x^3]';
 e2=sum((D(2,:)-f(D(1,:))).^2);
 r2=(sy-e2)/sy;
 fprintf('\nregression coeffecient of 3rd order: %f',r2)
 plot(i,f(i)) , grid on
 hold on
 f(x)=coeff(4,1:5)*[1,x,x^2,x^3,x^4]';
 e2=sum((D(2,:)-f(D(1,:))).^2);
 r2=(sy-e2)/sy;
 fprintf('\nregression coeffecient of 4th order: %f',r2)
 plot(i,f(i)) , grid on
 hold off
 legend('actual scatter','1st deg','2nd deg','3rd deg','4th deg')