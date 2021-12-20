c = 6.24;
k = 2.09;

vc = 2;
vr = 10;
vo = 25;

atas = ((exp(-(vc/c)^k))-(exp(-(vr/c)^k)));
bawah = ((vr/c)^k)-((vc/c)^k);
kurang = exp(-(vo/c)^k);

cf = (atas/bawah)-kurang;