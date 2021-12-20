figure;
site = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','S10'});
site = reordercats(site,{'S1','S2','S3','S4','S5','S6','S7','S8','S9','S10'});
%mean_10_100 = [mean_10m mean_100m];
bar(site,mean_10m)
%title('Grafik Perbandingan Kecepatan Angin Setiap Lokasi')
xlabel('Lokasi')
ylabel('Kecepatan Angin rata-rata (m/s)')
%legend([],{'10 m','100 m'})
grid on

figure;
% 
subplot(2,1,1)
site = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','S10'});
site = reordercats(site,{'S1','S2','S3','S4','S5','S6','S7','S8','S9','S10'});
%mean_10_100 = [WPD_10m WPD_100m];
bar(site,WPD_10m)
title('a) Wind Power Density')
ylabel('WPD (W/m^2)')
xlabel('Lokasi')
%legend([],{'10 m','100 m'})
grid on

subplot(2,1,2)
site = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','S10'});
site = reordercats(site,{'S1','S2','S3','S4','S5','S6','S7','S8','S9','S10'});
%mean_10_100 = [WED_10m WED_100m];
bar(site,WED_10m)
title('b) Wind Energy Density')
ylabel('WED (kWh/m^2)')
xlabel('Lokasi')
%legend([],{'10 m','100 m'})
grid on