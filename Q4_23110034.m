% Define time vector and signal
time=0:1/100:10-1/100; % Time vector with sampling frequency of 100 Hz
signal=sin(2*pi*15*time)+sin(2*pi*40*time); % Signal with frequencies 15 Hz and 40 Hz

% Parameters for DTFT computation
num_samples=length(signal);          % Total number of samples
freq_vector=(-num_samples/2:num_samples/2-1)*(100/num_samples); % Frequency vector centered at zero

% Manually compute DTFT
DTFT_manual=zeros(1,num_samples); % Initialize DTFT result array
for freq_bin = 1:num_samples         % Loop through frequency bins
    for time_sample = 1:num_samples  % Loop through time samples
        DTFT_manual(freq_bin) = DTFT_manual(freq_bin) + signal(time_sample) * exp(-1j * 2 * pi * (freq_bin-1) * (time_sample-1) / num_samples); % DTFT formula
    end
end

% Shift zero-frequency component to the center
DTFT_manual_shifted = fftshift(DTFT_manual); % Shifted DTFT for better visualization

% Plot the manually computed DTFT magnitude and phase
figure;

% Plot magnitude of manually computed DTFT
subplot(2,1,1);
plot(freq_vector, abs(DTFT_manual_shifted), 'LineWidth', 1.5); 
title('Magnitude of DTFT (Manual Calculation)'); 
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Plot phase of manually computed DTFT
subplot(2,1,2);
plot(freq_vector, angle(DTFT_manual_shifted), 'LineWidth', 1.5);
title('Phase of DTFT (Manual Calculation)'); 
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Compare with MATLAB's built-in FFT
FFT_result = fft(signal); % FFT using MATLAB's built-in function
FFT_result_shifted = fftshift(FFT_result); % Shift zero-frequency component to the center

% Plot the FFT magnitude and phase for comparison
figure;

% Plot magnitude of FFT
subplot(2,1,1);
plot(freq_vector, abs(FFT_result_shifted), 'LineWidth', 1.5);
title('Magnitude of FFT (Built-in Function)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Plot phase of FFT
subplot(2,1,2);
plot(freq_vector, angle(FFT_result_shifted), 'LineWidth', 1.5);
title('Phase of FFT (Built-in Function)');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
