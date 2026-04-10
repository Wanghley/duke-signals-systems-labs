# ECE 280 Lab 1 - TA Solution Menu

Use this as a fast grading and troubleshooting guide for:
- Lab 1: Signals and Systems (Arduino Signal Generator)
- Student report template + evidence files

## 1) Quick Pass/Flag Menu

## Pass immediately if all are true
- RC filter is physically present and correctly wired: PWM pin -> R -> node -> C to GND.
- DMM readings are approximately linear at 0%, 50%, 100% duty cycle.
- Oscilloscope capture shows stable trigger and expected waveform frequency.
- MATLAB plot has 500 samples, labeled axes, and matches scope trend.
- Phase 3 uses timer interrupt ISR (not delay loop), and jitter is lower than baseline.
- Scope proof image includes handwritten student name and ID.

## Flag for review if any are true
- No physical evidence (missing scope/DMM/breadboard images).
- Phase 3 code still performs sample timing inside loop with delay calls.
- Scope and MATLAB frequencies disagree by >10% with no explanation.
- Report lists formulas but no measured values or no error analysis.

## 2) Pre-Lab Answer Key (Expected)

## Q1: RC selection for fc ~ 50 Hz
Formula:

$$
 f_c = \frac{1}{2\pi RC}
$$

Valid examples (commercial values):
- R = 10 kOhm, C = 330 nF -> fc ~ 48.2 Hz
- R = 9.1 kOhm, C = 330 nF -> fc ~ 53.1 Hz
- R = 4.7 kOhm, C = 680 nF -> fc ~ 49.8 Hz

Accept if fc is roughly 40 to 60 Hz and derivation is shown.

## Q2: RC impulse/step response
Expected forms:
- Impulse response: 

$$
 h(t) = \frac{1}{RC}e^{-t/RC}u(t)
$$

- Step response to 5 V:

$$
 v_o(t)=5\left(1-e^{-t/RC}\right)
$$

- 63% time is one time constant:

$$
 t_{63\%}=\tau=RC
$$

## Q3: Quantization and SQNR (8-bit)
- Quantization step (using 0-255):

$$
 \Delta V \approx \frac{5}{255}=19.6\text{ mV}
$$

- SQNR for full-scale sine:

$$
 SQNR_{dB} \approx 6.02N + 1.76
$$

For N=8: SQNR ~ 49.9 dB.

## 3) Lab Measurement Targets

## Phase 1 DMM targets
- 0% duty: ~0.00 V (typical +/- 0.05 V)
- 50% duty: ~2.50 V (typical 2.45 to 2.55 V)
- 100% duty: ~5.00 V (typical 4.95 to 5.05 V)

Suggested acceptance: within 5 to 10% unless hardware issues are justified.

## Phase 2 frequency and shape
- Frequency error target: <=10%
- Waveform should be stable and periodic with proper trigger.
- MATLAB trace should visually match scope behavior (shape, period, approximate amplitude trend).

## Phase 3 jitter expectations
- Baseline (delay-based): wider interval spread.
- Interrupt-based: narrower distribution and lower std dev.
- Acceptable improvement target: >=30% jitter reduction (std-dev basis).
- Strong implementation: >=50% reduction with clear histogram evidence.

## 4) Code Key Checks (TA spot-check)

## Delay-based baseline (expected in Phase 2/3.1)
- Uses micros() logging or timestamp differences.
- Uses delay()/delayMicroseconds() in generation loop.

## Interrupt phase (required in Phase 3)
- Timer register setup is present (Timer1/Timer2 acceptable).
- ISR is concise and handles sample update.
- Shared ISR variables marked volatile.
- Sampling path has no blocking delay calls.

## Timer formula sanity check
If using Timer1 CTC mode:

$$
 f_{int}=\frac{F_{CPU}}{prescaler\cdot(OCR1A+1)}
$$

If LUT size is N samples/cycle, then:

$$
 f_0=\frac{f_{int}}{N}
$$

Common correction: with F_CPU=16 MHz, prescaler=8, N=256, f0=10 Hz:
- Required finterrupt ~ 2560 Hz
- OCR1A ~ 780 (not 6249)

## 5) Frequent Failure Modes and TA Actions

## Symptom: Flat output around mid-level only
- Likely wrong probe node or RC short.
- Action: verify probe at RC output node and capacitor to GND only.

## Symptom: Heavy ripple/noisy analog output
- Likely fc too high or wiring length/noise.
- Action: check R/C values and grounding.

## Symptom: MATLAB timeout / missing data
- Wrong COM port or baud mismatch.
- Action: confirm 115200 baud, correct port, line terminator, and buffer logic.

## Symptom: Interrupt code compiles but jitter not improved
- ISR too long, serial printing in ISR, or still timing in loop.
- Action: remove Serial from ISR, keep ISR minimal, move logging outside ISR.

## 6) Grading Menu (Aligned to Current Rubric)

Use this quick decision map while assigning points:

- Pre-Lab (15): full math + correct formulas + sensible component choices.
- Hardware (12): valid RC build + DMM evidence at 0/50/100%.
- Scope Capture (10): clear scope image, correct scales, <=10% freq/amp error.
- MATLAB Acquisition (10): 500 samples, labeled plot, scope-consistent behavior.
- Phase 3 Interrupt (12): timer ISR implemented and jitter reduction demonstrated.
- Proof Documentation (21): required proof images complete and identifiable.
- Analysis and Errors (20): numerical errors computed + ranked error sources justified.

## Suggested deduction guide
- Missing one required proof image: -5 to -10 (severity-based)
- No jitter comparison evidence: -4 to -8
- No error calculations: -5 to -10
- Copy/paste code with no measured data linkage: -3 to -8

## 7) Minimum Submission for Passing Work

A minimally acceptable submission should include:
- Pre-lab equations and numerical results.
- One valid RC hardware photo and DMM verification table/photo set.
- One scope capture with visible settings.
- One MATLAB 500-sample plot with labeled axes.
- Baseline vs interrupt jitter evidence and brief improvement statement.
- Short error analysis with at least 3 plausible sources.
