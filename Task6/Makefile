TOP=top
DEVICE=up5k
PACKAGE=sg48
PCF=VSDSquadronFM.pcf

all: $(TOP).bin

$(TOP).blif: $(TOP).v uart_trx.v ultrasonic_sensor.v oled_display.v
	yosys -p "synth_ice40 -top $(TOP) -blif $@" $^

$(TOP).json: $(TOP).blif
	yosys -p "synth_ice40 -top $(TOP) -json $@" $(TOP).v uart_trx.v ultrasonic_sensor.v oled_display.v

$(TOP).asc: $(TOP).json
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) --pcf $(PCF) --json $< --asc $@ --freq 12

$(TOP).bin: $(TOP).asc
	icepack $< $@

flash: $(TOP).bin
	sudo iceprog $<
