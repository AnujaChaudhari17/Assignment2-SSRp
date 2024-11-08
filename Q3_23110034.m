% Define time variables and sampling frequencies
t = 0:0.0001:0.01;  % Continuous-time vector for plotting

% Signal (a) - Sampling at 300 Hz (since max frequency = 300 Hz)
fs_a=300;  % Sampling frequency
n_a=0:1/fs_a:0.01;  % Discrete-time samples (sampling interval = 1/300 = 0.00333)
x_a_cont=1+sinc(300*pi*t);  % Continuous-time signal
x_a_disc=1+sinc(300*pi*n_a);  % Discrete-time signal 

% Signal (b) - Sampling at 4000 Hz (since max frequency = 2000 Hz)
fs_b=4000;  % Sampling frequency
n_b=0:1/fs_b:0.01;  % Discrete-time samples
x_b_cont=1 +cos(2000* pi*t)+sin(4000*pi* t);  % Continuous-time signal
x_b_disc=1+cos(2000 *pi*n_b)+sin(4000*pi*n_b);  % Discrete-time signal

% Signal (c) - Sampling at 340 Hz (since max frequency = 170 Hz)
fs_c=340;  % Sampling frequency
n_c=0:1/fs_c:0.01;  % Discrete-time samples
x_c_cont=10*sin(40*pi*t).*cos(300 * pi * t);  % Continuous-time signal
x_c_disc=10*sin(40*pi*n_c).*cos(300 * pi * n_c);  % Discrete-time signal

% Plotting
figure;

% Plot Signal (a)
subplot(3,2,1);
plot(t,x_a_cont, 'b');
title('Continuous Signal (a)');
xlabel('Time (s)');
ylabel('x_a(t)');

subplot(3,2,2);
stem(n_a,x_a_disc,'r');
title('Discrete Signal (a)-Sampled at 300 Hz');
xlabel('Sample index');
ylabel('x_a[n]');

% Plot Signal (b)
subplot(3,2,3);
plot(t,x_b_cont, 'b');
title('Continuous Signal (b)');
xlabel('Time (s)');
ylabel('x_b(t)');

subplot(3,2,4);
stem(n_b,x_b_disc,'r');
title('Discrete Signal (b) - Sampled at 4000 Hz');
xlabel('Sample index');
ylabel('x_b[n]');

% Plot Signal (c)
subplot(3,2,5);
plot(t,x_c_cont, 'b');
title('Continuous Signal (c)');
xlabel('Time (s)');
ylabel('x_c(t)');

subplot(3,2,6);
stem(n_c,x_c_disc,'r');
title('Discrete Signal (c) - Sampled at 340 Hz');
xlabel('Sample index');
ylabel('x_c[n]');



