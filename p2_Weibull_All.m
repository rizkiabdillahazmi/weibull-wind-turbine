for i = 1 : 10
    % Normal Dist Dengan Edge 0 - 14
    eval(sprintf("[N10m(:,%d),x10m(:,%d)]=hist(S%d_VD(1:8760,1),0:1:14);",i,i,i));
    eval(sprintf("[N100m(:,%d),x100m(:,%d)]=hist(S%d_VD(1:8760,2),0:1:14);",i,i,i));
    
    % mean dan standar deviasi
    eval(sprintf("mean_10m(%d,:)= mean(S%d_VD(1:8760,1));",i,i));
    eval(sprintf("mean_100m(%d,:)= mean(S%d_VD(1:8760,2));",i,i));
    
    eval(sprintf("std_10m(%d,:)= std(S%d_VD(1:8760,1));",i,i));
    eval(sprintf("std_100m(%d,:)= std(S%d_VD(1:8760,2));",i,i));
end

pdf_aktual_10m = N10m/8760;
pdf_aktual_100m = N100m/8760;

% k
k_c_10m(:,1) = (std_10m./mean_10m).^(-1.086);
k_c_100m(:,1) = (std_100m./mean_100m).^(-1.086);
% c
k_c_10m(:,2) = mean_10m./(gamma(1+(1./k_c_10m(:,1))));
k_c_100m(:,2) = mean_100m./(gamma(1+(1./k_c_100m(:,1))));

x_angin = 0:1:14;

for i = 1 : 10
    %PDF Weibull
    eval(sprintf("pd10 = makedist('Weibull','a',k_c_10m(%d,2),'b',k_c_10m(%d,1));",i,i));
    eval(sprintf("pdf_weibull_10m(:,%d) = pdf(pd10,x_angin);",i));
    
    eval(sprintf("pd100 = makedist('Weibull','a',k_c_100m(%d,2),'b',k_c_100m(%d,1));",i,i));
    eval(sprintf("pdf_weibull_100m(:,%d) = pdf(pd100,x_angin);",i));
end

figure;
%subplot(2,1,1);
plot(x_angin,pdf_weibull_10m(:,1),'b','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,2),'g','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,3),'r','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,4),'y','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,5),'m','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,6),'c','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,7),'k','LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,8),'color',[0 0.5 0],'LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,9),'color',[0.6 0.2 0.3],'LineWidth',1)
hold on
plot(x_angin,pdf_weibull_10m(:,10),'color',[0.6 0.8 0.3],'LineWidth',1)
title('Grafik PDF Weibull Setiap Lokasi')
xlabel('Kecepatan Angin rata-rata (m/s)')
ylabel('PDF')
legend('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10')
grid on
hold off;

% Hellman
hellman = 0.08;

%fitlm(pdf_aktual_10m(:,1),pdf_weibull_10m(:,1));