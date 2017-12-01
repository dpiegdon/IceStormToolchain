#!/bin/sh

# make sure all tools are installed
missing=0

for EACH in	make automake gcc g++ clang bison flex gawk git \
		hg dot xdot pkg-config python python3; do
	which $EACH > /dev/null 2>&1 || {
		echo "you need to install tool: $EACH"
		missing=$((missing+1))
	}
done

PACKAGES="libreadline-dev tcl-dev libffi-dev libftdi1-dev"
if which apt-cache > /dev/null; then
	for PKG in $PACKAGES; do
		if apt-cache policy $PKG | grep 'Installed: (none)' > /dev/null; then
			echo "you need to install package: $PKG"
			missing=$((missing+1))
		fi
	done;
else
	echo "------------------------------------------------------------------"
	echo "you need to manually verify that the following packages"
	echo "(or equivalents) are installed:"
	echo "    $PACKAGES"
	echo "------------------------------------------------------------------"
fi

[ 0 -eq $missing ] || exit 1



# build toolchains
THREADS=`grep '^processor' /proc/cpuinfo|wc -l`
THREADS=$((THREADS-1))
if [ $THREADS -lt 1 ]; then
	THREADS=1
fi

export PREFIX=`pwd`/build

make -j "$THREADS" -C icestorm install && {
	make -j "$THREADS" -C arachne-pnr install && {
		make -j "$THREADS" -C yosys install && {
			echo ""
			echo "build successful"
		}
	}
}

