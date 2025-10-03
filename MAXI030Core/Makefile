# An even more crude makefile...

TARGET_HOST=192.168.0.5
SSH=ssh $(TARGET_HOST)

DIR=MAXI030Core
PROJECT=MAXI030Core

default: all

all:
	rsync -vr . $(TARGET_HOST):$(DIR)
	$(SSH) 'cd $(DIR); quartus_map $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_fit $(PROJECT)'
	$(SSH) 'cd $(DIR); quartus_asm $(PROJECT)'

program_fpga:
	$(SSH) 'cd $(DIR); quartus_pgm --mode JTAG --operation p\;$(PROJECT).sof@3'
        