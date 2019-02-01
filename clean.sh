#!/bin/sh

for EACH in icestorm arachne-pnr yosys prjtrellis prjtrellis/database nextpnr; do
	cd $EACH
	git clean -dfx
	git reset HEAD --hard
	cd -
done;
git clean -fdx
git reset HEAD --hard
git submodule init
git submodule update

