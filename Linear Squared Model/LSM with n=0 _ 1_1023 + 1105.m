％ Ｈow to create a life script ??

%% BASICS : generate vectors & metrices %

testmetrix = [1 1 2; 2 2 3 ; 4 4 4]
linspace(1,10,5)  
% linspace(start,end,length), generates �linear� vectors
logspace(2,9,3)
% logspace(start,end,length),generates logarithmical vectors
ones(4,2)
% ones(rows, columns), Matrix with 1
zeros(4,2)
% zeros(row, columns), Matrix with 0
rand(4,3)
% rand(row, columns),Matrix with random values between 0 and 1
randn(4,3)  
% Matrix with random values with Gaussian distribution

% To make many lines all becomes comments : click mouse on right -> click 'comment' 



%% Program for Least Squares Method , n = 1
clear all

x = [1;
     2;
     3];
% ";" inside the [] means the end of the row
% ";" outside or at the end of a line is to means a end to the line
 
Y = [1 ; 2 ; 4];
% the way x and Y are written here mean the same thing

X = [x ones(3,1)] ; 

Theta  = inv(X'*X)*X'*Y;

xs = 0:0.5:4 ;  

yhat = Theta(1)* xs + Theta(2); 
% n = 1 ; a_0 = Theta(1) ; a_1 = Theta(2)

plot(xs, yhat,'-c'); % plot the fitting line 
%'-p' means the style of line is star shape ; 
%'-c' is light blue; 
%'-o' is circle

grid   % put grid on the plot
hold on  % keep the figure
xlabel('Time')
ylabel('Dollar')

plot(x, Y ,'*r');  % plot x and Y that together means 3 dots
% b means blue ; r means red ; y means yellow etc.

% Program for Least Squares Method , n = 0 
R=[1;
   1;
   1];

Theta = inv(R'*R)*R'*Y;
yhat = Theta(1) 
plot(xs, yhat * ones(1,length(xs)));

% With Weighted version: 

% which means which point is more important
% therefore the line will be closer to the point with higher weight
W = [1 0 0; 
    0 2 0; 
    0 0 1];
 
% if W = [1 0 0; 
%         0 20 0; 
%         0 0 1]; 
% Then the line moves towards the middle point? x2,Y2

% n = 1
ThetaW  = inv(X'*W*X)*X'*W*Y;
yhatW = ThetaW(1)* xs + ThetaW(2);   
plot(xs, yhatW, '-r');  

% n = 0
ThetaWR  = inv(R'*W*R)*R'*W*Y;
yhatWR = ThetaWR(1);
plot(xs, yhatWR * ones(1,length(xs)),'-h');
