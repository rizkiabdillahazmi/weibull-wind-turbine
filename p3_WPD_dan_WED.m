WPD_10m = 0.5*1.225.*k_c_10m(:,2).^3.*(gamma(1+(3./k_c_10m(:,1))));
WPD_100m = 0.5*1.225.*k_c_100m(:,2).^3.*(gamma(1+(3./k_c_100m(:,1))));

WED_10m = (WPD_10m*8760)/1000;
WED_100m = (WPD_100m*8760)/1000;