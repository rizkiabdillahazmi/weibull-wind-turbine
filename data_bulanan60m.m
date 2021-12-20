bulan = [31 28 31 30 31 30 31 31 30 31 30 31];

jan = 31*24;
feb = jan+28*24;
mar = feb+31*24;
apr = mar+30*24;
mei = apr+31*24;
jun = mei+30*24;
jul = jun+31*24;
agu = jul+31*24;
sep = agu+30*24;
okt = sep+31*24;
nov = okt+30*24;
des = nov+31*24;

S1_Bulanan(1,1) = min(v_S1(1:31*24,6));
S1_Bulanan(2,1) = min(v_S1(jan+1:feb,6));
S1_Bulanan(3,1) = min(v_S1(feb+1:mar,6));
S1_Bulanan(4,1) = min(v_S1(mar+1:apr,6));
S1_Bulanan(5,1) = min(v_S1(apr+1:mei,6));
S1_Bulanan(6,1) = min(v_S1(mei+1:jun,6));
S1_Bulanan(7,1) = min(v_S1(jun+1:jul,6));
S1_Bulanan(8,1) = min(v_S1(jul+1:agu,6));
S1_Bulanan(9,1) = min(v_S1(agu+1:sep,6));
S1_Bulanan(10,1) = min(v_S1(sep+1:okt,6));
S1_Bulanan(11,1) = min(v_S1(okt+1:nov,6));
S1_Bulanan(12,1) = min(v_S1(nov+1:des,6));

S1_Bulanan(1,2) = max(v_S1(1:31*24,6));
S1_Bulanan(2,2) = max(v_S1(jan+1:feb,6));
S1_Bulanan(3,2) = max(v_S1(feb+1:mar,6));
S1_Bulanan(4,2) = max(v_S1(mar+1:apr,6));
S1_Bulanan(5,2) = max(v_S1(apr+1:mei,6));
S1_Bulanan(6,2) = max(v_S1(mei+1:jun,6));
S1_Bulanan(7,2) = max(v_S1(jun+1:jul,6));
S1_Bulanan(8,2) = max(v_S1(jul+1:agu,6));
S1_Bulanan(9,2) = max(v_S1(agu+1:sep,6));
S1_Bulanan(10,2) = max(v_S1(sep+1:okt,6));
S1_Bulanan(11,2) = max(v_S1(okt+1:nov,6));
S1_Bulanan(12,2) = max(v_S1(nov+1:des,6));

S1_Bulanan(1,3) = mean(v_S1(1:31*24,6));
S1_Bulanan(2,3) = mean(v_S1(jan+1:feb,6));
S1_Bulanan(3,3) = mean(v_S1(feb+1:mar,6));
S1_Bulanan(4,3) = mean(v_S1(mar+1:apr,6));
S1_Bulanan(5,3) = mean(v_S1(apr+1:mei,6));
S1_Bulanan(6,3) = mean(v_S1(mei+1:jun,6));
S1_Bulanan(7,3) = mean(v_S1(jun+1:jul,6));
S1_Bulanan(8,3) = mean(v_S1(jul+1:agu,6));
S1_Bulanan(9,3) = mean(v_S1(agu+1:sep,6));
S1_Bulanan(10,3) = mean(v_S1(sep+1:okt,6));
S1_Bulanan(11,3) = mean(v_S1(okt+1:nov,6));
S1_Bulanan(12,3) = mean(v_S1(nov+1:des,6));


S1_Bulanan(1,4) = std(v_S1(1:31*24,6));
S1_Bulanan(2,4) = std(v_S1(jan+1:feb,6));
S1_Bulanan(3,4) = std(v_S1(feb+1:mar,6));
S1_Bulanan(4,4) = std(v_S1(mar+1:apr,6));
S1_Bulanan(5,4) = std(v_S1(apr+1:mei,6));
S1_Bulanan(6,4) = std(v_S1(mei+1:jun,6));
S1_Bulanan(7,4) = std(v_S1(jun+1:jul,6));
S1_Bulanan(8,4) = std(v_S1(jul+1:agu,6));
S1_Bulanan(9,4) = std(v_S1(agu+1:sep,6));
S1_Bulanan(10,4) = std(v_S1(sep+1:okt,6));
S1_Bulanan(11,4) = std(v_S1(okt+1:nov,6));
S1_Bulanan(12,4) = std(v_S1(nov+1:des,6));

% k
S1_Bulanan(:,5) = (S1_Bulanan(:,4)./S1_Bulanan(:,3)).^(-1.086);
% c
S1_Bulanan(:,6) = S1_Bulanan(:,3)./(gamma(1+(1./S1_Bulanan(:,5))));

% k
S1_Bulanan_60m(:,1) = (S1_Bulanan(:,4)./S1_Bulanan(:,3)).^(-1.086);
% c
S1_Bulanan_60m(:,2) = S1_Bulanan(:,3)./(gamma(1+(1./S1_Bulanan(:,5))));

S1_tahunan(1,1) = min(v_S1(:,6));
S1_tahunan(1,2) = max(v_S1(:,6));
S1_tahunan(1,3) = mean(v_S1(:,6));
S1_tahunan(1,4) = std(v_S1(:,6));