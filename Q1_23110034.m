%% Q1_studentID.m
clc; clear; close all;

%% Part (a): Define the parabolic signal x(t)
X_period =2;              
time_vector=0:0.01:10;    % Time vector from 0 to 10 with a step size of 0.01

% Define the parabolic signal with period X_period
x_t=(mod(time_vector,X_period).^2)/2.*(mod(time_vector,X_period)>=0 &mod(time_vector, X_period)<1);  

% Plot the parabolic signal
figure;
subplot(3,1,1);  
plot(time_vector, x_t, 'LineWidth', 2);
title('Parabolic Signal x(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% Part (a) continued: Manual computation of Fourier coefficients
Harmonics=50;             % Number of harmonics to compute
Fundamental_freq=1/X_period;       % Fundamental frequency
mag_spec_x=computeMagnitudeSpectrum(x_t,X_period,Harmonics);  % Magnitude spectrum of x(t)

% Plot the magnitude spectrum of x(t)
subplot(3,1,2);  
stem(0:Harmonics-1, mag_spec_x, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum of x(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

%% Part (b): Extract and print the magnitudes of 3f, 5f, and 7f harmonics
mag_3f=mag_spec_x(3 + 1);  % Magnitude of 3rd harmonic
mag_5f=mag_spec_x(5 + 1);  % Magnitude of 5th harmonic
mag_7f=mag_spec_x(7 + 1);  % Magnitude of 7th harmonic

% Display the magnitudes of the selected harmonics
fprintf('Magnitude of 3f: %f\n', mag_3f);
fprintf('Magnitude of 5f: %f\n', mag_5f);
fprintf('Magnitude of 7f: %f\n', mag_7f);

%% Part (c): Define rectangular pulse signal y(t)
Y_period = 5;           
time_vector2 = 0:0.01:10;  % Time vector for y(t)

% Define the rectangular pulse signal with period Y_period
y_t=2*(mod(time_vector2,Y_period)>=0&mod(time_vector2,Y_period)<3);

% Plot the rectangular pulse signal
figure;
subplot(4,1,1);
plot(time_vector2, y_t, 'LineWidth', 2);
title('Rectangular Pulse Signal y(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

% Compute the magnitude spectrum of y(t)
mag_spec_y = computeMagnitudeSpectrum(y_t, Y_period, Harmonics);  

% Plot the magnitude spectrum of y(t)
subplot(4,1,2);
stem(0:Harmonics-1, mag_spec_y, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum of y(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

%% Part (c) continued: Sum of signals z(t) = x(t) + y(t)
z_t=x_t+y_t;  % Sum of x(t) and y(t)

% Plot the signal z(t)
subplot(4,1,3);
plot(time_vector2, z_t, 'LineWidth', 2);
title('Signal z(t) = x(t) + y(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;
T_z=10;  % Period of the signal
mag_spec_z=computeMagnitudeSpectrum(z_t,T_z,Harmonics);          

% Plot the magnitude spectrum of z(t)
subplot(4,1,4);
stem(0:Harmonics-1, mag_spec_z, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum of z(t) = x(t) + y(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;

%% Part (c) continued: Verify spectrum addition property
sum_spec=mag_spec_x+mag_spec_y; 

% Check if the sum of spectra matches the spectrum of z(t)
is_equal = all(abs(mag_spec_z - sum_spec) < 1e-4);  
fprintf('Are the magnitude spectra equal? %s\n', string(is_equal));

%% Function to calculate the magnitude spectrum of the signal
function mag_spec=computeMagnitudeSpectrum(signal, period, Harmonics)
    Ck=zeros(1,Harmonics);  % Initialize Fourier coefficients array
    omega0 =2*pi/period;  % Fundamental angular frequency
    time_vector=linspace(0,period,length(signal));  % Time vector for integration

    % Compute Fourier coefficients using trapezoidal integration
    for k = 1:Harmonics
        integrand=signal .*exp(-1j*omega0*(k-1)*time_vector);  % Fourier integral
        Ck(k)=(2/period)*trapz(time_vector,integrand);  % Compute Fourier coefficient
    end
    
    mag_spec=abs(Ck);  % Magnitude spectrum from Fourier coefficients
end


