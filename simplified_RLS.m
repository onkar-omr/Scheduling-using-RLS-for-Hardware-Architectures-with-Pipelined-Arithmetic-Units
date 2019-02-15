%Implementaion of Simplified RLS Filter
%
%PLease Read the README.pdf file before running this file
%
%
%Author: Onkar 
%
%
%
%The following code is used to just implement the filter but the main use of the
%code is that it is further used to draw the directed graph by using the
%dependencies in this code.
%
%
%
%
%
%
%
clc
close all
clear all

%
%First, we accept the length of input sequence and store it in N
%
N=input('length of input sequence N = ');
%we decide the time or the nu,ber of times to run the loop as 0 to N-1 from 
t=[0:N-1];
ita=10^4;

%Array of 1's
I=ones(1,N);
R=ita*I;
w0=0.001;  phi=0.1;
%%Initialisations and Filter Equations
%  x - input signal
%  d - desired signal
%  e - error signal
%  yd - desired output

d=sin(2*pi*[1:N]*w0+phi);
x=d+randn(1,N)*0.5;%%This is where we add noise to input signal
w=zeros(1,N); 
%
%Computations for Implementation of RLS filter
%
for i=1:N
   y(i) = w(i)' * x(i);
   e(i) = d(i) - y(i);
   z(i) = R(i) * x(i);
   q = x(i)' * z(i);
   v = 1/(1+q);
   zz(i) = v * z(i);
   w(i+1) = w(i) + e(i)*zz(i);
   R(i+1) = R(i) - zz(i)*z(i);
end
%
%
%yd gives the desired output.
%
for i=1:N
yd(i) = sum(w(i)' * x(i));  
end
subplot(221),plot(t,d),ylabel('Desired Signal'),
subplot(222),plot(t,x),ylabel('Input Signal+Noise'),
subplot(223),plot(t,e),ylabel('Error'),
subplot(224),plot(t,yd),ylabel('Adaptive Desired output');