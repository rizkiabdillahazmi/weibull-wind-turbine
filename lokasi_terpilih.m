h1 = 10;
h2 = 100;
v1 = Mean(1,1);
v2 = Mean(1,2);
hellman = 0.08;

h = 10:10:150;
v = v1.*((h/h1).^hellman);

% V pada setiap Ketinggian 10,30,90 m
v_S1(:,1) = S1_VD(:,1);
v_S1(:,2) = S1_VD(:,1).*((20/h1).^hellman);
v_S1(:,3) = S1_VD(:,1).*((30/h1).^hellman);
v_S1(:,4) = S1_VD(:,1).*((40/h1).^hellman);
v_S1(:,5) = S1_VD(:,1).*((50/h1).^hellman);
v_S1(:,6) = S1_VD(:,1).*((60/h1).^hellman);
v_S1(:,7) = S1_VD(:,1).*((70/h1).^hellman);
v_S1(:,8) = S1_VD(:,1).*((80/h1).^hellman);
v_S1(:,9) = S1_VD(:,1).*((90/h1).^hellman);
% 100 m
%v_S1(:,10) = S1_VD(:,2);
v_S1(:,10) = S1_VD(:,1).*((100/h1).^hellman);
v_S1(:,11) = S1_VD(:,1).*((110/h1).^hellman);
v_S1(:,12) = S1_VD(:,1).*((120/h1).^hellman);
v_S1(:,13) = S1_VD(:,1).*((130/h1).^hellman);
v_S1(:,14) = S1_VD(:,1).*((140/h1).^hellman);
v_S1(:,15) = S1_VD(:,1).*((150/h1).^hellman);

% mean dan standar deviasi
mean_std(:,1) = mean(v_S1);
mean_std(:,2) = std(v_S1);

% k
k_c(:,1) = (mean_std(:,2)./mean_std(:,1)).^(-1.086);
% c
k_c(:,2) = mean_std(:,1)./(gamma(1+(1./k_c(:,1))));

%WPD
s1_WPD_10m = 0.5*1.225.*k_c(1,2).^3.*(gamma(1+(3./k_c(1,1))));
s1_WPD_30m = 0.5*1.225.*k_c(3,2).^3.*(gamma(1+(3./k_c(3,1))));
s1_WPD_60m = 0.5*1.225.*k_c(6,2).^3.*(gamma(1+(3./k_c(6,1))));
s1_WPD_100m = 0.5*1.225.*k_c(10,2).^3.*(gamma(1+(3./k_c(10,1))));

s1_WED_10m = (s1_WPD_10m*8760)/1000;
s1_WED_30m = (s1_WPD_30m*8760)/1000;
s1_WED_60m = (s1_WPD_60m*8760)/1000;
s1_WED_100m = (s1_WPD_100m*8760)/1000;

s1_WPD_bulan10m = 0.5*1.225.*S1_Bulanan_10m(:,2).^3.*(gamma(1+(3./S1_Bulanan_10m(:,1))));
s1_WPD_bulan30m = 0.5*1.225.*S1_Bulanan_30m(:,2).^3.*(gamma(1+(3./S1_Bulanan_30m(:,1))));
s1_WPD_bulan60m = 0.5*1.225.*S1_Bulanan_60m(:,2).^3.*(gamma(1+(3./S1_Bulanan_60m(:,1))));
s1_WPD_bulan100m = 0.5*1.225.*S1_Bulanan_100m(:,2).^3.*(gamma(1+(3./S1_Bulanan_100m(:,1))));

s1_WED_bulan10m = (s1_WPD_bulan10m.*8760)/1000;
s1_WED_bulan30m = (s1_WPD_bulan30m.*8760)/1000;
s1_WED_bulan60m = (s1_WPD_bulan60m.*8760)/1000;
s1_WED_bulan100m = (s1_WPD_bulan100m.*8760)/1000;
%
subplot(2,2,1)
site = categorical({'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'});
site = reordercats(site,{'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'});
mean_10_100 = [s1_WPD_bulan10m s1_WPD_bulan30m s1_WPD_bulan60m s1_WPD_bulan100m];
bar(site,mean_10_100)
title('a) Monthly Wind Power Density')
ylabel('WPD (W/m^2)')
xlabel('Bulan')
legend([],{'10 m','30 m','60 m','100 m'},'Location','NW')
grid on

subplot(2,2,2)
site = categorical({'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'});
site = reordercats(site,{'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'});
mean_10_100 = [s1_WED_bulan10m s1_WED_bulan30m s1_WED_bulan60m s1_WED_bulan100m];
bar(site,mean_10_100)
title('b) Monthly Wind Energy Density')
ylabel('WED (kWh/m^2)')
xlabel('Bulan')
legend([],{'10 m','30 m','60 m','100 m'},'Location','NW')
grid on

% 
subplot(2,2,3)
site = categorical({'10 m','30 m','60 m','100 m'});
site = reordercats(site,{'10 m','30 m','60 m','100 m'});
mean_10_100 = [s1_WPD_10m s1_WPD_30m s1_WPD_60m s1_WPD_100m];
bar(site,mean_10_100)
title('c) Annual Wind Power Density')
ylabel('WPD (W/m^2)')
xlabel('Ketinggian')
%legend([],{'10 m','100 m'})
grid on

subplot(2,2,4)
site = categorical({'10 m','30 m','60 m','100 m'});
site = reordercats(site,{'10 m','30 m','60 m','100 m'});
mean_10_100 = [s1_WED_10m s1_WED_30m s1_WED_60m s1_WED_100m];
bar(site,mean_10_100,'r')
title('d) Annual Wind Energy Density')
ylabel('WED (kWh/m^2)')
xlabel('Ketinggian')
%legend([],{'10 m','100 m'})
grid on