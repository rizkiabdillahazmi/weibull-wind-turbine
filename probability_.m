prob = N/8760;
figure;
bar(x(:,1),prob(:,1));

% xi = ln(v)
xi = log(x(:,1));
cdf = cumsum(prob);

% yi = ln(-ln(1-F(v)))
yi = log(-log(1-cdf));
figure;
scatter(xi(2:13,1),yi(2:13,1));