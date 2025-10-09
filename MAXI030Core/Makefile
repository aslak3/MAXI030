# An even more crude makefile...

TARGET_HOST=192.168.0.5
SSH=ssh $(TARGET_HOST)

DIR=MAXI030Core
PROJECT=MAXI030Core

VERILATOR_LINT=verilator --lint-only --timing
IVERILOG = iverilog -g 2012 -g io-range-error -Wall
VVP = vvp

V_SRC = MAXI030Core.v \
	addr_decode.v sys_clear_generator.v byte_select_generator.v simm_controller.v \
	vector_mapper.v led_register.v waitstate_generator.v test_register.v


ALL_TESTBENCHES = simm_controller_tb

default: all

all-testbenches: $(ALL_TESTBENCHES)

simm_controller_tb: simm_controller.v tb/simm_controller_tb.v
	$(VERILATOR_LINT) -top-module simm_controller_tb $^
	$(IVERILOG) -s simm_controller_tb -o $@ $^

tests: $(ALL_TESTBENCHES)
	set -e; for T in $^; do $(VVP) $$T; done

verilate: $(V_SRC)
	$(VERILATOR_LINT) $^

all: verilate
	rsync --delete -vr . $(TARGET_HOST):$(DIR)
	$(SSH) 'cd $(DIR); quartus_map $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_fit $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_asm $(PROJECT)'

program_fpga:
	$(SSH) 'cd $(DIR); quartus_pgm --mode JTAG --operation p\;$(PROJECT).sof@3'
