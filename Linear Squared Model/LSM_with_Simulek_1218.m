%LSM with Simulek

Fs=[0 1 2 3 3.9 4.5 4.8 5 5.1]';
h=[0 1e-4 2e-4 3e-4 4e-4 5e-4 6e-4 7e-4 8e-4]';
X2=[h.^2 h ones(1,9)'] ;
% poloynomial of the second order
Theta=inv(X2'*X2)*X2'*Fs;


hs=[0:1e-5:8e-4];
%Fs_app=Theta(1)*hs.^2+Theta(2)*hs+Theta(3);
Fs_app=Theta(1)*hs.^2+Theta(2)*hs 
%The above line with Theta(3)=0 
%constrained the first point to fit the line

plot(h,Fs,'*');
hold;
plot(hs,Fs_app);

grid;
xlabel('Position [m]');
ylabel('Spring Force [N/m]');

%put in a function(fcn) in simulek.
%doubled-clicked the fcn to turn it in a m file.
%in the m file, make changes to see changes in Simulek.

%When seeing differnce graph in simulek, first try to zoom.