# VSDSquadron-mini
Name:Apoorva Nagekar

## Task 1: Understanding and Implementing the Verilog Code on FM
## 🎯 Objective

This project aims to understand and implement Verilog code on the [VSDSquadron FPGA Mini Board](https://www.vlsisystemdesign.com/vsdsquadron/). The primary tasks include reviewing and documenting Verilog code, creating a PCF (Pin Constraint File), and integrating the design onto the hardware using the provided datasheet.

## Step 1: Understanding the Verilog Code
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
## Internal Module Breakdown 
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
## Step 2: Creating the PCF File

- 📌 [Pin Mapping](./Task1/pin%20mapping)
- led_red (Pin 39):

This pin is assigned to control the red LED on the FPGA board. The red LED might indicate an error state, status, or be used for any specific condition in your system.

led_blue (Pin 40):

Pin 40 is assigned to the blue LED. You could use this LED for indicating a different status or condition, such as a system active state or any debugging process.

led_green (Pin 41):

This pin is connected to the green LED, which could signal a positive state, such as successful completion of an operation or system readiness.

hw_clk (Pin 20):

Pin 20 is assigned to the hardware clock, which is crucial for time-based operations and synchronization. Typically, this would come from an external oscillator or a clock generator that provides timing for other components in your system, including communication or sensor timing.

testwire (Pin 17):

Pin 17 is mapped to the testwire, which could be used for debugging or testing purposes, such as checking signal states or observing specific values during development.
## Step 3: Integrating with the VSDSquadron FPGA Mini Board

Reviewed the VSDSquadron FPGA Mini board datasheet to understand its hardware features, pin configuration, and general operation.

Mapped physical board connections based on the datasheet, and created a corresponding PCF (Physical Constraints File) that matches the Verilog code. This ensured correct mapping of signals like led_red, led_blue, led_green, hw_clk, and testwire to their respective FPGA pins.

Connected the FPGA board to the computer using a USB-C cable, ensuring that the FTDI interface was properly recognized for communication and flashing.
Ran make clean to remove any previous build artifacts.

Ran make build to compile the Verilog design successfully.

Used sudo make flash to program the FPGA.

Observed the RGB LED on the VSDSquadron board to verify that the expected behavior was achieved, confirming successful programming of the FPGA.
[ASC code](./Task1/Asc%20code)
[Makefile](./Task1/Makefile)
[Json code](./Task1/Json)
## Step 4: Final documentation
[video](./Task1/WhatsApp%20Video%202025-04-22%20at%2010.15.51%20PM.mp4).
led remains blinking 

# Task 2:Implement a UART loopback mechanism
## Objective: 
Implement a UART loopback mechanism where transmitted data is immediately received back, facilitating testing of UART functionality.
## Step 1:Study the Existing Code
The project implements a basic UART loopback system using three Verilog modules: uart_rx, uart_tx, and uart_loopback_top. The uart_rx module receives serial data from the PC, converts it into 8-bit parallel format, and raises a rx_done_tick signal upon successful reception. The top module, uart_loopback_top, connects the received byte (rx_dout) directly to the uart_tx module, which transmits it back to the PC through the tx_o line. This setup enables 8N1 UART communication, effectively echoing any character sent from the PC terminal.
[code](./Task2/code)
## Step 2:Design Documentation
here is the block diagram 
 [block diagram](./Task2/block%20diagram)
 ## Step 3:Implementation
[Makefile](./Task2/Makefile)
 [Top module](./Task2/Top%20Module)
  [uart pcf](./Task2/uart%20pcf)
Then go to terminal 
cd
cd VSDSquadron-mini
(then choose the folder which contains the following files )
then make build and sudo make flash 
## step4:Testing and Verification

for this i have used docklight
[docklight](./Task2/docklight)
[terminal](./Task2/terminal)
[result](./Task2/result)
## step4:Documentation
[result](./Task2/result)
[video](./Task2/video)


# Task3:Develop a UART transmitter module capable of sending serial data from the FPGA to an external device

## step1:Study the Existing Code
[code](./Task3/code)

## step2:Design Documentation
[blockdiagram](./Task3/blockdiagram)
[cktdiagram](./Task3/cktdiagram)

## step3:Implementation
[Makefile](./Task3/Makefile)
[top](./Task3/top)
[uart_tx](./Task3/uart_tx)
cd uart _transmission
make build
sudo make flash 
## step4:Testing and Verification
open and install putty
check whether u get series of d
[putty terminal](./Task%203/putty%20terminal)
[video1.mp4](./Task3/video1.mp4)
## step5: Documentation
[blockdiagram](./Task3/blockdiagram)
[cktdiagram](./Task3/cktdiagram)
[putty terminal](./Task3/putty%20terminal)
[video1.mp4](./Task3/video1.mp4)
[transmitted](./Task3/transmitted)
