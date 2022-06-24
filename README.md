# MAXI030: a MC68030 based expandable computer

![MAXI030 PCB](/images/maxi030.jpg)

## Features as currently implemented

The specification for MAXI030, a [MC68030](https://www.nxp.com/docs/en/reference-manual/MC68030UM.pdf) based computer, is as follows:

* A core "glue" that is wired to [master](https://en.wikipedia.org/wiki/Bus_mastering) the 32 bit busses
* Glue is provided by an [EPF10K130EQC240-1](https://www.micro-semiconductor.com/datasheet/12-EPF10K100EFC256-2AA.pdf) FPGA
* A 68030 coupled with a [68882](https://www.nxp.com/docs/en/data-sheet/BR509.pdf)
* 512K x 16 flashes in the form of 2 x [SST39SF040](http://ww1.microchip.com/downloads/en/DeviceDoc/20005022C.pdf) in PLCC32
* 2 x [72 pin SIMM](https://en.wikipedia.org/wiki/SIMM#72-pin_SIMMs) slots with a controller implemented in the FPGA
* A [SC26C94](https://pdf.dzsc.com/6C9/SC26C94.pdf) QUART with the following arrangements of the four serial ports:
  * Two on RJ45 at RS-232 levels following the standard Cisco pinnout
  * One for [my Amiga 600 keyboard](https://www.aslak.net/index.php/amiga-600-avr-based-keyboard-controller/) on an RJ11
  * And a TTL header for debug and the bring-up
* Onboard 10Mbit/s Ethernet using a [RTL8019AS](http://www.ethernut.de/pdf/8019asds.pdf)
* A [PS/2](https://en.wikipedia.org/wiki/PS/2_port) port for keyboard and mouse using a splitter cable
* Four 16 bit wide by 16 MByte deep expansion slots compatible with cards like my [video card](https://www.aslak.net/index.php/2021/07/08/the-design-of-a-video-and-sound-card-for-midi020/) which was implemented for my earlier MC68020 board
* I2C bus with:
  * [DS13057](https://datasheets.maximintegrated.com/en/ds/DS1307.pdf) RTC
  * [LM75A](https://www.nxp.com/docs/en/data-sheet/LM75A.pdf) temperature sensor
  * [PCA9544APW](https://www.nxp.com/docs/en/data-sheet/PCA9544A.pdf) four way expansion slot bus multiplexer allowing expansion cards to attach to the I2C bus
* [IDE](https://en.wikipedia.org/wiki/Parallel_ATA) with DMA signals routed to the FPGA, though they are currently not utilised
* A [P7805-2000-S](https://www.mouser.co.uk/datasheet/2/670/p78_2000_s-1729053.pdf) 2A 5V potted switching regulator attached to a barrel jack

A [schematic](MAXI030.pdf) is included here, along with the [KiCAD](https://www.kicad.org) data files. Note that schematic symbols are included in the library cache. Whilst these boards were designed with KiCAD 4, the files in this repository are all KiCAD 6 format.

## PCB design

The PCB is a 4 layer board. The requirements to make the board are quite heavy; 6 mil traces are used, with 6.5 mil clearances between them. 3 traces pass between 100mil spaced pins in multiple places. My boards were manufactured by [JLCPCB](https://www.jlcpcb.com) with no issues.

## Glue logic core

A major feature of this board is the EPF10K130EQC240 FPGA. This component is part of Altera's [Flex 10KE](https://www.micro-semiconductor.com/datasheet/12-EPF10K100EFC256-2AA.pdf) family, which is a 3.3V/2.5V part descended from the [Flex 10K](https://www.dexsilicium.com/altera_flex_epf10k.pdf) line of 5V parts. These FPGAs are unfortunately obsolete, and difficult to get hold of; I sourced mine from [UTSource](https://www.utsource.net).

The board uses mixed 3.3V and 5V signaling. The Flex 10KE series is "special" in that it is fully 5V tolerant without an inline resistor, unlike later Altera parts such as the early Cylcones which are 5V tolerant but need an inline resistor. The Flex 10KE also have outputs compatible with 5V TTL levels. My previous projects have made heavy use of the 5V Flex 10K parts, but I have found that as the board frequency has increased, these FPGAs have reached their limit. Consequently this board switched to the Flex 10KE, despite the complexities inherent in a mixed signal level board.

Beside getting hold of the actual part a challenge facing anyone building this board is obtaining a compatible Altera Quartus version since Intel have, in their wisdom, removed from their site the 9.0sp2 version; the last that supported the Flex 10K(E) series. It can still be obtained if you know where to look, however.

Another small annoyance, related to the FPGA side of the board, is that two EPC2 configuration flashes are needed since this is a large, for the time, FPGA.

I have implemented the following functionality, all in VHDL:

* Core glue, address decoding etc
* A basic DRAM controller for one of the SIMM slots
* Buzzer and LED driver
* Simplistic interrupt routing (autovectored only for now)
* An I2C master to operate the RTC and temperature sensor
* A PS/2 controller for both PS/2 connections
* An SPI output channel, and bi-directional UART, both for debugging

The code for this functionality resides in the [MAXI030Core directory](MAXI030Core), where a more detailed description of the files used can be found.

As this is FPGA hardware, many other things could be implemented. In particular, the FPGA is wired to the full 32 bits of address and data, so a bus-mastering DMA controller could be constructed. This could be used for disk transfers, amongst other things, which would greatly speed up these operations. The interrupt handling is also basic at present, and vectored interrupts should probably be used.

It's worth pointing out, for completeness, that since the FPGA is attached to a 32 bit wide by 4GB address space it would theoretically be possible to use this board to replace the 68030 with some other custom softcore processor running inside the FPGA, with the 68030 disabled or simply not present. Perhaps a more interesting opportunity would be to implement a custom 68020+ style co-processor.

## Expansion Cards

The following three cards have been created:

1. [TestSRAM](ExpansionCards/TestSRAM/) - This is card is only really useful for the bringup. It has two 512KB SRAMs attached, along with pin headers attached to he expansion bus. It allows the system to be used without having a SIMM attached (and working).
2. [Printer+Sticks](ExpansionCards/Printer%2BSticks/) - This is a fairly simple card featuring a [MC68230](http://www.ceipsa.com/datasheet/MC68230.pdf) and some latches. The board does not feature a DB25 connector, instead the printer must be attached through a "standard" 2x13 PC style adapter. The latches are attached to DB9 Atari-style joystick ports.
3. [Video+Sound](ExpansionCards/Video%2BSound/) - The most interesting card by far; this a VGA card implemented with a Cyclone II FPGA and some fast 16 bit SRAM to hold the video framebuffer. Also featured is an I2S DAC.

The TestxSRAM card (such as it is) has been shown to be error-free. The Printer+Joystick card has been exercised by attaching an old 9 pin dot matrix printer and printing text, though this was with the earlier MIDI020 68020 board. The Video+Sound board has been attached to MAXI030 and, though it has a few teaming troubles, it appears to work well. The sound portion of that card has not been explored at all however.

More documentation on these cards will be forthcoming. For now, each expansion card directory contains the schematic and PCB files in KiCAD format, plus a PDF of the schematic, the BOM, and the rendered gerbers used to produce the cards.

## Machine-code monitor

Over the years I've extended my monitor to run on each 68K based board as I've produced them. The monitor is basic, but serviceable. It is in no way designed for software development; it's main purpose is to exercise the hardware. It has low-level (memory/IO operations) and high level functionality:

* IDE identify, read and write sectors
* PS/2 reading/writing
* I2C reading/writing
* And others

It is also used to start the Linux kernel.

The monitor source is held in its [own repository](https://www.github.com/aslak3/m68k-monitor).

## Linux

A Linux port has been started and seems to work quite well. The following hardware has been shown to work, by making very small changes to existing drivers or creating new ones:

* /dev/ttySC{0,1} UART ports - these map to Port A and Port B on the board
* IDE - though neither interrupt mode or DMA is currently supported so it is rather slow
* Ethernet - works well, though the transfers are on an 8 bit port
* RTC and temperature sensor - an I2C bus driver has been produced which can talk to these peripherals
* PS/2 - the driver implemented supports both ports
* Framebuffer - a very slow and Work in Progress driver for the video card I've built

With a 40MHz can installed, a modern Linux kernel will boot in about 5 minutes. But see the Gotchas section below.

A [fork of the Linux kernel](https://www.github.com/aslak3/linux.git) from early 2022 has work done at the head of the lm/maxi030 branch with the changes I've made.

The userland I'm currently using is based on a very old Debian build, even though the kernel is almost the latest, since running the latest 68k Debian packages results in a very slow system. This is another thing to investigate.

A script, which is a total hack, for generating an directory tree of Debian Linux is available in the [linux](linux) directory. This script can generate both sid (current) and sarge (old) Debian images. It must be edited before use to set the DNS resolver, interface addressing, passwords, custom packages and other things. It makes use of [multistrap](https://wiki.debian.org/Multistrap) and [QEUMU's 68K support](https://wiki.qemu.org/Documentation/Platforms/m68k) to do its thing.

As it currently stands, the Linux system is useable across the UART (via a login getty), and via the network. Both SSH and telnet are available, SSH being extremely slow as predicted. Console access, using the PS/2 port and my bitmap video card, is very much a work in progress, though I did have X running (very, very slowly) at one point.

The general process to get Linux running on MAXI030 is as follows, assuming the board is up and running with the monitor available via a UART port:

1. At present the MAC address of the Linux host, which will supply the image, is hardcoded into the monitor program in ne2k.c in the ne2k_transmit subroutine; change it to your PCs MAC address. Note that the MAXI030 MAC address is hardcoded to 11:22:33:44:55:66
2. Build a suitably patched kernel and convert it to a raw image
3. Modify the eth-sender program as required, at a minimum the device name for the connected ethernet interface is hardcoded
4. Run up the eth-sender program (it requires root), the kernel should be available in the same directory and called vmlinux.bin
5. Partition a Compact Flash: two partitions using MBR, partition 1 for swap and 2 for the rootfs in ext3 (ext4 will work with a newer Debian userland)
6. Modify the make-multistrap script as required
7. Create the Debian directory structure and copy it into partition two on the Compact Flash
8. Create a swap partition (mkswap) on partition one
9. Plug in the Compact Flash and turn on MAXI030
10. Transfer the kernel to MAXI030 with the linuxdl command
11. Run the kernel with a monitor command like: linuxrun "console=ttySC0,38400 root=/dev/sda2"
12. Wait for kernel to boot
13. Login via the getty, test the network etc

## Issues

The big issue I'm currently working on is board speed. With all the functionality enabled in the FPGA design, I'm currently not able to run the board at the maximum speed of the 68030 I have installed, 40MHz. In particular adding the FIFOs on the PS/2 controller results in an inoperable system at 40MHz. The FIFOs seem to be required when running in Linux since the kernel disables interrupts in some situations, which results in data loss.

The board also has a few very minor problems:

* The switching regulator footprint matches the 1A [SR10S05](https://www.xppower.com/portals/0/pdfs/SF_SR.pdf) and similar; the original 2A part fits but must hang off the board since its pinout is reversed. In use and with the video card inserted and a single SIMM attached I've rarely seen the current draw pass 500mA so I think a 1A regulator will be fine
* The silk screen labels for UART Port A and Port B are the wrong way around
* The labels for Enable/Disable on the MMU/cache jumpers are also backwards

## Blog

The best place to learn about this board is undoubtably [my blog](https://www.aslak.net/index.php/category/68k/), including these posts:

* [The design of MAXI030](https://www.aslak.net/index.php/2021/10/02/the-design-of-a-68030-based-expandable-computer/)
* [Porting Linux to the MAXI030](https://www.aslak.net/index.php/2022/01/11/porting-linux-to-the-68030-based-maxi030/)

I've also made a [short YouTube video](https://www.youtube.com/watch?v=WL3ttsiriho), which discusses the board and demos the Linux port.
