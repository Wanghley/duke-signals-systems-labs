%% ============================================================
%  ECE 280L — Lab 01: RC Low-Pass Filter — Live Measurement
%  Input (A0) vs. Output (A1) comparison + Bode analysis
% =============================================================
%
%  HOW TO USE:
%   Run once per frequency setting on the function generator.
%   After a few runs at different frequencies, call Lab01_Bode() to
%   build the complete Bode plot from all measurements.
%
%  SETUP CHECKLIST:
%   [ ] Function generator: sine, 2 Vpp, +2.5 V DC offset
%   [ ] A0 connected to FG output (via 10 kΩ protection resistor)
%   [ ] A1 connected to node across capacitor (RC filter output)
%   [ ] Arduino sketch uploaded, Serial Monitor CLOSED
%   [ ] COM_PORT updated below
% =============================================================

clear; close all; clc;

%% ── USER PARAMETERS ─────────────────────────────────────────
COM_PORT    = '/dev/cu.usbmodem14101'; % <-- CHANGE THIS to your port
BAUD_RATE   = 115200;
SAMPLE_RATE = 2000;         % sps — must match Arduino sketch
FREQ_HZ     = 5.0;          % Hz  — must match function generator RIGHT NOW
R_OHM       = 10000;        % Ohms — your filter resistor value
C_FARAD     = 1e-6;         % Farads — your capacitor value
CAPTURE_SEC = 3;            % seconds to capture (3 s = 6000 samples)

%% ── Derived ─────────────────────────────────────────────────
N       = SAMPLE_RATE * CAPTURE_SEC;
t       = (0:N-1)' / SAMPLE_RATE;
fc      = 1 / (2*pi*R_OHM*C_FARAD);   % cutoff frequency [Hz]
tau     = R_OHM * C_FARAD;             % time constant [s]
omega   = 2*pi*FREQ_HZ;

fprintf('==============================================\n');
fprintf(' RC filter: R = %.0f Ω,  C = %.2g F\n', R_OHM, C_FARAD);
fprintf(' Cutoff frequency:  fc = %.2f Hz\n', fc);
fprintf(' Time constant:     τ  = %.4f s\n', tau);
fprintf(' Current test:      f  = %.1f Hz  (%.2f × fc)\n', FREQ_HZ, FREQ_HZ/fc);
fprintf('==============================================\n\n');

%% ── Connect to Arduino ───────────────────────────────────────
fprintf('Connecting on %s...\n', COM_PORT);
s = serialport(COM_PORT, BAUD_RATE);
configureTerminator(s, "LF");
flush(s);

t_conn = tic;
while true
    line = strtrim(readline(s));
    if contains(line, 'BEGIN'), break; end
    if toc(t_conn) > 10
        error('Timeout. Check port, board power, and that Serial Monitor is closed.');
    end
end
fprintf('Arduino ready. Capturing %.1f sec at %d sps...\n\n', CAPTURE_SEC, SAMPLE_RATE);

%% ── Capture ─────────────────────────────────────────────────
v_in  = zeros(N, 1);
v_out = zeros(N, 1);

% Live preview figure
fig_live = figure('Name','Live Capture','Color','white','Position',[50 400 900 350]);
ax_live  = axes(fig_live);
h_in_live  = plot(ax_live, t, v_in,  'b', 'LineWidth', 1.5, 'DisplayName','V_{in} (A0)');
hold(ax_live,'on');
h_out_live = plot(ax_live, t, v_out, 'r', 'LineWidth', 1.5, 'DisplayName','V_{out} (A1)');
legend(ax_live,'FontSize',11); grid(ax_live,'on');
xlabel(ax_live,'Time (s)','FontSize',12);
ylabel(ax_live,'Voltage (V)','FontSize',12);
title(ax_live,sprintf('Live: %.1f Hz through RC filter (R=%.0fΩ, C=%.2gF, fc=%.1fHz)',...
      FREQ_HZ, R_OHM, C_FARAD, fc),'FontSize',12);
ylim(ax_live,[0 5]); xlim(ax_live,[0 CAPTURE_SEC]);
drawnow;

for k = 1:N
    csv = readline(s);
    parts = strsplit(strtrim(csv), ',');
    if numel(parts) == 2
        v_in(k)  = str2double(parts{1});
        v_out(k) = str2double(parts{2});
    end
    if mod(k, 200) == 0
        set(h_in_live,  'YData', v_in);
        set(h_out_live, 'YData', v_out);
        title(ax_live, sprintf('Capturing... %d/%d  (%.0f%%)', k, N, 100*k/N), 'FontSize',11);
        drawnow limitrate;
    end
end
clear s;
fprintf('Capture done.\n\n');

%% ── Remove DC offset ─────────────────────────────────────────
skip = round(0.3 * SAMPLE_RATE);   % skip first 0.3 s (ADC settling)
v_in_ac  = v_in  - mean(v_in(skip:end));
v_out_ac = v_out - mean(v_out(skip:end));

%% ── Amplitude and phase via FFT ──────────────────────────────
WIN    = hann(N);
V_IN_F = fft(v_in_ac  .* WIN);
V_OUT_F= fft(v_out_ac .* WIN);
freqs  = (0:N-1)' * (SAMPLE_RATE/N);

% Find bin closest to FREQ_HZ
[~, idx] = min(abs(freqs - FREQ_HZ));

amp_in   = abs(V_IN_F(idx));
amp_out  = abs(V_OUT_F(idx));
mag_ratio = amp_out / amp_in;           % measured |H(jω)|
mag_dB    = 20*log10(mag_ratio);        % in dB
phase_rad = angle(V_OUT_F(idx)) - angle(V_IN_F(idx));   % measured phase
phase_deg = rad2deg(phase_rad);
% Wrap to (-180, 0] — low-pass filter always lags
if phase_deg > 90,  phase_deg = phase_deg - 360; end

