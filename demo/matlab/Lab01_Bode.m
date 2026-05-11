%% ============================================================
%  ECE 280L — Lab 01: RC Filter Bode Plot
%  Plots measured frequency response vs. theoretical H(jω)
%  Called automatically from Lab01_MATLAB_Plotter.m
%  or run manually after collecting multiple frequency points.
% =============================================================

if ~isfile('bode_measurements.mat')
    error('No measurements yet. Run Lab01_MATLAB_Plotter.m at several frequencies first.');
end

load('bode_measurements.mat', 'all_meas');

% Sort by frequency
[~, ord] = sort(arrayfun(@(m) m.freq, all_meas));
all_meas = all_meas(ord);

f_meas     = arrayfun(@(m) m.freq,      all_meas);
mag_meas   = arrayfun(@(m) m.mag_dB,    all_meas);
phase_meas = arrayfun(@(m) m.phase_deg, all_meas);

R  = all_meas(1).R;
C  = all_meas(1).C;
fc = all_meas(1).fc;

% Theoretical curves
f_th = logspace(log10(0.1), log10(10*max(f_meas)), 500);
H_th = 1 ./ (1 + 1j * 2*pi*f_th * R * C);
mag_th   = 20*log10(abs(H_th));
phase_th = rad2deg(angle(H_th));

% ── Figure ───────────────────────────────────────────────────
figure('Name','ECE 280L — Bode Plot: RC Low-Pass Filter',...
       'Color','white','Position',[60 60 900 600]);

% Magnitude
ax1 = subplot(2,1,1);
semilogx(ax1, f_th, mag_th, 'b-', 'LineWidth', 2, 'DisplayName','Theory: H(j\omega)=\frac{1}{1+j\omegaRC}');
hold(ax1,'on');
semilogx(ax1, f_meas, mag_meas, 'ro', 'MarkerSize', 9, 'LineWidth', 2,...
         'MarkerFaceColor','r', 'DisplayName','Arduino measured');
xline(ax1, fc, 'k--', 'LineWidth',1.5,...
      'Label', sprintf('f_c = %.1f Hz  (−3 dB)', fc),...
      'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','right');
yline(ax1, -3, 'k:', 'LineWidth',1.2);
grid(ax1,'on'); legend(ax1,'Location','southwest','FontSize',11);
ylabel(ax1,'|H(j\omega)| (dB)','FontSize',12);
title(ax1, sprintf('Bode Plot — RC Low-Pass Filter  |  R = %.0f Ω,  C = %.2g F,  f_c = %.2f Hz',...
      R, C, fc), 'FontSize',13);
ylim(ax1, [-40 5]);

% Phase
ax2 = subplot(2,1,2);
semilogx(ax2, f_th, phase_th, 'b-', 'LineWidth', 2, 'DisplayName','Theory');
hold(ax2,'on');
semilogx(ax2, f_meas, phase_meas, 'ro', 'MarkerSize', 9, 'LineWidth', 2,...
         'MarkerFaceColor','r', 'DisplayName','Measured');
xline(ax2, fc, 'k--','LineWidth',1.5,...
      'Label', sprintf('f_c = %.1f Hz  (−45°)', fc),...
      'LabelVerticalAlignment','top');
yline(ax2, -45, 'k:','LineWidth',1.2,'Label','−45°',...
      'LabelHorizontalAlignment','right');
grid(ax2,'on'); legend(ax2,'Location','southwest','FontSize',11);
xlabel(ax2,'Frequency (Hz)','FontSize',12);
ylabel(ax2,'\angle H(j\omega) (degrees)','FontSize',12);
ylim(ax2,[-100 10]);
linkaxes([ax1 ax2],'x');
xlim(ax2,[0.5 max(f_meas)*5]);

% Summary table in command window
fprintf('\n══════════════════════════════════════════════════════\n');
fprintf('  Bode Measurement Summary   R=%.0fΩ  C=%.2gF  fc=%.2fHz\n',R,C,fc);
fprintf('══════════════════════════════════════════════════════\n');
fprintf('  f (Hz)  |  |H| meas (dB)  |  |H| theory (dB)  |  Δ(dB)\n');
fprintf('  ────────┼───────────────────┼──────────────────┼───────\n');
for i = 1:numel(f_meas)
    H_i = 1 / (1 + 1j*2*pi*f_meas(i)*R*C);
    th_dB = 20*log10(abs(H_i));
    fprintf('  %6.1f  |     %7.2f       |      %7.2f      |  %+.2f\n',...
            f_meas(i), mag_meas(i), th_dB, mag_meas(i)-th_dB);
end
fprintf('══════════════════════════════════════════════════════\n\n');

saveas(gcf, 'Lab01_Bode.png');
fprintf('Bode plot saved as Lab01_Bode.png\n');
