syms x n r s stop maxitn 
n=input('enter degree of the polynomial :  ');
a=zeros(1,n);
 for i=n:-1:0
     fprintf('enter coeffecient of x^%d  \n',i);
     a(i+1)=input(' ');
 end
 f(x)=x*0;
 for j=n:-1:0
     f(x)=f(x)+a(j+1)*x^j;
 end
stop=input('enter the tolerance%:    ');
maxitn=input('enter the max number of iterations allowed:  ');
r=input('enter initial value of r :  ');
s=input('enter initial value of s :  ');
i=0;I=0;itn=0;r1=2;s1=2;v=zeros(2,1800);d=zeros(1,n+1);
fprintf('\nroots of the polynomial entered: \n')
while n>=1 
    if n>2
     while ((abs(r1/r)*100)>stop || (abs(s1/s)*100)>stop)&& itn<maxitn
     [r,s,I,r1,s1] = Bairstow(a,r,s,n,I);
      v(1,I)=(abs(r1/r))*100;
      v(2,I)=(abs(s1/s))*100;
     end
     format longG
     format compact
     root=roots([1 -r -s]);
     disp(root);
      d(n+1)=a(n+1);
      d(n)=a(n)+r*d(n+1);
      for j= n-1:-1:2
      d(j)=a(j)+r*d(j+1)+s*d(j+2);
      end
      for k=n-1:-1:1
          a(k)=d(k+2);
      end
      itn=itn+I;
      n=n-2;I=0;r1=1;s1=1;
    elseif n==2
        sq=sqrt(a(2)^2-4*a(3)*a(1));
        format longG
        format compact
        rootA=(-a(2)+sq)/2*a(3);
        rootB=(-a(2)-sq)/2*a(3);
        disp(rootA)
        disp(rootB)
        n=n-2;
    elseif n==1
        format longG
        format compact
        rootA=(-a(1)/a(2));
        disp(rootA)
        n=n-1;
    end
end
      x=[-10:0.1:10];
      subplot(1,3,1)
      plot(x,f(x)),xlabel('X'), ylabel('f(x)'), grid on
      y=[1:itn];
      subplot(1,3,2)
      plot(y,v(1,y)), xlabel('iteration number'), ylabel('Ea% in r'), grid on
      subplot(1,3,3)
      plot(y,v(2,y)), xlabel('iteration number'), ylabel('Ea% in s'), grid on
function [r,s,I,r1,s1] = Bairstow(a,r,s,n,I)
 b(n+1)=a(n+1);
 b(n)=a(n)+r*b(n+1);
 for j= n-1:-1:1
     b(j)= a(j)+r*b(j+1)+s*b(j+2);
 end
  c(n+1)=b(n+1);
 c(n)=b(n)+r*c(n+1);
 for k=n-1:-1:2
      c(k)= b(k)+r*c(k+1)+s*c(k+2);
 end
 c(1)=0;
 r1=(b(1)*c(4)-b(2)*c(3))/(c(3)^2-c(2)*c(4));   
 s1=(b(1)*c(3)-b(2)*c(2))/(c(2)*c(4)-c(3)^2);
 I=I+1;
     r=r+r1;
     s=s+s1;
end