# An even more crude makefile...

TARGET_HOST=192.168.0.5
SSH=ssh $(TARGET_HOST)

DIR=MAXI030Core
PROJECT=MAXI030Core

VERILATOR=verilator --lint-only

default: all

V_SRC = MAXI030Core.v \
	addr_decode.v sys_clear_generator.v byte_select_generator.v \
	vector_mapper.v led_register.v waitstate_generator.v

verilate: $(V_SRC)
	$(VERILATOR) $^

all: verilate
	rsync --delete -vr . $(TARGET_HOST):$(DIR)
	$(SSH) 'cd $(DIR); quartus_map $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_fit $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_asm $(PROJECT)'

program_fpga:
	$(SSH) 'cd $(DIR); quartus_pgm --mode JTAG --operation p\;$(PROJECT).sof@3'
        