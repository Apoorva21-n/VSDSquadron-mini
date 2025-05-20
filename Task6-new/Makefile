PROJECT = uart_display
SRC = src/top.v src/uart_rx.v src/seven_seg_decoder.v src/display_ctrl.v
PCF = constr/vsdsquadron.pcf

all: build

build:
	yosys -p "synth_ice40 -top top -json $(PROJECT).json" $(SRC)
	nextpnr-ice40 --up5k --package sg48 --json $(PROJECT).json --pcf $(PCF) --asc $(PROJECT).asc
	icepack $(PROJECT).asc $(PROJECT).bin

flash:
	iceprog $(PROJECT).bin

clean:
	rm -f $(PROJECT).json $(PROJECT).asc $(PROJECT).bin
