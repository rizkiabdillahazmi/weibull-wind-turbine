clc;
clear;

for i = 1 : 10
    % Import Data
    filename = sprintf('S%d.xlsx',i);
    eval(sprintf("S%d = xlsread(filename,'Sheet1','H3:K8762');",i));
    % Convert u dan v ke rata-rata
    eval(sprintf("S%d_VD(1:8760,1) = sqrt((S%d(1:8760,1).^2)+(S%d(1:8760,3).^2));",i,i,i));
    eval(sprintf("S%d_VD(1:8760,2) = sqrt((S%d(1:8760,2).^2)+(S%d(1:8760,4).^2));",i,i,i));
    % Mean Lokasi
    eval(sprintf("Mean(%d,:) = mean(S%d_VD);",i,i));
    % Normal Dist Dengan Edge 0 - 12
    eval(sprintf("[N(:,%d),x(:,%d)]=hist(S%d_VD(1:8760,2),0:1:14);",i,i,i));
    
    % Wind Dir
    %wind_dir = 180 + atan2d(S1(1:8760,3),S1(1:8760,1)); %v,u
    % 10 m
    eval(sprintf("S%d_VD(1:8760,3) = 180 + atan2d(S%d(1:8760,3),S%d(1:8760,1));",i,i,i));
    for ii = 1:length(eval(sprintf("S%d_VD(:,3);",i)))
        if eval(sprintf("S%d_VD(ii,3);",i))<=90
            eval(sprintf("S%d_VD(ii,3) = 90-S%d_VD(ii,3);",i,i))
        elseif eval(sprintf("S%d(ii,3);",i))<=180
            eval(sprintf("S%d_VD(ii,3) = 180-S%d_VD(ii,3)+270;",i,i))
        elseif eval(sprintf("S%d_VD(ii,3);",i))<=270
            eval(sprintf("S%d_VD(ii,3) = 270-S%d_VD(ii,3)+180;",i,i))
        elseif eval(sprintf("S%d(ii,3);",i))<360
            eval(sprintf("S%d_VD(ii,3) = S%d_VD(ii,3)-180;",i,i))
        else
            eval(sprintf("S%d_VD(ii,3) = 360-270;",i))
        end
    end
    
    % 100m
    eval(sprintf("S%d_VD(1:8760,4) = 180 + atan2d(S%d(1:8760,4),S%d(1:8760,2));",i,i,i));
    for ii = 1:length(eval(sprintf("S%d_VD(:,4);",i)))
        if eval(sprintf("S%d_VD(ii,4);",i))<=90
            eval(sprintf("S%d_VD(ii,4) = 90-S%d_VD(ii,4);",i,i))
        elseif eval(sprintf("S%d(ii,4);",i))<=180
            eval(sprintf("S%d_VD(ii,4) = 180-S%d_VD(ii,4)+270;",i,i))
        elseif eval(sprintf("S%d_VD(ii,4);",i))<=270
            eval(sprintf("S%d_VD(ii,4) = 270-S%d_VD(ii,4)+180;",i,i))
        elseif eval(sprintf("S%d(ii,4);",i))<360
            eval(sprintf("S%d_VD(ii,4) = S%d_VD(ii,4)-180;",i,i))
        else
            eval(sprintf("S%d_VD(ii,4) = 360-270;",i))
        end
    end
    
    % Plot
    if i == 1
        figure;
    end
    eval(sprintf("subplot(4,3,%d);",i));
    eval(sprintf("bar(x(:,%d),N(:,%d));",i,i));
    eval(sprintf("title('Lokasi : S%d');",i));
    xlabel('Kecepatan Angin (m/s)');
    ylabel('Jam');
end