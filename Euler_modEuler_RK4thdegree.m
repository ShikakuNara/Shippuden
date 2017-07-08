X=input('enter the value of x: ');
H=input('etive error");nter the step-size: ');
E=input('enter the approximate relative error: ');
Y=Euler(X,H,2,4,0);
fprintf('\nsolution by Euler method: %f\ntrue relative error: %f\n',Y,(Y-23.93296)/23.93296)
Y=RK4(H,X,0,2,4);
fprintf('\nsolution by Runge-Kutta method: %f\ntrue relative eroor: %f\n:',Y,(Y-23.93296)/23.93296);
[Y,Ea]=ModEuler(X,H,E,0,2,4);
fprintf('\nsolution by Modified Euler method: %f\napproximate relative error: %f\n\n',Y,Ea);
%%
function [Y]=Euler(X,h,yinit,finit,xinit)
yi=yinit;
fi=finit;
x=xinit;
while(x<=X)
yi1=yi+fi*h;
fi1=fi+(4*fi-4*yi+3*exp(x)+2*x)*h;
yi=yi1;
fi=fi1;
x=x+h;
end
Y=yi;
end
%%
function [Y]=RK4(h,X,xinit,yinit,zinit)

syms x y z
f(x,y,z)=z;
g(x,y,z)=4*z-4*y+3*exp(x)+2*x;

xi=xinit;
yi=yinit;
zi=zinit;
while xi<X

k0=h*f(xi,yi,zi);

l0=h*g(xi,yi,zi);

k1=h*f(xi+h/2,yi+(k0)/2,zi+(l0)/2);

l1=h*g(xi+h/2,yi+(k0)/2,zi+(l0)/2);

k2=h*f(xi+h/2,yi+(k1)/2,zi+(l1)/2);

l2=h*g(xi+h/2,yi+(k1)/2,zi+(l1)/2);

k3=h*f(xi+h,yi+k2,zi+l2);

l3=h*g(xi+h,yi+k2,zi+l2)/6;

yi1=yi+(k0+2*k1+2*k2+k3)/6;

zi1=zi+(l0+2*l1+2*l2+l3)/6;

yi=yi1;
zi=zi1;
xi=xi+h;
end
Y=yi;
end
%%
function [Y,Ea]=ModEuler(X,h,E,xinit,yinit,zinit)

zi=zinit; 
xi=xinit;
yi=yinit;

syms x y z
f(x,y,z)=z; %y'
g(x,y,z)=4*z-4*y+3*exp(x)+2*x; %z'

while xi<X
yi1=yi+f(xi,yi,zi)*h; %yi+1 from euler method

zi1=zi+g(xi,yi,zi)*h; %zi+1 from euler method

xi1=xi+h; 

Ytemp=yi1;
i=1;
while i==1 || abs(Ytemp/Yi1-1)*100>E 
if(i~=1)
 Ytemp=Yi1;
end
Yi1=yi+(f(xi,yi,zi)+f(xi1,yi1,zi1))*h/2; %modified method
i=i+1;
end
Ea=abs(Ytemp/Yi1-1)*100;

Zi1=zi+(g(xi,yi,zi)+g(xi1,yi1,zi1))*h/2; %modified method

yi=Yi1;
zi=Zi1;
xi=xi+h;
end
Y=yi;
end