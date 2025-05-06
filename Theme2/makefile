# Makefile for FPGA Verilog project

# Set your FPGA toolchain (e.g., Xilinx Vivado or Quartus)
FPGA_TOOLCHAIN = vivado  # Change this if you're using a different toolchain

# Set the top-level module name (replace with your top module name)
TOP_MODULE = top

# Set the source files (Verilog files)
SOURCES = uart_rx.v pwm_gen.v top.v

# Set the constraints file for your FPGA (adjust as needed)
CONSTRAINTS = your_constraints.pcf  # Replace with your actual PCF file

# Set the output directory
OUTPUT_DIR = build

# Compiler flags for synthesis (adjust based on your toolchain)
COMPILE_FLAGS = -sv

# Create the target file
TARGET = $(OUTPUT_DIR)/$(TOP_MODULE)

# Rule to build the project
all: build

build:
    # Create the output directory
    mkdir -p $(OUTPUT_DIR)
    # Compile the Verilog files
    $(FPGA_TOOLCHAIN) -f $(SOURCES) -o $(TARGET) $(COMPILE_FLAGS)
    # (Add additional build commands for your FPGA toolchain)

flash:
    # Command to flash the bitstream to the FPGA (adjust based on your toolchain)
    sudo $(FPGA_TOOLCHAIN) flash $(TARGET)

clean:
    # Clean the build files
    rm -rf $(OUTPUT_DIR)
