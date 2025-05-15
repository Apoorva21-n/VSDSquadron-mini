DEVICE = up5k
PACKAGE = sg48
SYNTH_JSON = top.json
PCF_FILE = VSDSquadronFM.pcf
TOP_MODULE = top

all: ${TOP_MODULE}.bin

${TOP_MODULE}.json: top.v oled_display.v
	yosys -p "synth_ice40 -top ${TOP_MODULE} -json ${TOP_MODULE}.json" $^

${TOP_MODULE}.asc: ${TOP_MODULE}.json ${PCF_FILE}
	nextpnr-ice40 --${DEVICE} --package ${PACKAGE} --pcf ${PCF_FILE} --json ${TOP_MODULE}.json --asc ${TOP_MODULE}.asc --freq 12

${TOP_MODULE}.bin: ${TOP_MODULE}.asc
	icepack ${TOP_MODULE}.asc ${TOP_MODULE}.bin

flash: ${TOP_MODULE}.bin
	iceprog ${TOP_MODULE}.bin

clean:
	rm -f *.json *.asc *.bin
