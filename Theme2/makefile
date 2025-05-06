# Define project-specific variables
TOP = top
PCF_FILE = VSDSquadronFM
BOARD_FREQ = 12
CPU_FREQ = 20
FPGA_VARIANT = up5k
FPGA_PACKAGE = sg48
VERILOG_FILE = top.v

# UART variables
PICO_DEVICE = /dev/ttyUSB0
BAUDS = 9600

# Build rule
build:
    yosys -DCPU_FREQ=$(CPU_FREQ) -q -p "synth_ice40 -abc9 -device $(FPGA_VARIANT) -dsp -top $(TOP) -json $(TOP).json" $(VERILOG_FILE)
    nextpnr-ice40 --force --json $(TOP).json --pcf $(PCF_FILE).pcf --asc $(TOP).asc --freq $(BOARD_FREQ) --variant $(FPGA_VARIANT) --package $(FPGA_PACKAGE) --opt-timings -q
    icetime -p $(PCF_FILE).pcf -P $(FPGA_PACKAGE) -r $(TOP).timings -d $(FPGA_VARIANT) -t $(TOP).asc
    icepack -s $(TOP).asc $(TOP).bin

# Flash rule
flash:
    iceprog $(TOP).bin

# Clean rule
clean:
    rm -rf $(TOP).blif $(TOP).asc $(TOP).bin $(TOP).json $(TOP).timings

# Terminal rule
terminal:
    sudo picocom -b $(BAUDS) $(PICO_DEVICE) --imap lfcrlf,crcrlf --omap delbs,crlf --send-cmd "ascii -s -1 30 -n"

# Cycle rule
cycle:
    git pull
    make
    sudo make flash
