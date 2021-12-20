vin1 = 2;
vr1 = 6;
Pr1 = 6.5;

x = 0:1:15;
v1 = 0:1:vr1;

vt1 = (((v1.^2)-(vin1.^2))/((vr1.^2)-(vin1.^2)))*Pr1;
vt1(1:vin1) = 0;
vt1(vr1+1:16) = Pr1;
vt1(16) = 0;

r1 = y1;
r1(16) = 0;
r1 = r1*8760;

y11 = (vt1.*r1)/1000;

subplot(2,1,1);

yyaxis left
p11 = plot(x,r1,'b');
%hold on
%plot(x,r,'b.','MarkerSize',10);

yyaxis right
p12 = plot(x,vt1,'r');
hold on
p13 = plot(x,y11,'g');
%plot(x,y,'r.','MarkerSize',10);
grid on

yyaxis left
title('WT3')
xlabel('Kecepatan Angin (m/s)')
ylabel('Durasi Angin (Jam)')

yyaxis right
ylabel('Power (kW), Energy (MWh/y)')
ylim([0 7])

set(gca, 'XTick',0:1:15);
legend([p11 p12 p13],{'Weibull','Kurva Daya','Energi'},'Location','east')

vin2 = 2;
vr2 = 10;
Pr2 = 2500;

x = 0:1:15;
v2 = 0:1:vr2;

vt2 = (((v2.^2)-(vin2.^2))/((vr2.^2)-(vin2.^2)))*Pr2;
vt2(1:vin2) = 0;
vt2(vr2+1:16) = Pr2;

r2 = y4;
r2(16) = 0;
r2 = r2*8760;

y22 = (vt2.*r2)/1000;

subplot(2,1,2);
yyaxis left
p11 = plot(x,r2,'b');

yyaxis right
p12 = plot(x,vt2,'r');
hold on
p13 = plot(x,y22,'g');
grid on

yyaxis left
title('WT15')
xlabel('Kecepatan Angin (m/s)')
ylabel('Durasi Angin (Jam)')

yyaxis right
ylabel('Power (kW), Energy (MWh/y)')
ylim([0 2700])

set(gca, 'XTick',0:1:15);

legend([p11 p12 p13],{'Weibull','Kurva Daya','Energi'},'Location','east')