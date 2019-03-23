#!/bin/sh

# make sure all tools are installed
missing=0

for EACH in	make automake gcc g++ clang bison flex gawk git \
		hg dot xdot pkg-config python python3; do
	which $EACH > /dev/null 2>&1 || {
		/bin/echo -e "\033[1;31myou need to install tool: $EACH\033[m"
		missing=$((missing+1))
	}
done

PACKAGES="libreadline-dev tcl-dev libffi-dev libftdi1-dev"
if which apt-cache > /dev/null 2>&1; then
	for PKG in $PACKAGES; do
		if apt-cache policy $PKG | grep 'Installed: (none)' > /dev/null; then
			/bin/echo -e "\033[1;31myou need to install package: $PKG\033[m"
			missing=$((missing+1))
		fi
	done;
else
	/bin/echo ""
	/bin/echo "------------------------------------------------------------------"
	/bin/echo "you need to manually verify that the following packages"
	/bin/echo "(or equivalents) are installed:"
	/bin/echo -e "\033[1;33m$PACKAGES\033[m"
	/bin/echo "------------------------------------------------------------------"
	/bin/echo ""
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
( cd prjtrellis/libtrellis && cmake -DCMAKE_INSTALL_PREFIX="$PREFIX" . && make -j "$THREADS" install ) && {
( cd nextpnr && cmake -DICEBOX_ROOT="$PREFIX/share/icebox/" -DTRELLIS_ROOT="$PREFIX/share/trellis/" -DCMAKE_INSTALL_PREFIX="$PREFIX" -DARCH=all . && make -j "$THREADS" install ) && {
	/bin/echo ""
	/bin/echo -e "\033[1;32mbuild successful\033[m"
	/bin/echo ""
} } } } }

