%% Program for Least Squares Method n = 2

clear all

x=[1;
   2;
   3];

X=[1.^2 1 1;
   2.^2 2 1;
   3.^2 3 1];

Y=[1;
   2;
   4];

Theta = inv(X'*X)*X'*Y;
xs = 1:0.1:4;

yhat =  Theta(1) * xs.^2 + Theta(2) * xs + Theta(3);
plot(xs , yhat);

hold on 
plot(x,Y,'*r');

%% n > 2

clear all

x2 = [1 2 3 4 5 6 7 8 9 10] ;

Y2 = [1 2  4.5  5.6  2.1  0.3  4.7  9.9  5.8  10.5];

R = [(x2').^3  (x2').^2  (x2') ones(10,1)];  

Theta  = inv(R'*R)*R'* (Y2');

xs = 1:1:13;

yhat = Theta(1) * xs.^3 + Theta(2) * xs.^2 + Theta(3) * xs + Theta(4);


plot(xs , yhat,'-r');
hold on 
plot(x2,Y2,'*b');