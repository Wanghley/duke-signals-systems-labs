// ============================================================
// ECE 280L — Lab 01: RC Filter — Dual-Channel ADC Acquisition
// Hardware-First Lab Redesign Demo
// ============================================================
// Reads input signal (before RC filter) on A0
// Reads output signal (after RC filter) on A1
// Streams "v_in,v_out" pairs to MATLAB at SAMPLE_RATE sps
//
// WIRING:
//   Function Generator (+) ─────────────────────┬──► 10kΩ ──► Arduino A0
//                                                │
//                                                └──► R_filt ──► [Node A]
//                                                                    │
//                                                              C to GND
//                                                                    │
//                                                         Arduino A1 ◄──── [Node A]
//
//   Function Generator (−) ──────────────────────────────────────── Arduino GND
//
// FUNCTION GENERATOR settings:
//   Waveform : Sine
//   Frequency: start at 5 Hz (change during demo)
//   Amplitude: 2 Vpp
//   DC Offset: +2.5 V   ← CRITICAL: keeps signal in 0–5 V ADC range
//
// BAUD: 115200    SAMPLE RATE: 2000 sps
// ============================================================

const int   PIN_IN      = A0;      // Before RC filter (function generator)
const int   PIN_OUT     = A1;      // After RC filter (across capacitor)
const int   SAMPLE_RATE = 2000;    // samples/sec per channel
const float V_REF       = 5.0;     // Arduino Mega ADC reference voltage
const int   ADC_MAX     = 1023;    // 10-bit ADC

const unsigned long INTERVAL_US = 1000000UL / SAMPLE_RATE;
unsigned long lastTime = 0;

void setup() {
  Serial.begin(115200);

  // Warm up ADC (first few reads are inaccurate after startup)
  for (int i = 0; i < 5; i++) {
    analogRead(PIN_IN);
    analogRead(PIN_OUT);
  }
  delay(50);

  // Header for MATLAB parser
  Serial.print("# ECE280L Lab01-RC | board=Mega | rate=");
  Serial.print(SAMPLE_RATE);
  Serial.print("sps | vref=");
  Serial.print(V_REF, 1);
  Serial.println("V | channels=A0(in),A1(out)");
  Serial.println("# BEGIN");
}

void loop() {
  unsigned long now = micros();
  if (now - lastTime < INTERVAL_US) return;
  lastTime = now;

  // Read both channels back-to-back (≈ 250 µs total delay between them)
  int raw_in  = analogRead(PIN_IN);
  int raw_out = analogRead(PIN_OUT);

  float v_in  = raw_in  * V_REF / ADC_MAX;
  float v_out = raw_out * V_REF / ADC_MAX;

  // Send as CSV: "v_in,v_out\n"
  Serial.print(v_in,  4);
  Serial.print(',');
  Serial.println(v_out, 4);
}
