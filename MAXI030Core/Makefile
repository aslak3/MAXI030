# An even more crude makefile...

TARGET_HOST=192.168.0.5
SSH=ssh $(TARGET_HOST)

DIR=maxi030_core
PROJECT=maxi030_core

default: all

all-testbenches: $(ALL_TESTBENCHES)

all:
	rsync --delete -vr . $(TARGET_HOST):$(DIR)
	$(SSH) 'cd $(DIR); quartus_map $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_fit $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_asm $(PROJECT)'

program_fpga:
	$(SSH) 'cd $(DIR); quartus_pgm --mode JTAG --operation p\;$(PROJECT).sof@3'
