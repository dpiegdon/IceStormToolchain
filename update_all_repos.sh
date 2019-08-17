#!/bin/sh

for R in arachne-pnr icestorm nextpnr prjtrellis yosys; do
	cd $R
	git checkout master
	git pull --rebase
	git submodule update
	cd ..
done
