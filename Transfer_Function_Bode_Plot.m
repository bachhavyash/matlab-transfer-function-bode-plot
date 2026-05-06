% ============================================
% Project  : Transfer Function & Bode Plot
% Author   : Yash Ganesh Bachhav
% College  : LGNSCOE, Nashik (SPPU)
% Domain   : Control Systems
% Tool     : MATLAB / Octave
% ============================================

clc; clear; close all;

% Define Transfer Function
% G(s) = 10 / (s^2 + 3s + 10)
num = [10];
den = [1 3 10];
G = tf(num, den);

disp('============================================');
disp(' Transfer Function & Bode Plot Analysis    ');
disp(' Author : Yash Ganesh Bachhav - LGNSCOE   ');
disp('============================================');

% Display Transfer Function
disp('Transfer Function G(s) = 10 / (s^2 + 3s + 10)');
disp(G);

% Natural Frequency and Damping Ratio
[wn, zeta] = damp(G);
fprintf('\n--- System Properties ---\n');
fprintf('Natural Frequency (wn) : %.4f rad/s\n', wn(1));
fprintf('Damping Ratio (zeta)   : %.4f\n', zeta(1));

% Step Response Info
info = stepinfo(G);
fprintf('\n--- Step Response Info ---\n');
fprintf('Rise Time              : %.4f sec\n', info.RiseTime);
fprintf('Settling Time          : %.4f sec\n', info.SettlingTime);
fprintf('Peak Overshoot         : %.4f %%\n', info.Overshoot);
fprintf('Peak Value             : %.4f\n', info.Peak);

% Gain and Phase Margin
[Gm, Pm, Wgm, Wpm] = margin(G);
fprintf('\n--- Stability Margins ---\n');
fprintf('Gain Margin            : %.4f dB\n', 20*log10(Gm));
fprintf('Phase Margin           : %.4f deg\n', Pm);
fprintf('Gain Crossover Freq    : %.4f rad/s\n', Wpm);
fprintf('Phase Crossover Freq   : %.4f rad/s\n', Wgm);

% ---- PLOTS ----

% Plot 1 - Bode Plot with Margins
figure(1);
margin(G);
title('Bode Plot - G(s) = 10/(s^2+3s+10) | Yash Ganesh Bachhav');
grid on;
print(figure(1), 'bode_plot.png', '-dpng', '-r150');

% Plot 2 - Step Response
figure(2);
step(G);
title('Step Response | Yash Ganesh Bachhav');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
print(figure(2), 'step_response.png', '-dpng', '-r150');

% Plot 3 - Impulse Response
figure(3);
impulse(G);
title('Impulse Response | Yash Ganesh Bachhav');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
print(figure(3), 'impulse_response.png', '-dpng', '-r150');

% Plot 4 - Pole Zero Map
figure(4);
pzmap(G);
title('Pole-Zero Map | Yash Ganesh Bachhav');
grid on;
print(figure(4), 'pole_zero_map.png', '-dpng', '-r150');

disp('All plots saved!');
fprintf('\n============================================\n');
fprintf(' Simulation Complete!\n');
fprintf('============================================\n');
