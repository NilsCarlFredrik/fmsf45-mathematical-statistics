n = 100;
p = 0.6;
np = n*p;
npq = np*(1-p);
x = linspace(np-4*sqrt(npq),np+4*sqrt(npq));

%%

figure(3)
stairs(0:n,binocdf(0:n,n,p))
hold on
plot(x,normcdf(x,np,srt(npq)))
hold off

%% 2.3

figure(4)
subplot(221)
bar(0:2, binopdf(0:2,2,.75))
title('Antal fr? som gror')
ylabel('p(x)')

mu = 10;
x = 0:4*mu;

subplot(234)
bar(x, poisspdf(x,0*mu))
title('Sk?rd om 0 fr? gror')
ylabel('p(y|x=0)')

subplot(235)
bar(x, poisspdf(x, 1*mu))
title('Sk?rd om 1 fr? gror')
ylabel('p(y|x=1)')

subplot(236)
bar(x, poisspdf(x, 2*mu))
title('Sk?rd om 2 fr? gror')
ylabel('p(y|x=2)')

%% Sannolikhetsfunktnion f?r Y

pY = poisspdf(x,0*mu)*binopdf(0,2,.75);
pY = pY + poisspdf(x,1*mu)*binopdf(1,2,.75);
pY = pY + poisspdf(x,2*mu)*binopdf(2,2,.75);

figure(5)
bar(x,pY)
xlabel('antal nya fr?n')

%% Sannolikhetsfunktnion f?r Y 

n=7; p=.75; mu=10;
y = 0:100;
pY = zeros(size(y)); 
for k=0:n
    pY = pY + poisspdf(y,k*mu)*binopdf(k,n,p)
end

figure(6)
bar(y,pY)
xlabel('antal nya fr?n')

%% 2.4 10

n=5; p=.65; mu=25;

figure(1)
harvest2D(n,p,mu)
figure(2)
harvest(n,p,mu)

%% 2.4 11

n=5; p=.65; mu=25; y=120;

figure(1)
harvestCond(n,p,mu,y)
figure(2)
harvest2D(n,p,mu)

%% 2.4 12

n=10; p=.5; mu=9; y=23;

figure(1)
harvestCond(n,p,mu,y)
figure(2)
harvest2D(n,p,mu)

%% 3

mu=3;                       % sanna mu-v?rde
x= poissrnd(mu,2,1)         % 2x1-matris med Po(mu)-slumptal
xmedel = mean(x)            % medelv?rde

%%

mu=2.9;
n=20;                        %antal termer i medelv?rdet
M=1000;                     %antal simuleringar
x=poissrnd(mu,n,M);         %nxM-matris. x1 f?rsta raden, xn i sista
xmedel=mean(x);             % M st medelv?rden
subplot(2,1,1)
hist(x(1,:),0:15)           %histogram ?ver de M st x1-v?rdena
title('x1-v?rden')
subplot(2,1,2)
hist(xmedel,0:0.1:15)       %histogram ?ver de M st x-medelv?rdena
title('x-medelv?rden')







