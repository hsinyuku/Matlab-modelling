clear all
close all

% Case when m is bigger than 2n+1

x=[1  2  3  4  5 7 8 10 12]';
y=[1  2  3  5  6 3 4 5 0]';
 
% m = 9  

T =100;  % Period of regressor  
% Change of T will change approximation = R suqured change

% If T becomes bigger, R decreses, becuz
% it uses more similar values to simulate points 
% EX. think of the graph of cos founction with larger T 
% it uses almost constant to simulate points near origin
% thus similar to deduces the order of polynomial 

% If T becomes very big, 
% columns with sin becomes 0 = X_tr becomes singular
% ???? independency?? 
% ??? loses the consistence of matrix
 
% n = 2 ; 2n+ 1 = 5
X_tr=[1/2 sin(2*pi*x(1)*1/T) cos(2*pi*x(1)*1/T) sin(2*pi*x(1)*2/T) cos(2*pi*x(1)*2/T);
     1/2 sin(2*pi*x(2)*1/T) cos(2*pi*x(2)*1/T) sin(2*pi*x(2)*2/T) cos(2*pi*x(2)*2/T);
     1/2 sin(2*pi*x(3)/T) cos(2*pi*x(3)/T) sin(2*pi*x(3)*2/T) cos(2*pi*x(3)*2/T);
     1/2 sin(2*pi*x(4)/T) cos(2*pi*x(4)/T) sin(2*pi*x(4)*2/T) cos(2*pi*x(4)*2/T);
     1/2 sin(2*pi*x(5)/T) cos(2*pi*x(5)/T) sin(2*pi*x(5)*2/T) cos(2*pi*x(5)*2/T);
     1/2 sin(2*pi*x(6)/T) cos(2*pi*x(6)/T) sin(2*pi*x(6)*2/T) cos(2*pi*x(6)*2/T);
     1/2 sin(2*pi*x(7)/T) cos(2*pi*x(7)/T) sin(2*pi*x(7)*2/T) cos(2*pi*x(7)*2/T);
     1/2 sin(2*pi*x(8)/T) cos(2*pi*x(8)/T) sin(2*pi*x(8)*2/T) cos(2*pi*x(8)*2/T);
     1/2 sin(2*pi*x(9)/T) cos(2*pi*x(9)/T) sin(2*pi*x(9)*2/T) cos(2*pi*x(9)*2/T)];
 
Theta=inv(X_tr'*X_tr)*X_tr'*y;
  xs=0:1:2*T; % It is a way to realize a vector % here we define the domain
                         % starting from 0 to 30 with step 
                         % equals 0.02
 
ys=Theta(1)/2+Theta(2)*sin(2*pi*xs./T)+Theta(3)*cos(2*pi*xs./T)+Theta(4)*sin(2*pi*xs.*2/T)+Theta(5)*cos(2*pi*xs.*2/T);
 
plot(xs,ys); % "plot" graphs the solution
 
grid  % "grid" generates a grid in the figure
 
hold on % "hold on" maintains the figures active
 
plot(x,y,'*r') % plot a star with red color at each x and y
 
 
R_squared=1-sum((y-(Theta(1)/2+Theta(2)*sin(2*pi*x./T)+Theta(3)*cos(2*pi*x./T)+Theta(4)*sin(2*pi*x.*2/T)+Theta(5)*cos(2*pi*x.*2/T))).^2)/(sum((y-mean(y)).^2))
% 1-SSE/SST
