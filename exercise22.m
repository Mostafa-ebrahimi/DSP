% This Code is Related to Fourier transform 
%Seismology Course and programmed by Mostafa Ebrahimi
%the current Master student at the University of Tehran
clc
clear
clf

load my_sig
dta=0.001;
Na=1024; 
fsa=1/(dta);

trange1=(Na-1)*dta;
ta=-trange1/2:dta:trange1/2;
fa=[-Na/2:Na/2-1]*(fsa)/Na;


xa=my_sig;%discrete time
% X1=fft(x1);
Xa=fftshift(fft(xa));%discrete frequency transform of x(n)

%%b
dtb=0.002;
Nb=512;
fsb=1/(dtb)
trangeb=(Nb-1)*dtb;
tb=-trangeb/2:dtb:trangeb/2;
xb=my_sig(1:2:1024,1);
fb=[-Nb/2:Nb/2-1]*(fsb)/Nb;


Xb=fft(xb);%discrete frequency transform of x(n)
Xb=fftshift(real(Xb));

%%c
dtc=dta;
Nc=2048;
fsc=1/(dtc);

xc=zeros(2048,1);
xc(1:1024,1)=xa;
trange3=(Nc-1)*dtc;
tc=-trange3/2:dtc:trange3/2;
fc=[-Nc/2:Nc/2-1].*(fsc)/Nc;

Xc=fftshift(real(fft(xc)));%discrete frequency transform of  x(n)
%%%%%%%%%%%%graph
subplot(3,2,1);plot(ta,xa,'b');grid
xlabel('ta');ylabel('my sig')

subplot(3,2,2);plot(fa,Xa,'b');grid
xlabel('fa');ylabel('MY SIG');ylim([-50 50])

subplot(3,2,3);plot(tb,xb,'r');grid
xlabel('tb');ylabel('my sig');

subplot(3,2,4);plot(fb,Xb,'r');grid
xlabel('fb');ylabel('MY SIG');xlim([-500 500]);ylim([-50 50])

subplot(3,2,5);plot(tc,xc,'k');grid
xlabel('tc');ylabel('my sig')

subplot(3,2,6);plot(fc,Xc,'k');grid, title('with zero padding');
xlabel('fc');ylabel('MY SIG');
