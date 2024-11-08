% Q5_23110034.m
% Define the time vector (range: -10 to 10 seconds)
time_interval= -10:0.01:10;

% Define the ramp function
ramp_function=@(t) t .* (t >= 0); % Ramp function for t >= 0

% Define x(t)
signal_x=ramp_function(time_interval+1)-2*ramp_function(time_interval)+ramp_function(time_interval-1);

% Differentiate x(t) to obtain y(t)
signal_y=gradient(signal_x,time_interval(2)-time_interval(1)); % Numerical differentiation

% Compute the FFT of x(t) and y(t)
fft_signal_x=fftshift(fft(signal_x));
fft_signal_y=fftshift(fft(signal_y));

% Define frequency in radians and convert to Hertz
frequency_radians=linspace(-pi,pi,length(time_interval)); % Frequency in radians
frequency_hz=frequency_radians/(2*pi*(time_interval(2)-time_interval(1))); % Convert to Hertz

% Plot x(t) and y(t) in the time domain with different color schemes
figure;
subplot(2,1,1);
plot(time_interval, signal_x, 'm'); % Use magenta for x(t)
title('Signal x(t)');
xlabel('Time (seconds)');
ylabel('Amplitude of x(t)');
grid on;

subplot(2,1,2);
plot(time_interval,signal_y,'g'); % Use green for y(t)
title('Signal y(t)');
xlabel('Time (seconds)');
ylabel('Amplitude of y(t)');
grid on;

% Plot magnitude and phase spectra of fft_signal_x with updated color
figure;
subplot(2,1,1);
plot(frequency_hz, abs(fft_signal_x), 'b'); % Blue for magnitude
title('Magnitude Spectrum |X(f)|');
xlabel('Frequency (Hz)');
ylabel('Magnitude of X(f)');
grid on;

subplot(2,1,2);
plot(frequency_hz, angle(fft_signal_x), 'r'); % Red for phase
title('Phase Spectrum ∠X(f)');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Plot magnitude and phase spectra of fft_signal_y with updated color
figure;
subplot(2,1,1);
plot(frequency_hz, abs(fft_signal_y), 'c'); % Cyan for magnitude of y(t)
title('Magnitude Spectrum |Y(f)|');
xlabel('Frequency(Hz)');
ylabel('Magnitude of Y(f)');
grid on;

subplot(2,1,2);
plot(frequency_hz, angle(fft_signal_y), 'k'); % Blue for phase of y(t)
title('Phase Spectrum ∠Y(f)');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Plot 20*log10|fft_signal_x| in a separate figure with changed colors
figure;
plot(frequency_hz, 20*log10(abs(fft_signal_x)), 'm'); % Magenta for log magnitude
title('Log Magnitude Spectrum 20*log10|X(f)|');
xlabel('Frequency (Hz)');
ylabel('20*log10|X(f)|');
grid on;

% Plot 20*log10|fft_signal_y| in a separate figure with different color
figure;
plot(frequency_hz, 20*log10(abs(fft_signal_y)), 'g'); % Green for log magnitude
title('Log Magnitude Spectrum 20*log10|Y(f)|');
xlabel('Frequency (Hz)');
ylabel('20*log10|Y(f)|');
grid on;

