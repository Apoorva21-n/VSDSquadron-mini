# VSDSquadron-mini
Name:Apoorva Nagekar

## Task 1: Understanding and Implementing the Verilog Code on FM
## 🎯 Objective

This project aims to understand and implement Verilog code on the [VSDSquadron FPGA Mini Board](https://www.vlsisystemdesign.com/vsdsquadron/). The primary tasks include reviewing and documenting Verilog code, creating a PCF (Pin Constraint File), and integrating the design onto the hardware using the provided datasheet.

# Step 1: Understanding the Verilog Code
This task involves analyzing the Verilog design, mapping pins, and flashing the code to the VSDSquadron FPGA Mini board.
📜 [Verilog Code](./Task1/verilog%20code)
## Verilog Code Summary
- The module generates a signal using an internal clock (SB_HFOSC).
- The top module controls an RGB LED using internal logic.
- It uses an internal oscillator (SB_HFOSC) to create a clock.
- A counter is used to slow the frequency.
- LED output colors are toggled based on counter bits.
- The red, green, and blue LEDs are driven by various parts of a counter that grows with each clock cycle, causing them to blink. 
- testwire is used to check/debug signal behavior.
# Internal Module Breakdown 
1. Built-in Oscillator (SB_HFOSC)
Role: Generates a clock signal without needing an external source.

Setup: Always on and configured with a division factor for slower output.

Output: Feeds an internal wire (int_osc) that drives the logic.

2. Clock-Based Counter
What it does: A 28-bit counter that ticks with the internal clock.

Why it matters: Helps track time; one of its bits (bit 5) is sent out via testwire to check timing externally.

3. RGB LED Control (SB_RGBA_DRV)
Function: Powers the onboard RGB LED.

Settings:

Only blue LED is turned on.

Red and green are off.

Current kept low for all.

Connections: Each color output is connected to its respective LED pin (led_red, led_green, led_blue).

📌 Summary
This module provides a self-contained setup to control RGB LEDs using an internal clock and a counter. It keeps the blue LED on while offering a simple way to verify internal timing using a test pin. It’s optimized for easy integration on FPGA boards without extra components.
