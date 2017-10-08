#!/bin/sh

echo "reminder: always source this script, not simply execute it."
echo "setting up build environment..."
for newpath in	arachne-pnr/bin \
		icestorm/icebox \
		icestorm/icebram \
		icestorm/icecompr \
		icestorm/icefuzz \
		icestorm/icemulti \
		icestorm/icepack \
		icestorm/icepll \
		icestorm/iceprog \
		icestorm/icetime \
		yosys \
		; do
	newfullpath="`pwd`/$newpath"
	echo "$PATH" | grep "$newpath" > /dev/null || export PATH="$newfullpath:$PATH"
done