% Theoretical values
H_theory_complex = 1 / (1 + 1j*omega*tau);
mag_theory    = abs(H_theory_complex);
phase_theory  = rad2deg(angle(H_theory_complex));
mag_dB_theory = 20*log10(mag_theory);

fprintf('━━━━━━━━━ Measurement at %.1f Hz ━━━━━━━━━\n', FREQ_HZ);
fprintf('  Magnitude ratio  |Vout/Vin|:\n');
fprintf('    Measured :  %.4f  (%.2f dB)\n', mag_ratio, mag_dB);
fprintf('    Theory   :  %.4f  (%.2f dB)\n', mag_theory, mag_dB_theory);
fprintf('    Error    :  %.2f dB\n', mag_dB - mag_dB_theory);
fprintf('  Phase shift:\n');
fprintf('    Measured :  %.1f°\n', phase_deg);
fprintf('    Theory   :  %.1f°\n', phase_theory);
fprintf('    Error    :  %.1f°\n', phase_deg - phase_theory);
fprintf('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n');

%% ── Build theoretical continuous waveforms ───────────────────
amp_in_pk = max(abs(v_in_ac(skip:end)));
theory_in  = amp_in_pk * sin(omega*t);
theory_out = amp_in_pk * mag_theory * sin(omega*t + deg2rad(phase_theory));

%% ── Figure 1: Time-domain overlay ───────────────────────────
figure('Name','RC Filter — Time Domain','Color','white','Position',[50 50 1050 580]);

subplot(2,1,1);
plot(t, v_in_ac,  'b',  'LineWidth',1.5, 'DisplayName','V_{in} — measured (A0)');
hold on;
plot(t, v_out_ac, 'r',  'LineWidth',1.5, 'DisplayName','V_{out} — measured (A1)');
plot(t, theory_out,'k--','LineWidth',1.8, 'DisplayName','V_{out} — theory H(j\omega)');
grid on; legend('Location','northeast','FontSize',11);
xlabel('Time (s)','FontSize',12); ylabel('Voltage (V, AC)','FontSize',12);
title(sprintf(['RC Low-Pass Filter  |  f = %.1f Hz  (%.2f × f_c)  |  ' ...
               '|H| measured = %.3f  (theory = %.3f)'], ...
               FREQ_HZ, FREQ_HZ/fc, mag_ratio, mag_theory), 'FontSize',12);
xlim([0 min(CAPTURE_SEC, 4/FREQ_HZ)]);  % show ~4 cycles max

subplot(2,1,2);
err = v_out_ac - theory_out;
plot(t, err, 'Color',[0.5 0.1 0.5], 'LineWidth',1.0);
hold on; yline(0,'k--');
grid on;
xlabel('Time (s)','FontSize',12); ylabel('Error (V)','FontSize',12);
title('Residual: V_{out,measured} − V_{out,theory}   (quantization + noise)','FontSize',11);
xlim([0 min(CAPTURE_SEC, 4/FREQ_HZ)]);

%% ── Figure 2: FFT spectrum ───────────────────────────────────
figure('Name','RC Filter — Spectrum','Color','white','Position',[80 30 850 380]);
f_plot = freqs(1:N/2);
mag_in_plot  = 2*abs(V_IN_F(1:N/2))  / N;
mag_out_plot = 2*abs(V_OUT_F(1:N/2)) / N;
semilogy(f_plot, mag_in_plot,  'b', 'LineWidth',1.5, 'DisplayName','V_{in}');
hold on;
semilogy(f_plot, mag_out_plot, 'r', 'LineWidth',1.5, 'DisplayName','V_{out}');
xline(fc,'k--','LineWidth',1.5,'Label',sprintf('f_c=%.1fHz',fc),...
      'LabelVerticalAlignment','bottom');
xline(FREQ_HZ,'g-','LineWidth',1.2,'Label',sprintf('f=%.1fHz',FREQ_HZ),...
      'LabelVerticalAlignment','top');
grid on; legend('FontSize',11);
xlabel('Frequency (Hz)','FontSize',12); ylabel('Amplitude (V)','FontSize',12);
title('FFT: Input vs. Output Spectrum','FontSize',12);
xlim([0.5 SAMPLE_RATE/2]); set(gca,'XScale','log');

%% ── Save measurement for Bode plot accumulation ──────────────
bode_file = 'bode_measurements.mat';
meas.freq      = FREQ_HZ;
meas.mag_ratio = mag_ratio;
meas.mag_dB    = mag_dB;
meas.phase_deg = phase_deg;
meas.R         = R_OHM;
meas.C         = C_FARAD;
meas.fc        = fc;

if isfile(bode_file)
    loaded = load(bode_file, 'all_meas');
    all_meas = loaded.all_meas;
    % Replace existing entry if same frequency
    freqs_saved = arrayfun(@(m) m.freq, all_meas);
    [~, dup] = min(abs(freqs_saved - FREQ_HZ));
    if abs(freqs_saved(dup) - FREQ_HZ) < 0.5
        all_meas(dup) = meas;
    else
        all_meas(end+1) = meas;
    end
else
    all_meas = meas;
end
save(bode_file, 'all_meas');
fprintf('Measurement saved. Total points: %d\n', numel(all_meas));
fprintf('Run Lab01_Bode.m to plot the Bode diagram.\n\n');

%% ── Quick Bode preview (if multiple measurements exist) ──────
if numel(all_meas) > 1
    Lab01_Bode;
end
