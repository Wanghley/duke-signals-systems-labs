# ECE 280L Lab 01 — RC Filter Demo (30 min)
**Function Generator → RC Circuit → Arduino Mega → MATLAB**
Measuring input AND output simultaneously, comparing to H(jω) theory

---

## What Each Piece Does

| Hardware | Role |
|---|---|
| **Function Generator** | Drives the RC filter with a sine wave |
| **RC Circuit (breadboard)** | The system under test — low-pass filter |
| **Oscilloscope** | Physical confirmation (input on CH1, output on CH2) |
| **Arduino Mega A0** | Digitizes the input signal (before filter) |
| **Arduino Mega A1** | Digitizes the output signal (after filter, across C) |
| **MATLAB** | Plots both, computes \|H\|, phase, error, and Bode plot |

---

## ⏱ 30-Minute Timeline

| Min | Task |
|-----|------|
| 0–5 | Choose R and C values, build RC circuit on breadboard |
| 5–9 | Wire everything (5 connections) |
| 9–12 | Set up function generator and oscilloscope |
| 12–16 | Upload Arduino sketch |
| 16–18 | Set `COM_PORT` in MATLAB, set `R_OHM`, `C_FARAD`, `FREQ_HZ` |
| 18–22 | First run at f << fc (signal passes through) |
| 22–25 | Second run at f = fc (−3 dB, −45° point) |
| 25–28 | Third run at f >> fc (signal attenuated) |
| 28–30 | Bode plot appears — rehearse your pitch |

---

## STEP 1 — Choose R and C (0–5 min)

Pick values so the cutoff frequency **fc = 1/(2πRC)** falls in a range
you can test easily on the function generator.

| R | C | fc |
|---|---|---|
| **10 kΩ** | **1 µF** | **15.9 Hz** ← recommended for demo |
| 1 kΩ | 1 µF | 159 Hz |
| 4.7 kΩ | 1 µF | 33.9 Hz |

With **R=10kΩ, C=1µF, fc≈16 Hz**, you'll test at:
- **2 Hz** — well below cutoff (almost no attenuation)
- **16 Hz** — at cutoff (−3 dB, −45° shift)
- **100 Hz** — well above cutoff (heavily attenuated)

Build the RC circuit on your breadboard:
```
Input ──► R (10 kΩ) ──► [Node A] ──► C (1 µF) ──► GND
                              │
                           Output (across C)
```

---

## STEP 2 — Wire Everything (5–9 min)

```
Function Generator (+) ──────────────────────────┬──► 10 kΩ (protection) ──► Arduino Mega A0
                                                  │
                                                  └──► R_filter ──► [Node A]
                                                                        │
                                                                   C to GND
                                                                        │
                                                         Arduino Mega A1 ◄────────────────────

Function Generator (−) ───────────────────────────────────────────── Arduino Mega GND
Function Generator (+) ──► Oscilloscope CH1    (input, raw)
[Node A]               ──► Oscilloscope CH2    (output, filtered)
Arduino Mega           ──► Laptop USB
```

> The 10 kΩ protection resistor on A0 prevents the function generator
> from seeing the ADC input capacitance — leave it in always.
> It is NOT part of the RC filter; the filter resistor is separate.

---

## STEP 3 — Function Generator and Oscilloscope (9–12 min)

**Function generator settings:**

| Setting | Value |
|---|---|
| Waveform | Sine |
| Frequency | **2 Hz** (start here) |
| Amplitude | **2 Vpp** |
| DC Offset | **+2.5 V** ← REQUIRED (Arduino ADC is 0–5 V only) |

**Oscilloscope settings (for CH1 and CH2):**

| Setting | Value |
|---|---|
| Timebase | 200 ms/div |
| Vertical | 500 mV/div |
| Coupling | DC |
| Trigger | CH1, Auto |

At 2 Hz you should see CH1 and CH2 nearly on top of each other (signal passes through the filter — fc=16 Hz is far away).

> 🎯 **Talking point:** *"On the scope you can see both signals — CH1 is the raw
> sine from the generator, CH2 is what comes out of the RC filter. Below cutoff
> they look identical. Watch what happens as we increase the frequency."*

---

## STEP 4 — Upload Arduino Sketch (12–16 min)

1. Open Arduino IDE
2. Open `demo/arduino/Lab01_SignalGenerator/Lab01_SignalGenerator.ino`
3. **Tools → Board → Arduino Mega or Mega 2560**
4. **Tools → Port** → select your port (note it for MATLAB)
5. **Upload** (Ctrl+U / Cmd+U)
6. Open **Serial Monitor** at 115200 baud — you should see two-column numbers like:
   ```
   2.4821,2.4799
   2.5043,2.5021
   2.4612,2.4590
   ```
   Left column = A0 (input), right column = A1 (output)
