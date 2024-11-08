% Define the period and time vector
T0=2;
t = linspace(0,T0,1000);  % Time vector
% Define x(t) using unit step function
x_t=heaviside(t)-2*heaviside(t-1)+heaviside(t-2);
N=30; 
x_approx=zeros(size(t));
magnitude_spectrum=zeros(1,N);  % Initialize magnitude spectrum array
for k=1:N
    ck=2/T0*trapz(t,x_t.*exp(-1j *2*pi*k/T0*t));  % Fourier coefficient
    x_approx=x_approx+real(ck*exp(1j*2*pi*k/T0*t));
    magnitude_spectrum(k)=abs(ck);  % Store magnitude of each coefficient
end
% Plot the original and approximated signal
figure;
subplot(3,1,1);
plot(t, x_t, 'LineWidth', 2);
title('Original Signal x(t)');
xlabel('Time (t)');
ylabel('x(t)');

subplot(3,1,2);
plot(t, x_approx, 'LineWidth', 2);
title('Approximated Signal with 30 Harmonics');
xlabel('Time (t)');
ylabel('x''(t)');

% Plot the magnitude spectrum of x'(t)
subplot(3,1,3);
stem(1:N, magnitude_spectrum, 'filled', 'LineWidth', 1.5);
title('Magnitude Spectrum  x''(t)');
xlabel('Harmonic Number');
ylabel('Magnitude');
grid on;
