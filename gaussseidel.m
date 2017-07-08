n=input('number of variables:  ');
N=zeros(n,n+1);
for i=1:n
    fprintf('\n\ninput coeffecients of eqn%d  :::  \n',i)
for j=1:n+1
if j~=n+1
    fprintf('input coeffecint of x%d  ',j)
    N(i,j)=input(': ');
elseif j==n+1
    N(i,j)=input('input constant:  ');
end
end
end
maxitn=input('\nmaximum number of iterations: ');
stop=input('tolerance%: ');
x=zeros(1,n); xold=zeros(1,n);
E=zeros(500,n);itn=0; E1=100;
fprintf('\n');
for i=1:n
    fprintf('input initial valur for x%d',i)
 x(i)=input(': ');
end
S=sum(abs(N),2); flag=0;
for i=1:n
    if (S(i)-abs(N(i,i))-abs(N(i,n+1)))<=N(i,i)
     flag=flag+1;
    end
end
if flag==n
    fprintf('\nmatrix is diagonally dominant\n')
else
    fprintf('\nmatrix is not diagonally dominant\n')
end
R=input('\nenter relaxation number: ');
while E1>stop && itn<maxitn
    xold=x;
for i=1:n
    temp=0;
for j=1:n
    if j~=i
    temp=temp+N(i,j)*x(j);
    end
end
temp=temp+N(i,n+1);
temp=(-temp)/N(i,i);
x(i)=temp;
x(i)=R*x(i)+(1-R)*xold(i);
end
itn=itn+1; 
 E(itn,:)=abs(1-xold./x)*100;
 E1=E(itn,1);
end
fprintf('\n\n solution: \n')
for i=1:n
    fprintf('x%d = %f\n',i,x(i))
end
X=[1:itn];
for i=1:n
subplot(1,n,i)
 plot(X,E(X,i)), grid on
end