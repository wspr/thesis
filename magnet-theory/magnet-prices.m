
% apr 2009 ?
size = ...
  2.54*[1/8 3/16 1/4 5/16 3/8 7/16 1/2 9/16 5/8 3/4 1 1.5 2];
price = ...
  [0.09 0.23 0.35 0.85 1.15 1.70 2.5 4.25 5.65 7.7 18.75 47.5 112];

% dec 2011
size2 = ...
    2.54*[1/8 3/16 1/4 5/16 3/8 7/16 1/2 9/16 5/8 3/4 1 1.5 2];
price2 = ...
  [0.2 0.44 0.8 1.32 2.08 3.08 4.4 6.04 8.04 13.36 39.96 129.44 224.40];

% dec 2012
size3 = ...
    2.54*[1/8  3/16 1/4  5/16 3/8  7/16 1/2  9/16 5/8  3/4   1     1.5   2];
price3 = ...
         [0.25 0.38 0.68 1.15 1.82 2.70 3.83 5.27 7.02 11.61 26.19 84.26 193.35];

     % aug 2013
size4 = ...
    2.54*[1/8  3/16 1/4  5/16 3/8  7/16 1/2  9/16 5/8  3/4   1     1.5   2];
price4 = ...
         [0.18 0.38 0.68 1.15 1.82 2.70 3.83 5.27 7.02 11.61 26.19 84.26 195.35];

willfig('mag-price','small'); clf; hold on
plot(size.^3,price,'.-','color',[0 0 0],'markeredgecolor','k')
plot(size2.^3,price2,'.-','color',[0 0 0],'markeredgecolor','k')
%plot(size3.^3,price3,'--','color',[0 0 0],'markeredgecolor','k')
text(2,20,'2011')
text(0.5,0.5,'2009')
colourplot
set(gca,'xscale','log','yscale','log')
axis([0.01 300 0.03 500])
set(gca,'xtick',logspace(-2,2,5),'ytick',logspace(-1,2,4))
xlabel('Magnet volume, \si{(mm)^3}','interpreter','none')
ylabel('Price per unit, U.S. dollars')

matlabfrag('mag-price')



%%
% Material Type	
% Residual Flux Density (Br)
% Coercive Force (Hc) 
% Intrinsic Coercive Force (Hci) 
% Max.Energy Product (BH)max
% N42	13.0-13.2 KGs	  >11.0 KOe	  >12 KOe	  40-42 MGOe
% N52	14.5-14.8 KGs	  >11.2 KOe	  >11 KOe	  49.5-52 MGOe

mu0 = 4*pi*1e-7;
bhmax42 = 7957.7*mean([40 42]);
bhmax52 = 7957.7*mean([49.5 52]);
rem42 = sqrt(4*mu0*bhmax42);
rem52 = sqrt(4*mu0*bhmax52);

br42 = 0.1*mean([13.0 13.2]);
br52 = 0.1*mean([14.5 14.8]);

ratio = (rem52/rem42)
ratio2 = (br52/br42)

finc = ratio^2
finc2 = ratio2^2

bhmaxmax = 7957.7*144;
brmax = sqrt(4*mu0*bhmaxmax);
ratio_max = brmax/br42
fincmax = ratio_max^2

%%
n42 = [ 0.09 0.23 0.38 0.19 0.46 0.47 0.89 2.50 0.63 5.75 ...
  0.96 1.50 3.30 9.10  14.85 6.40 47.50 9.75 15.25 28.95 57.5]
n52 = [ 0.15 0.32 0.47 0.27 0.60 0.62 1.15 3.50 ...
  0.85 7.50 1.20 1.95 4.30 12.50 18.75 8.00 60.00 13.25 21.5 34.5 95]

mean(n42)\mean(n52)

figure
plot(n52./n42)
