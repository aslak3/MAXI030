# An even more crude makefile...

TARGET_HOST=10.52.0.5
SSH=ssh $(TARGET_HOST)

DIR=VideoSoundCore
PROJECT=VideoSoundCore

VERILATOR_LINT=verilator --lint-only --timing
IVERILOG = iverilog -g2005-sv -g io-range-error -Wall
VVP = vvp

V_SRC = VideoSoundCore.v \
	sram_controller.v dual_clock_fifo.v video.v

ALL_TESTBENCHES = sram_controller_tb

default: all

all-testbenches: $(ALL_TESTBENCHES)

sram_controller_tb: sram_controller.v tb/sram_controller_tb.v
	$(VERILATOR_LINT) -top-module sram_controller_tb $^
	$(IVERILOG) -s sram_controller_tb -o $@ $^

tests: $(ALL_TESTBENCHES)
	set -e; for T in $^; do $(VVP) $$T; done

verilate: $(V_SRC)
	$(VERILATOR_LINT) --top-module VideoSoundCore $^

all: verilate
	rsync --delete -vr . $(TARGET_HOST):$(DIR)
	$(SSH) 'cd $(DIR); quartus_map $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_fit $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_asm $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_tan $(PROJECT)'
#	$(SSH) 'cd $(DIR); grep -A 8 "Clock Setup:" $(PROJECT).tan.summary'
	$(SSH) 'cd $(DIR); cat $(PROJECT).fit.summary'

program_fpga:
	$(SSH) 'cd $(DIR); quartus_pgm --mode JTAG --operation p\;$(PROJECT).sof@1'
