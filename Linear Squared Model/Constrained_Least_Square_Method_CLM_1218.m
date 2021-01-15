%Constrained Least Square Method
%Links to Simulek as a different spring, therefore a new m-file

Fs=[0 1 2 3 3.9 4.5 4.8 5 5.1]';
h=[0 1e-4 2e-4 3e-4 4e-4 5e-4 6e-4 7e-4 8e-4]';

X2=[h.^2 h]; %take ones away
Theta_c= inv(X2'*X2)*X2'*Fs;

hs=[0:1e-5:8e-4];
Fs_app=Theta_c(1)*hs.^2+Theta_c(2)*hs;  %No Theta_c(3)
%The above line with Theta(3)=0 
% constrained the first point to fit the line

plot(h,Fs,'*');
hold;
plot(hs,Fs_app);

grid;
xlabel('Position [m]');
ylabel('Spring Force [N/m]');
