% Let's present wind in knots
% Conversion factor from meters/sec to knots
%mps2kts = 1.94384;
%wind = table(S1_VD(1:8760,3),S1_VD(1:8760,1)*mps2kts); % knot

wind = table(S1_VD(1:8760,3),S1_VD(1:8760,1));
wind.Properties.VariableNames = {'direction','speed'};

% Dir, Speed, Properties
[figure_handle,count,speeds,directions,Table] = WindRose(wind.direction,wind.speed, ...
    'anglenorth', 0,...
    'angleeast', 90,...
    'labels', {'N (0°)','E (90°)','S (180°)','W (270°)'},...
    'ndirections', 16,...
    'vWinds', [0 2 4 6 8 10 12],...
    'titlestring', {'Wind Rose S1';'Ketinggian 10 m';''},...
    'freqlabelangle', 45);

% Peulisan Options bisa huruf kecil semua
%Options.AngleNorth     = 0;
%Options.AngleEast      = 90;
%Options.ndirections    = 16; % Default 36
%Options.Labels         = {'N (0°)','E (90°)','S (180°)','W (270°)'};
%Options.labels         = {'N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'};
%Options.vWinds        = [0 4 8 12 16 20];
%Options.nspeeds       = 8;
%Options.FreqLabelAngle = 45;
%Options.TitleString = {'Wind Rose S1';''};
%[figure_handle,count,speeds,directions,Table] = WindRose(wind.direction,wind.speed,Options);