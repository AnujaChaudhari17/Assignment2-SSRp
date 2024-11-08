% Q5_23110034
% Matlab code for Q5

syms t w
ramp_signal=t*heaviside(t);  % Define the ramp function r(t)

% Define x(t)=r(t+1)-2*r(t)+r(t-1)
x_function=subs(ramp_signal,t,t+1)-2 * +ramp_signal +subs(ramp_signal, t, t-1);

% Fourier Transform of x(t)
X_w_transform=fourier(x_function, w);

% Derivative of x(t) to obtain y(t)
y_function = diff(x_function, t);

% Fourier Transform of y(t)
Y_w_transform = fourier(y_function, w);

% Display Fourier transforms of X(w) and Y(w)
disp('X(w) = ');
disp(X_w_transform);
disp('Y(w) = ');
disp(Y_w_transform);

% Compute magnitude and phase of X(w) and Y(w)
magnitude_X = abs(X_w_transform);
phase_X = angle(X_w_transform);
magnitude_Y = abs(Y_w_transform);
phase_Y = angle(Y_w_transform);

% Plot Magnitude and Phase Spectrum for X(w)
figure;
subplot(2,1,1);
fplot(magnitude_X, [-50 50]); % Magnitude plot for X(w)
title('Magnitude Spectrum of X(w)');
xlabel('Frequency (rad/s)');
ylabel('|X(w)|');
grid on;

subplot(2,1,2);
fplot(phase_X, [-50 50]); % Phase plot for X(w)
title('Phase Spectrum of X(w)');
xlabel('Frequency (rad/s)');
ylabel('Phase of X(w)');
grid on;

% Plot Magnitude and Phase Spectrum for Y(w)
figure;
subplot(2,1,1);
fplot(magnitude_Y, [-50 50]); % Magnitude plot for Y(w)
title('Magnitude Spectrum of Y(w)');
xlabel('Frequency (rad/s)');
ylabel('|Y(w)|');
grid on;

subplot(2,1,2);
fplot(phase_Y, [-50 50]); % Phase plot for Y(w)
title('Phase Spectrum of Y(w)');
xlabel('Frequency (rad/s)');
ylabel('Phase of Y(w)');
grid on;

% Plot 20*log10 magnitude for smoother analysis
figure;
subplot(2,1,1);
fplot(20*log10(magnitude_X), [-50 50]); % Logarithmic magnitude plot for X(w)
title('20*log10|X(w)|');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
grid on;

subplot(2,1,2);
fplot(20*log10(magnitude_Y), [-50 50]); % Logarithmic magnitude plot for Y(w)
title('20*log10|Y(w)|');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
grid on;
