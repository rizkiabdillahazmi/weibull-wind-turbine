S1_VD_Olah = S1_VD(:,1);

% Data Harian
date1 = (datetime(2019,1,1,0,0,0):hours(1):datetime(2019,12,31,23,0,0))';
date2 = hour(date1);
TT = timetable(date1,S1_VD_Olah);
TT_out = retime(TT,'daily','mean');
TT_std = retime(TT,'monthly',@(v)std(v,[],1));

%G = groupsummary(TT,'date2','mean');