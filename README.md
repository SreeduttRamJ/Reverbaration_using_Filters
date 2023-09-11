
<h1 align="center">Study of reverberation phenomenon using IIR filters</h1>
  
## Objective

The objective of this project is to implement a reverberation phenomenon in MATLAB programming environment using a feedback delay network (FDN) based on Infinite Impulse Response (IIR) filters. The goal is to simulate sound reflections encountered in enclosed spaces and analyze how the IIR filters create reverberation.

# Abstract

In this project we are going to implement a reverberation phenomenon in MATLAB programming environment. Reverberation, a fundamental audio effect, simulates the sound reflections encountered in enclosed spaces. Our approach focuses on designing a feedback delay network (FDN) based on Infinite Impulse Response (IIR) filters to create the reverberation phenomenon and analyze it to find how the filter creates reverberation. This work contributes to the field of audio signal processing and provides insights into the design and implementation of IIR-based echoing effects. Future research may explore advanced techniques for enhancing the realism and spatialization of echoes using additional signal processing algorithms.

<p align="center">
  <img src="/docs/abstract.png" alt="Fig. 1: An echo-y sound environment" style="height: 300px; width: 500px;"/>
  <p align="center">Fig. 1: An echo-y sound environment: The audio reflections of a person's voice are heard coming from different mountains.</p>
</p>


<p align="center">
  <img src="/docs/table.png" alt="Fig. 2: Table of Delays" style="height: 400px; width: 600px;"/>
  <p align="center">Fig. 2: Table of Delays: Td1 represents the time delay for the first echo, Td2 represents the time delay for the second echo, G1 represents the attenuation factor for the first echo, and G2 represents the attenuation factor for the second echo.</p>
</p>

Here we have mainly focusing on the Case 3: i,e. Student No - 3; Td1=0.35sec, Td2=0.65sec, G1=0.7, G2=0.3

For further details refer the Report / Paper [DSPP_Project_Sid_WC121](./docs/DSPP_Project_Sid_WC121.pdf)
  
## Methodology

The methodology involves designing digital filters, calculating delays, and attenuations based on specific parameters, including student numbers. Utilized MATLAB for filter implementation and use the "countdownfrom.mp3" speech file as the input for our simulations. The results are carefully examined and compared against the original audio to demonstrate the presence of disassembled echoes.

## Contents

The repository contains the following files:

- `src/`: This directory contains the MATLAB source code for the digital filters implementation.
- `data/`: Here, you can find the "countdownfrom.mp3" speech file used as input data.
- `results/`: Contains the output audio files generated by the filters and the comparison results.
- `docs/`: Any additional documentation related to the project.

## How to Use

1. Clone the repository to your local machine using the following command:
```
git clone https://github.com/Sid-WC121/Audio-Echo-Modelling

```
2. Navigate to the `src/` directory and run the MATLAB script to generate the simulated audio echoes.

3. The output audio files are saved in the `results/` directory for further analysis and comparison. The result generated from the code will be saved as `1st_echoed_signal.wav`, `2nd_echoed_signal.wav` and `output_signal.wav`

<h2 align="center">or</h2>

You can Copy the code from here:

## Source Code

```
clc;
clear all;
close all;

%% TO GENERATE 2 ECHOES OF DELAYS 0.35sec AND 0.65sec WITH A GAIN OF 0.7 AND 0.3

%% READING THE AUDIO
[y, fs] = audioread("countdown.mp3");
p = audioplayer(y, fs);
play(p);
stop(p);

%% VALUES FOR ZEROPADDING
n1 = round(0.35 * fs);  % n1 IS FOR THE NUMBER OF ZEROS TO DELAY THE SIGNAL
n2 = round(0.65 * fs);  % n2 IS FOR THE NUMBER OF ZEROS TO DELAY THE SIGNAL

num1 = [1, zeros(1, n1-1), 0.7];  % 1st echo with delay of 0.35sec and gain 0.7
num2 = [1, zeros(1, n2-1), 0.3];  % 2nd echo with delay of 0.65sec and gain 0.3

NUM = [1, zeros(1, n1), 0.7, zeros(1, n2-n1), 0.3];  % Combined filter coefficients

figure(1)
x1 = filter(num1, 1, y);
subplot(2, 1, 1);
plot(y);
title("Input signal");
xlabel("time");
ylabel("amplitude");

% Save the 1st echoed signal as a WAV file
audiowrite("1st_echoed_signal.wav", x1, fs);

x2 = filter(num2, 1, y);
subplot(2, 1, 2);
plot(x2);
title("2nd echoed signal");
xlabel("time");
ylabel("amplitude");

% Save the 2nd echoed signal as a WAV file
audiowrite("2nd_echoed_signal.wav", x2, fs);

figure(2)
freqz(num1, 1);
title("Spectrum of 1st echoed signal");

figure(3)
pzmap(num1, 1)
title("Pole-Zero map of 1st echoed signal");
 
figure(4)
freqz(num2, 1);
title("Spectrum of 2nd echoed signal");

figure(5)
pzmap(num2, 1);
title("Pole-Zero map of 2nd echoed signal");

figure(6)
x = filter(NUM, 1, y);  % Filtering the signal with the combined filter coefficients
plot(x);
title("Final output signal");
xlabel("time");
ylabel("amplitude");

figure(7)
freqz(NUM, 1);
title("Spectrum of Final output signal");

figure(8)
pzmap(NUM, 1);
title("Pole-Zero map of final output signal");

% Save the output signal as a WAV file
audiowrite("output_signal.wav", x, fs);

```

## Acknowledgments

I would like to express our gratitude to _**Dr. A. Manikandan**_ for supervising and guiding this research project.
