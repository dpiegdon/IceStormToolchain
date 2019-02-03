
This repository contains all tools that I require for a fully open source FPGA toolchain for Lattice FPGAs.
I keep these tools in a repo because major distributions don't package them up-to-date or at all, and
because they are under heavy development.

This repo is optimized for use on linux, and can be used after `build.sh`ing it.
From the source-directory that you want to compile, just run `environment.sh` and you can use the tools.

This repo contains submodules for:

* https://github.com/cliffordwolf/yosys.git -- verilog compiler -- http://www.clifford.at/yosys/ , http://www.clifford.at/yosys/files/yosys_manual.pdf
* https://github.com/cseed/arachne-pnr.git -- legacy place&route
* https://github.com/YosysHQ/nextpnr -- new place&route
* https://github.com/cliffordwolf/icestorm.git -- reverse-engineered bitstream format and tools for lattice iCE40 -- see http://www.clifford.at/icestorm/
* https://github.com/SymbiFlow/prjtrellis.git --reverse-engineered bitstream format and tools for lattice ECP5

Other tools one might want to give a try:

* icestudio -- https://github.com/FPGAwars/icestudio -- GUI workflow for verilog, optimized for yosys/lattice FPGAs
* iverilog -- verilog compiler for simulations (usually packaged by distro)
* gtkwave -- show output of compiled verilog simulations (usually packaged by distro)

Alternatives to this repo:

* apio - https://github.com/FPGAwars/apio

Related links:

* Lattice iCEstick Evaluation Kit: `http://www.latticesemi.com/icestick`
* Lattice iCE40 LP/HX Family Datasheet: `http://www.latticesemi.com/~/media/LatticeSemi/Documents/DataSheets/iCE/iCE40LPHXFamilyDataSheet.pdf`
* Pinout: `http://www.pighixxx.com/test/portfolio-items/icestick/`

