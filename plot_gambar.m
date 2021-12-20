%Plot Hellman / Eksponen Daya
figure;
plot(v,h,'r.','MarkerSize',10);
hold on
plot(v,h,'b');
xlabel('Kecepatan Angin (m/s)');
ylabel('Ketinggian (m)');
set(gca, 'YTick',h);
%set(gca, 'YLim',[0 160])
set(gca, 'XLim',[4.4 6]);
grid on;

%Plot Histogram dan Weibull
count = 1;
count_h = [10 30 60 100];

for i = 1 : 10
    if i==1 || i==3 || i==6 || i==10 
        eval(sprintf("[NS(:,%d),xS(:,%d)]=hist(v_S1(1:8760,%d),0:1:14);",count,count,i));
        %[NS(:,1),xS(:,1)]=hist(v_S1(1:8760,1),0:0.5:14);
        eval(sprintf("NS(:,%d) = NS(:,%d)./8760;",count,count));
        if i == 1
            figure;
        end
        eval(sprintf("subplot(2,2,%d);",count));
        eval(sprintf("bar(xS(:,%d),NS(:,%d));",count,count));
        eval(sprintf("title('Ketinggian %d m');",count_h(count)));
        %bar(xS(:,1),NS(:,1));
        xlabel('Kecepatan Angin (m/s)');
        ylabel('PDF');
        
        hold on;
        eval(sprintf("pd = makedist('Weibull','a',k_c(%d,2),'b',k_c(%d,1));",i,i));
        %pd = makedist('Weibull','a',5.19,'b',2.09);
        x = 0:1:14;
        %y = pdf(pd,x);
        eval(sprintf("y%d = pdf(pd,x);",count));
        %plot(x,y,'LineWidth',2);
        eval(sprintf("plot(x,y%d,'LineWidth',2);",count));
        
        legend('Data Aktual','Weibull')
        
        hold off;
        
        count = count+1;
    end
end

% CDF
load 'cdfAktual.mat';
load 'cdfWeibull.mat';

figure;
subplot(2,2,1);
plot(x,cdfAktual(:,1));
hold on;
plot(x,cdfWeibull(:,1));
xlabel('Kecepatan Angin (m/s)');
ylabel('CDF');
set(gca, 'YTick',0:0.1:1);
title('Ketinggian 10 m');
grid on;
hold off;
legend('Data Aktual','Weibull', 'Location','southeast');

subplot(2,2,2);
plot(x,cdfAktual(:,2));
hold on;
plot(x,cdfWeibull(:,2));
xlabel('Kecepatan Angin (m/s)');
ylabel('CDF');
set(gca, 'YTick',0:0.1:1);
title('Ketinggian 30 m');
grid on;
hold off;
legend('Data Aktual','Weibull', 'Location','southeast');

subplot(2,2,3);
plot(x,cdfAktual(:,3));
hold on;
plot(x,cdfWeibull(:,3));
xlabel('Kecepatan Angin (m/s)');
ylabel('CDF');
set(gca, 'YTick',0:0.1:1);
title('Ketinggian 60 m');
grid on;
hold off;
legend('Data Aktual','Weibull', 'Location','southeast');

subplot(2,2,4);
plot(x,cdfAktual(:,4));
hold on;
plot(x,cdfWeibull(:,4));
xlabel('Kecepatan Angin (m/s)');
ylabel('CDF');
set(gca, 'YTick',0:0.1:1);
title('Ketinggian 100 m');
grid on;
hold off;
legend('Data Aktual','Weibull', 'Location','southeast');