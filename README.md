<!-- PROJECT SHIELDS -->
<a name="readme-top"></a>
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![CC BY-NC-SA 4.0 License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/wanghley/duke-ece280-lab-redesign">
    <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/Duke_University_Athletics_logo.svg/440px-Duke_University_Athletics_logo.svg.png" alt="Duke University" width="120">
  </a>

  <h3 align="center">ECE 280 Lab Redesign</h3>
  <h4 align="center">Professional Modernization of Signals and Systems Laboratory Manuals</h4>

  <p align="center">
    A comprehensive curriculum redesign featuring industry-focused real-world context, university-inspired pedagogical frameworks, and production-ready laboratory manuals for Duke University's 200-level Signals and Systems course.
    <br />
    <a href="https://github.com/wanghley/duke-ece280-lab-redesign"><strong>Explore the labs »</strong></a>
    <br />
    <br />
    <a href="#about-the-project">About</a>
    ·
    <a href="https://github.com/wanghley/duke-ece280-lab-redesign/issues">Report Bug</a>
    ·
    <a href="https://github.com/wanghley/duke-ece280-lab-redesign/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#project-scope">Project Scope</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#lab-structure">Lab Structure</a></li>
    <li><a href="#curriculum-roadmap">Curriculum Roadmap</a></li>
    <li><a href="#pedagogical-philosophy">Pedagogical Philosophy</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

The **ECE 280 Lab Redesign** is a comprehensive modernization of Duke University's undergraduate Signals and Systems laboratory curriculum. This project transforms traditional signal processing labs into industry-focused learning experiences that prepare students for real-world engineering challenges.

Each lab manual features:
- ✨ **Professional Real-World Context** — Students work as Junior Engineers at actual companies
- 🌍 **Field Diversity** — 42 real-world applications across 8+ industry domains
- 📚 **University-Inspired Pedagogy** — Based on MIT 6.003/6.007, Georgia Tech ECE 2026, Rice ELEC 241
- 🔬 **Hardware Implementation** — Arduino-based experiments with hands-on validation
- 📖 **Comprehensive References** — Academic foundations and industry standards

**Status:** Production-Ready (v1.0.0) — 13 of 14 labs complete (Lab 13 pending)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- PROJECT SCOPE -->
## Project Scope

### 14 Complete Laboratory Manuals

| Lab | Title | Status | Key Topics |
|-----|-------|--------|-----------|
| **00** | Setup and Installation | ✅ Complete | MATLAB, Arduino IDE, Environment Configuration |
| **01** | Arduino Signal Generator | ✅ Complete | Discrete-time synthesis, PWM, signal integrity |
| **02** | Signal Transformations in Hardware | ✅ Complete | Amplitude/frequency scaling, real-time manipulation |
| **03** | System Properties Explorer | ✅ Complete | Linearity, time-invariance, causality validation |
| **04** | LTI Convolution Machine | ✅ Complete | Discrete convolution, filter implementation |
| **05** | RC/RL Impulse & Step Responses | ✅ Complete | First-order system dynamics, medical applications |
| **06** | Correlation, Fourier, Distance Sensor | ✅ Complete | Cross-correlation, matched filtering, ultrasound |
| **07** | Fourier Series & LTI Synthesizer | ✅ Complete | Harmonic synthesis, audio generation |
| **08** | CT Fourier Filters & Spectrum | ✅ Complete | Active filter design, Parseval's theorem |
| **09** | CT Fourier Convolution & FIR Filter | ✅ Complete | Windowed-sinc design, Simulink code generation |
| **10** | Sampling, Reconstruction, Aliasing | ✅ Complete | Nyquist theorem, sample-and-hold circuits (NEW) |
| **11** | AM Radio Transmitter | ✅ Complete | Modulation, hardware validation, safety-critical systems |
| **12** | AM Receiver Demodulation | ✅ Complete | Envelope detection, phase-locked loops |
| **13** | DFT & FFT | ⏳ Pending | Fast Fourier Transform, spectral analysis |
| **14** | Laplace System Identification | ✅ Complete | Reverse engineering, digital twins, modernization |

### Industry Domain Coverage

- **Aerospace** (5 labs): Stratospheric platforms, altitude sensing, autopilot modernization
- **Biomedical** (5 labs): Medical devices, ECG monitoring, ultrasound imaging, hearing aids
- **Audio/Music** (3 labs): Hardware synthesizers, film scoring, auditory prosthetics
- **Telecommunications** (3 labs): 5G base stations, wireless receivers, signal integrity
- **Industrial IoT** (3 labs): Vibration monitoring, predictive maintenance, sensor systems
- **Maritime** (2 labs): Ship-to-shore communication, SART beacons
- **Power Systems** (1 lab): Grid frequency stabilization, harmonic monitoring
- **Emergency Services** (2 labs): Search-and-rescue systems, emergency alert systems

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

<img src="https://img.shields.io/badge/LaTeX-008080?style=for-the-badge&logo=latex&logoColor=white" alt="LaTeX" style="vertical-align:top; margin:4px">
<img src="https://img.shields.io/badge/MATLAB-0076A8?style=for-the-badge&logo=mathworks&logoColor=white" alt="MATLAB" style="vertical-align:top; margin:4px">
<img src="https://img.shields.io/badge/Simulink-0076A8?style=for-the-badge&logo=mathworks&logoColor=white" alt="Simulink" style="vertical-align:top; margin:4px">
<img src="https://img.shields.io/badge/Arduino-00979D?style=for-the-badge&logo=Arduino&logoColor=white" alt="Arduino" style="vertical-align:top; margin:4px">
<img src="https://img.shields.io/badge/C-A8B9CC?style=for-the-badge&logo=c&logoColor=white" alt="C" style="vertical-align:top; margin:4px">
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git" style="vertical-align:top; margin:4px">

**Core Technologies:**
- **LaTeX** — Professional typesetting and lab manual generation
- **MATLAB** — Signal processing, analysis, and algorithm development
- **Simulink** — Model-based design and code generation
- **Arduino** — Embedded real-time signal processing
- **Hardware** — Oscilloscopes, breadboards, op-amps, microcontrollers

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

To use this curriculum, you'll need:

**Software:**
- MATLAB R2023b or later
  - Signal Processing Toolbox
  - Control System Toolbox
  - Simulink
  - Embedded Coder
- Arduino IDE 2.x (or later)
- LaTeX distribution (TeXLive, MiKTeX, or MacTeX)
- Git (for cloning the repository)

**Hardware:**
- Arduino Mega 2560 microcontroller
- Oscilloscope (analog or digital)
- Multimeter
- Breadboard and jumper wires
- Passive components (resistors, capacitors, op-amps)
- Optional: Function generator, power supply

**OS Support:**
- Windows 10/11
- macOS Ventura/Sonoma
- Linux (kernel 3.12+)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/wanghley/duke-ece280-lab-redesign.git
   cd duke-ece280-lab-redesign
   ```

2. **Navigate to a lab directory:**
   ```bash
   cd src/01\ Arduino_Signal_Generator/
   ```

3. **Compile the lab manual from LaTeX:**
   ```bash
   pdflatex Lab_01_Manual.tex
   ```
   Or use your preferred LaTeX editor (Overleaf, TeXShop, TeXworks).

4. **For MATLAB/Simulink components:**
   - Open MATLAB
   - Navigate to the lab directory
   - Run the provided `.m` scripts or open `.slx` Simulink models

5. **For Arduino code:**
   - Open Arduino IDE
   - Load `.ino` files from the lab templates
   - Install necessary libraries via Library Manager
   - Upload to Arduino Mega 2560

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LAB STRUCTURE -->
## Lab Structure

Each lab manual follows a consistent, professional structure:

```
Lab_XX_Manual.tex
├── Title Page (with metadata)
├── Table of Contents
├── About This Lab Manual (placeholder clarification)
├── Grading and Authenticity Requirements
├── Real-World Context (3 industry applications)
├── Learning Objectives (8-10 industry-focused outcomes)
├── Core Concepts (theoretical foundations)
├── Pre-Lab Preparation (calculations and setup)
├── Required Equipment and Software (bill of materials)
├── Hardware Setup (step-by-step instructions)
├── Lab Procedure (with checkpoints and deliverables)
├── Post-Lab Analysis (discussion questions)
├── Appendices (code templates, troubleshooting)
└── References and Inspiration (universities, standards, citations)
```

### Real-World Context Section

Each lab positions students as Junior Engineers at real companies:

**Example — Lab 01 (Arduino Signal Generator):**
> "You are a Junior Embedded Systems Engineer at a Tier-1 IoT/Sensing Firm. Your technical lead has tasked you with critical bring-up and validation for a microcontroller signal-generation pipeline that powers three concurrent commercial programs..."

The context then presents three applications:
1. **TinyML Edge Inference Platform** — Medical arrhythmia detection on wearable processors
2. **Aerospace Stratospheric Intelligence** — Multi-spectral atmospheric data collection
3. **Industrial IoT Vibration Monitoring** — Predictive maintenance for bearing fatigue

### References and Inspiration Section

Every lab includes:
- **University Course Inspirations** — MIT 6.003/6.007, Georgia Tech ECE 2026, Rice ELEC 241, Duke ECE 280
- **Core References** — Textbooks, research papers, IEEE standards
- **Industry Standards** — FDA, FCC, FAA, ITU-R regulations
- **Advanced Topics** — Deep-dive materials for ambitious students

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CURRICULUM ROADMAP -->
## Curriculum Roadmap

### Current Status (v1.0.0 — May 2026)

- [x] Labs 01–07 redesign with Real-World Context and References
- [x] Lab 10 creation from scratch (Sampling Theorem)
- [x] Labs 08, 09, 11, 12, 14 References and Inspiration finalized
- [x] Lab 00 References section added
- [x] CHANGELOG documentation and version tracking
- [ ] Lab 13 (DFT/FFT) design and implementation
- [ ] Supplementary video content (15 min per Real-World Context)
- [ ] Faculty guide with grading rubrics
- [ ] Online resource hub with datasheets and reference implementations

### Future Enhancements

- [ ] Create accompanying 15-minute videos for each Real-World Application
- [ ] Develop faculty guide with grading rubrics aligned to ABET outcomes
- [ ] Create simplified "Quick Start" installation guides
- [ ] Add QR codes linking to component datasheets
- [ ] Develop optional "deep dive" modules per industry application
- [ ] Create assessment rubrics tied to engineering competencies
- [ ] Develop interactive MATLAB dashboard for performance analysis

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- PEDAGOGICAL PHILOSOPHY -->
## Pedagogical Philosophy

This curriculum is built on five core principles:

### 1. Junior Engineer Framing
Students position themselves as engineers at real companies with production requirements, trade-offs, and professional accountability.

### 2. Field Diversity
The same signal processing principles appear across aerospace, biomedical, audio, and telecommunications—students see transferable knowledge across industries.

### 3. Theory-to-Practice Connection
- **Mathematical Foundations** (MIT, Georgia Tech)
- **Real-Time Implementation** (Rice ELEC 241)
- **Hardware Validation** (hands-on experimentation)
- **System Modernization** (digital twins, reverse engineering)

### 4. Regulatory and Safety Context
Students understand why engineering standards exist and recognize real consequences of design failures in safety-critical systems (aviation, medical, emergency services).

### 5. Industry-Standard Tools
- **MATLAB/Simulink** — Professional DSP and control design
- **Arduino** — Affordable, open-source microcontroller platform
- **Model-Based Design** — How real engineers build systems

---

## Usage Guide

### For Students

1. **Review the Real-World Context section** to understand industry relevance
2. **Complete Pre-Lab calculations** before coming to lab
3. **Follow the Lab Procedure** with checkpoints (TAs will verify)
4. **Collect experimental data** using oscilloscope and MATLAB
5. **Complete Post-Lab analysis** with error analysis and discussion questions
6. **Submit Deliverables** with your name/ID visible

### For Instructors

- **Real-World Context sections** set student expectations and motivation
- **Learning Objectives** are aligned with ABET engineering outcomes
- **Checkpoints** provide formative assessment during the lab
- **Grading rubrics** are embedded in each lab manual
- **References and Inspiration** sections cite pedagogical sources
- **TA Solution manuals** are available separately (contact course coordinator)

### For Curriculum Developers

- **CHANGELOG.md** documents all changes with author attribution
- **LaTeX source files** are version-controlled and modular
- **Template structure** enables rapid adaptation for new labs
- **Contributing guidelines** ensure consistency across variants

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are welcome! If you have suggestions, improvements, or bug fixes:

1. **For Educational Institutions:** 
   - Adapt these materials for your curriculum
   - Share feedback on student learning outcomes
   - Propose new Real-World Context applications

2. **For Bug Reports and Suggestions:**
   - Open an issue on GitHub
   - Include specific lab number and section
   - Provide detailed description of the issue

3. **For Substantial Modifications:**
   - Fork the repository
   - Create a feature branch (`git checkout -b feature/YourImprovement`)
   - Commit your changes (`git commit -m 'Improve Lab XX: [description]'`)
   - Push to your branch (`git push origin feature/YourImprovement`)
   - Open a Pull Request with clear description

**Important:** All contributions must maintain the CC BY-NC-SA 4.0 license and include proper attribution to Wanghley Soares Martins.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)** License.

**Key Terms:**
- ✅ **Use in non-commercial educational settings** (schools, universities, non-profit organizations)
- ✅ **Modify and adapt** for your curriculum
- ✅ **Share and redistribute** with full attribution
- ❌ **No commercial use** (selling, for-profit training programs)
- ❌ **Must maintain** this same license on derivative works
- ❌ **Must attribute** original author (Wanghley Soares Martins)

**How to Cite:**
```
Soares Martins, W. (2026). ECE 280 lab redesign: Professional modernization 
of signals and systems laboratory manuals (v1.0.0). Duke University.
https://github.com/wanghley/duke-ece280-lab-redesign
Licensed under CC BY-NC-SA 4.0.
```

For **commercial licensing inquiries**, please contact: **wanghleys@gmail.com**

[Full License Text](http://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

**Wanghley Soares Martins**
- 📧 Email: [wanghleys@gmail.com](mailto:wanghleys@gmail.com)
- 💼 LinkedIn: [linkedin.com/in/wanghley](https://linkedin.com/in/wanghley)
- 🐙 GitHub: [@wanghley](https://github.com/wanghley)

**Institution:**
Duke University, Department of Electrical and Computer Engineering

**Project Repository:**
[github.com/wanghley/duke-ece280-lab-redesign](https://github.com/wanghley/duke-ece280-lab-redesign)

**For:**
- 🔧 Technical issues and bug reports → Open a GitHub issue
- 📚 Curriculum adoption questions → Contact wanghleys@gmail.com
- 💼 Commercial licensing → Contact wanghleys@gmail.com
- 🎓 Feedback and suggestions → Open an issue or contact via email

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

This project would not have been possible without the exceptional support and guidance of several individuals:

### Primary Contributors

**Adam Davidson** — Thank you for the opportunity to lead this comprehensive curriculum redesign. Your trust in this vision and your support throughout this journey has been transformative. Your invitation to reimagine ECE 280 made this entire project possible.

**Anna Mc** — Thank you for your steadfast support and invaluable collaboration. Your insights, encouragement, and dedication to excellence have shaped every aspect of this work.

**Dr. Gustafson II** — Thank you for your kindness, wisdom, and unwavering mentorship throughout this entire endeavor. Your guidance has been instrumental in creating something truly meaningful and professionally excellent.

### Pedagogical Inspirations

This curriculum builds upon decades of educational innovation from world-class universities:

- **[MIT 6.003 / 6.007](https://ocw.mit.edu/)** — Signals, Systems, and Inference; Applied Electromagnetics
- **[Georgia Tech ECE 2026](https://www.ece.gatech.edu/)** — Real-Time DSP and hardware-in-the-loop education
- **[Rice University ELEC 241](https://www.rice.edu/)** — Real-Time Signal Processing on Embedded Systems
- **[Duke University ECE 280](https://ece.duke.edu/)** — Signals and Systems Lab Sequence

### Tools and Resources

- **[LaTeX Project](https://www.latex-project.org/)** — Professional typesetting system
- **[MathWorks MATLAB & Simulink](https://www.mathworks.com/)** — Signal processing and model-based design
- **[Arduino](https://www.arduino.cc/)** — Open-source embedded systems platform
- **[Shields.io](https://shields.io)** — README badges
- **[GitHub](https://github.com)** — Version control and repository hosting

### Vision

This redesign was created with the hope that **future Blue Devils** will have an even better experience in Signals and Systems than I did. Signal processing is the foundation of modern technology—from smartphones to satellites, from medical devices to music. My goal is to help students recognize that connection and develop both deep understanding and practical competence to solve real-world problems.

> "Signal processing is not an abstract mathematical discipline—it is the language of innovation."

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/wanghley/duke-ece280-lab-redesign?style=for-the-badge
[contributors-url]: https://github.com/wanghley/duke-ece280-lab-redesign/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/wanghley/duke-ece280-lab-redesign.svg?style=for-the-badge
[forks-url]: https://github.com/wanghley/duke-ece280-lab-redesign/network/members
[stars-shield]: https://img.shields.io/github/stars/wanghley/duke-ece280-lab-redesign.svg?style=for-the-badge
[stars-url]: https://github.com/wanghley/duke-ece280-lab-redesign/stargazers
[issues-shield]: https://img.shields.io/github/issues/wanghley/duke-ece280-lab-redesign.svg?style=for-the-badge
[issues-url]: https://github.com/wanghley/duke-ece280-lab-redesign/issues
[license-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg?style=for-the-badge
[license-url]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/wanghley

---

**Last Updated:** May 13, 2026  
**Status:** v1.0.0 — Production Ready  
**License:** [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
