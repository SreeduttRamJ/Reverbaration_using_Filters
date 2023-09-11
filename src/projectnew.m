clc
clearvars
close all

[x,fs]=audioread("countdown.wav"); %make sure the file is in the same folder as your code

G = 0.45;
Td = 1;


% Calculate Nd based on Td and Fs
Nd = round(Td * fs);

% Defining the filter coefficients
b = [1];
a = [1 -G];

% Compute the frequency and phase response
freqz(b, a);


% Plot the pole-zero diagram
figure
pzmap(tf(b,a))

% Check filter stability
poles = roots(a);
if all(abs(poles) < 0)
    disp('Filter is stable.');
else
    disp('Filter is unstable.');
end

figure
subplot(2,1,1)
plot(1:length(x),x)
title("Original signal")
ylabel("Magnitude")
xlabel("time")

subplot(2,1,2)
X=filter(b,a,x);
plot(1:length(X),abs(X))
title("Filtered signal")
ylabel("Magnitude")
xlabel("time")

