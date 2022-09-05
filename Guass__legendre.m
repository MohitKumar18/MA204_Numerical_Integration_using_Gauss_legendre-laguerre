% Name-Mohit Kumar
% Entry No.-2020MCB1242
%-------------------------------------------------------------------------%
%                      GUASS LAGENDRE                                     %
%-------------------------------------------------------------------------%
f = input('Enter Your funcion as @(x) sin(x) for sin(x): ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
n = input('which guass point formula you want to apply: ');
F = @(t) f(((b-a)*t +(b+a))/2);               %% Changing domain fo the function from [a,b] to [-1,1]
syms x                                        %% Constructing symbolic variable x using syms
actual = double(int(f,x,[a b]));              %% actual value of integration of given function using int
f0(x) = legendreP(n,x);                       %% initializing legendre polynomial of n degree
f2(x) = legendreP(n-1,x);                     %% initializing legendre polynomial of n-1 degree
f1(x) = diff(f0);                             %% differentiating legendre polynomial of degree n
fprintf('\n%d nodes of legendre polynomial of %d degree are',n,n)
x = vpasolve(f0 == 0)                         %% finding numerical roots of legendre polynomial of n degree using vpasolve
w = zeros(n,1);                               %% initializing column zero matrix w for storing n weights
for i=1:n                                     %% finding n weights and storing in column matrix w using following formula
    w(i) = 2/(n*f2(x(i))*f1(x(i)));           
end
fprintf('%d weights of legendre polynomial of %d degree are',n,n)
w
WS = 0;                                       %% initializing weighted sum to 0
for j=1:n
    WS = WS + w(j)*F(x(j));                   %% finding weighted sum i.e. WS=[w(1)*F(x(1))+w(2)*F(x(2))+.....+w(n)*F(x(n))]
end
ans = double(((b-a)/2)*WS);                    %% printing answer as ((b-a)/2)*(weighted sum)
fprintf('actual value of integration of given function is %f\n',actual)
fprintf('integration of given function using %d point formula is %f\n',n,ans)