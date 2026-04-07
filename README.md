# sequence-detector

## 📌 Sequence Detector (Non-Overlapping)
-🔹 Description

This project implements a sequence detector using FSM in Verilog.
It detects a specific binary sequence (example: 1011) from a serial input.
This is a non-overlapping detector, so once the sequence is detected, it resets.

-🔹 Tools Used
Verilog HDL
ModelSim / Icarus Verilog
GTKWave (for waveform)

-🔹 Files
sequence_detector.v → Design module
tb_sequence_detector.v → Testbench
output.png → Simulation waveform

-🔹 How to Run
Open the project in Vivado
Add design and testbench files
Go to Flow Navigator → Simulation → Run Simulation → Run Behavioral Simulation
View the waveform output

-🔹 Output
The output becomes 1 when the sequence is detected.

## 📌 Sequence Detector (Overlapping)
-🔹 Description

This project implements an overlapping sequence detector using FSM in Verilog.
It detects the sequence even if patterns overlap.

Example:
Input → 1011011
Output → detects sequence multiple times

-🔹 Difference
Non-overlapping → resets after detection
Overlapping → continues detection without reset

-🔹 Tools Used
Verilog HDL
ModelSim / Icarus Verilog
GTKWave

-🔹 Files
sequence_detector.v
tb_sequence_detector.v
output.png

-🔹 How to Run
iverilog -o seq_det tb_sequence_detector.v sequence_detector.v
vvp seq_det

🔹 Output

The output becomes 1 whenever the sequence is detected, including overlapping cases.
