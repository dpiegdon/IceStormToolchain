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

[ 0 -eq $missing ] || exit 1

# TODO to be checked:
# * libreadline-dev
# * tcl-dev
# * libffi-dev
# * libftdi-dev

# build toolchains
THREADS=`grep '^processor' /proc/cpuinfo|wc -l`
THREADS=$((THREADS-1))

export PREFIX=`pwd`/build

make -j "$THREADS" -C icestorm install && {
	make -j "$THREADS" -C arachne-pnr install && {
		make -j "$THREADS" -C yosys install && {
			echo ""
			echo "build successful"
		}
	}
}