7. **Close Serial Monitor** before running MATLAB

---

## STEP 5 — Configure MATLAB (16–18 min)

Open `demo/matlab/Lab01_MATLAB_Plotter.m` and update **lines 27–33:**

```matlab
COM_PORT    = '/dev/cu.usbmodem14101';  % your port
FREQ_HZ     = 2.0;      % match function generator exactly
R_OHM       = 10000;    % your resistor in Ohms
C_FARAD     = 1e-6;     % your capacitor in Farads
```

| OS | Port format | How to find it |
|---|---|---|
| Windows | `'COM4'` | Device Manager → Ports |
| macOS | `'/dev/cu.usbmodem...'` | Terminal: `ls /dev/cu.usb*` |
| Linux | `'/dev/ttyACM0'` | Terminal: `ls /dev/ttyACM*` |

---

## STEP 6 — Three Runs (18–28 min)

### Run 1 — f = 2 Hz (well below cutoff)
Set FG to 2 Hz. Press **F5** in MATLAB.

**Expected output:**
- Input and output waveforms nearly identical in time plot
- Magnitude ratio ≈ 1.0 (≈ 0 dB) — signal passes through
- Phase shift ≈ −7° — tiny lag
- Error plot shows only quantization noise

```
Magnitude ratio  |Vout/Vin|:
  Measured :  0.9943  (−0.05 dB)
  Theory   :  0.9939  (−0.05 dB)
```

### Run 2 — f = 16 Hz (at cutoff frequency fc)
Change FG to **16 Hz**. Update `FREQ_HZ = 16` in MATLAB. Press F5.

**Expected output:**
- Output amplitude ≈ 0.707 × input (the classic −3 dB point)
- Phase shift ≈ −45° — half a right angle behind
- Theory and measurement should agree closely

```
Magnitude ratio  |Vout/Vin|:
  Measured :  0.7043  (−3.04 dB)
  Theory   :  0.7071  (−3.01 dB)
```

> 🎯 **The key talking point:** *"Students have to predict this −3 dB and −45°
> from the formula H(jω) = 1/(1+jωRC) BEFORE touching the hardware. Then
> they verify it. You cannot fake this — the number must match your specific
> R and C, which the TA picked for your bench."*

### Run 3 — f = 100 Hz (well above cutoff)
Change FG to **100 Hz**. Update `FREQ_HZ = 100`. Press F5.

**Expected output:**
- Output amplitude ≈ 0.158 × input (≈ −16 dB)
- Phase shift ≈ −81° — almost a quarter cycle behind
- Attenuation is clearly visible on both scope and MATLAB

---

## STEP 7 — The Bode Plot (28–30 min)

After 3+ runs, MATLAB automatically calls `Lab01_Bode.m`, which plots:
- **Top panel:** measured magnitude (red dots) vs. theoretical curve (blue line)
- **Bottom panel:** measured phase vs. theoretical
- Red dot should fall on the blue line at every frequency

Run `Lab01_Bode` in the MATLAB command window at any time to regenerate the plot.

> 🎯 **Final pitch:** *"This is an experimentally derived Bode plot. Each red dot
> required a real measurement on real hardware with a real RC circuit. The blue
> line is H(jω) = 1/(1+jωRC) derived analytically in lecture. When they match,
> the student has verified — with their own hands — that the mathematical model
> accurately predicts physical reality. An AI cannot give you this."*

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Output signal is flat (A1 = constant) | Check capacitor connection to GND and Node A to A1 |
| Both channels identical at all frequencies | Check R_filter is connected between FG and Node A (not GND) |
| Signal clipping at 0 V or 5 V | DC offset not set; add +2.5 V on function generator |
| MATLAB port error | Close Arduino Serial Monitor first |
| Very noisy signal | Check all GND connections share a common ground |
| Magnitude ratio > 1.0 | A0 and A1 swapped — flip the connections |
| Phase reads positive | Add/subtract 360°; RC filter always introduces lag |

---

## Files in This Demo

```
demo/
├── arduino/Lab01_SignalGenerator/
│   └── Lab01_SignalGenerator.ino    ← Upload to Arduino Mega
├── matlab/
│   ├── Lab01_MATLAB_Plotter.m       ← Run this (change COM_PORT + FREQ_HZ)
│   └── Lab01_Bode.m                 ← Called automatically; or run manually
└── DEMO_GUIDE_Lab01.md              ← This file
```
