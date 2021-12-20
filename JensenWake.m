%% Jensen Wake Model 

%% Initial Params 
D = 50; % diameter 

% Position of Turbine in Domain 

% s = x/D; % x Distance behind the rotor, D diameter 
k = 0.075; % Land Case 
Uinf = 10; % Freestream 
Ct = 0.43; % thrust 
% Dw = D*(1+2*k*s); 

% u = Uinf * (1-((1-sqrt(1-Ct))/(1+2*k*s)^2)); 

%% Turbine Placement 

x = 200; 
y = 140; 

% Construct Bounding Box for Point Selection use find function to capture
% all points in the required area. 
count = 1;
innercount = 1; 
for x = 200:1:15*D

    s(count) = x/D; 
    
        for s = s(innercount);
            Dw(innercount) = D*(1+2*k*s); 
            innercount = innercount + 1; 
        end    
    
    count = count + 1; 
end 

%% Bounding Box 
% Use polygon to bound area affected by wake to apply slowdown factor 
% Polygon Bounding 
% Where xv,yv are the verticies of the polygons denoted as a bounding box 
% and xq,yq are the scattered data points from the cfd experimentation 
Dwy = numel(Dw);
Dwy = Dw(Dwy);

B1y = y + (D/2);
B1x = x;
B2y = y + (Dwy/2); 
B2x = x + 15 * D; 
B3x = x + 15 * D;
B3y = y - (Dwy/2);
B4y = y - (D/2);
B4x = x; 

% x verticies of polygon 
xv = [B1x,B2x,B3x,B4x]';
yv = [B1y,B2y,B3y,B4y]';


%% Random Points for Testing 
rng default 

% Random X vals 
ax = 0;
bx = 2000;
xq = (bx-ax).*rand(5000,1) + ax;

% Random Y vals 
ay = 0;
by = 500;
yq = (by-ay).*rand(5000,1) + ay;

% Set U vals 
au = 10; 
bu = 10.1;
uq = (bu-au).*rand(5000,1) + au;

%%  Boolean for data within set parameters to apply function 

in = inpolygon(xq,yq,xv,yv);

figure

plot(xv,yv,'LineWidth',2) % polygon
axis equal

hold on
plot(xq(in),yq(in),'r+') % points inside
plot(xq(~in),yq(~in),'bo') % points outside
hold off

 

%% Application of U velocity dependent on local position of point to rotor
count = 1; 

for boolean = xq(in);
    
    s = boolean/D;
    
    if in(count) == 1; 
        uq(count) = Uinf * (1-((1-sqrt(1-Ct))/(1+2*k*s)^2));
    end 
    
    if in(count) == 0; 
        uq(count) = 10; 
    end 
   
    if count > numel(xq);
        return; 
    end
    
    count = count + 1;
end 




