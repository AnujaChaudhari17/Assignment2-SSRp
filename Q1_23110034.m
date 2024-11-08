%% Q1_23110034.m
clc; clear; close all;

%% Part (a): Define the parabolic signal x(t)
T_x=2;                   % Period of the parabolic signal
t_vector=0:0.01:10;      % Time vector from 0 to 10 with a step size of 0.01
% Define the parabolic signal with period T_x
x_t=(mod(t_vector,T_x).^2)/2.*(mod(t_vector,T_x)>=0&mod(t_vector,T_x)< 1);

% Plot the parabolic signal
figure;
subplot(3,1,1);  
plot(t_vector, x_t, 'LineWidth', 2);
title('Signal x(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% Part (a) continued: Manual computation of Fourier coefficients
num_harmonics = 50;                % Number of harmonics to compute
f_0=1/T_x;                     % Fundamental frequency
magnitude_spec_x=computeMagnitudeSpectrum(x_t, T_x, num_harmonics); 

% Plot the magnitude spectrum of x(t)
subplot(3,1,2);  
stem(0:num_harmonics-1,magnitude_spec_x, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum of x(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

%% Part (b): Extract and print the magnitudes of 3f, 5f, and 7f harmonics
mag_3f =magnitude_spec_x(3+1);    % Magnitude of 3rd harmonic
mag_5f =magnitude_spec_x(5+1);    % Magnitude of 5th harmonic
mag_7f=magnitude_spec_x(7+1);    % Magnitude of 7th harmonic

% Display the magnitudes of the selected harmonics
fprintf('Magnitude of 3rd Harmonic: %f\n',mag_3f);
fprintf('Magnitude of 5th harmonic: %f\n',mag_5f);
fprintf('Magnitude of 7th Harmonic: %f\n',mag_7f);

%% Part (c): Define rectangular pulse signal y(t)
T_y=5;                  % Period of the rectangular pulse signal
t_vector2=0:0.01:10;    % Time vector for y(t)
% Define the rectangular pulse signal with period T_y
y_t=2*(mod(t_vector2,T_y)>=0&mod(t_vector2,T_y)<3);

% Plot the rectangular pulse signal
figure;
subplot(4,1,1);
plot(t_vector2, y_t, 'LineWidth', 2);
title('Rectangular Pulse Signal y(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

% Compute the magnitude spectrum of y(t)
magnitude_spec_y = computeMagnitudeSpectrum(y_t, T_y, num_harmonics);  
% Plot the magnitude spectrum of y(t)
subplot(4,1,2);
stem(0:num_harmonics-1, magnitude_spec_y, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum of y(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

%% Part (c) continued: Sum of signals z(t) = x(t) + y(t)
z_t=x_t+y_t;  % Sum of x(t) and y(t)
% Plot the signal z(t)
subplot(4,1,3);
plot(t_vector2,z_t, 'LineWidth', 2);
title('Signal z(t)= x(t)+y(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

% Compute the magnitude spectrum of z(t)
T_z = 10;  % Period of the signal
magnitude_spec_z = computeMagnitudeSpectrum(z_t, T_z, num_harmonics);          
% Plot the magnitude spectrum of z(t)
subplot(4,1,4);
stem(0:num_harmonics-1, magnitude_spec_z, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum of z(t) = x(t)+y(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

%% Part (c) continued: Verify spectrum addition property
sum_spec=magnitude_spec_x+magnitude_spec_y;  % Sum of the spectra of x(t) and y(t)
% Plot the summed magnitude spectrum
figure;
stem(0:num_harmonics-1, sum_spec, 'filled', 'LineWidth', 1.5);
title('Summed Magnitude Spectrum of x(t) and y(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

% Check if the sum of spectra matches the spectrum of z(t)
is_equal = all(abs(magnitude_spec_z - sum_spec) < 1e-4);  
fprintf('Are the magnitude spectra of z(t) and the sum of x(t) and y(t) equal? %s\n', string(is_equal));

%% Function to calculate the magnitude spectrum of the signal
function mag_spec = computeMagnitudeSpectrum(signal, period, num_harmonics)
    Ck = zeros(1, num_harmonics);  % Initialize Fourier coefficients array
    omega0 = 2 * pi / period;       % Fundamental angular frequency
    t_vector = linspace(0, period, length(signal));  % Time vector for integration
    % Compute Fourier coefficients using trapezoidal integration
    for k = 1:num_harmonics
        integrand = signal .* exp(-1j * omega0 * (k-1) * t_vector);  % Fourier integral
        Ck(k)=(2/period)*trapz(t_vector,integrand);  % Compute Fourier coefficient
    end
    mag_spec=abs(Ck);  % Magnitude spectrum from Fourier coefficients
end




