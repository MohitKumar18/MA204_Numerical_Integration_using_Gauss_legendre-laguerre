% Name-Mohit Kumar
% Entry No.-2020MCB1242
%-------------------------------------------------------------------------%
%                      GUASS LAGUERRE                                     %
%-------------------------------------------------------------------------%
f = input('Enter Your funcion as @(x) sin(x) for sin(x): ');
n = input('which guass point formula you want to apply: ');
syms x                                                    %% Constructing symbolic variable x using syms
F = @(x) exp(x)*f(x);                                     %% muliply weight as exp(x)to given function
f0(x) = laguerreL(n,x);                                   %% initializing laguerre polynomial of n degree
f1(x) = diff(f0);                                         %% differentiating laguerre polynomial of degree n
f2(x) = laguerreL(n-1,x);                                 %% initializing laguerre polynomial of n-1 degree
fprintf('\n%d nodes of laguerre polynomial of %d degree are',n,n)
x = vpasolve(f0 == 0)                                     %% finding numerical roots of laguerre polynomial of n degree using vpasolve
w = zeros(n,1);                                           %% initializing column zero matrix w for storing n weights
for i=1:n                                                 %% finding n weights and storing in column matrix w using following formula
    w(i) = (-1)/(n*f2(x(i))*f1(x(i)));                    
end
fprintf('%d weights of laguerre polynomial of %d degree are',n,n)
w
WS = 0;                                                   %% initializing weighted sum to 0
for j=1:n
    WS = WS + w(j)*F(x(j));                               %% finding weighted sum i.e. WS=[w(1)*F(x(1))+w(2)*F(x(2))+.....+w(n)*F(x(n))]
end
ans = double(WS);                                         %% printing answer as weighted sum
fprintf('Integration of given function using %d point formula is %f\n',n,ans)