TOP = led_blink_three
SRC = src/led_blink_three.v
PCF = src/led_blink_three.pcf

all: ${TOP}.bin

${TOP}.json: ${SRC}
	yosys -p "synth_ice40 -top ${TOP} -json ${TOP}.json" ${SRC}

${TOP}.asc: ${TOP}.json ${PCF}
	nextpnr-ice40 --hx1k --package vq100 --pcf ${PCF} --json ${TOP}.json --asc ${TOP}.asc

${TOP}.bin: ${TOP}.asc
	icepack ${TOP}.asc ${TOP}.bin

flash: ${TOP}.bin
	iceprog ${TOP}.bin

clean:
	rm -f *.json *.asc *.bin
