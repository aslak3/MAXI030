# MAXI030 - a MC68030 based expandable computer

![MAXI030 PCB shot](/images/maxi030.jpg)

## Features as originally designed

The specification for a [68030](https://www.nxp.com/docs/en/reference-manual/MC68030UM.pdf) based computer is as follows:

* A core "glue" that can [master](https://en.wikipedia.org/wiki/Bus_mastering) the 32 bit buses
* Glue is provided by an [EPF10K130EQC240-1](https://www.micro-semiconductor.com/datasheet/12-EPF10K100EFC256-2AA.pdf) FPGA
* A 68030 with a [68882](https://www.nxp.com/docs/en/data-sheet/BR509.pdf), both running at their stated maximum speed (40 MHz for the parts I have)
* 512M x 16 flashes in the form of 2 x [SST39SF040](http://ww1.microchip.com/downloads/en/DeviceDoc/20005022C.pdf) in PLCC32
* 2 x [72 pin SIMM](https://en.wikipedia.org/wiki/SIMM#72-pin_SIMMs) slots
* A [SC26C94](https://pdf.dzsc.com/6C9/SC26C94.pdf) QUART with the following  arrangements of four serial ports:
  * Two on RJ45
  * One for [my Amiga 600 keyboard<](https://www.aslak.net/index.php/amiga-600-avr-based-keyboard-controller/)
  * And a TTL header for debug and the bring-up
* Onboard Ethernet using a [RTL8019AS](http://www.ethernut.de/pdf/8019asds.pdf) (PDF)
* A [PS/2](https://en.wikipedia.org/wiki/PS/2_port) port for keyboard and mouse using a splitter cable
* The same expansion slots as MIDI020 but with a few issues corrected; existing cards like the [video card](https://www.aslak.net/index.php/2021/07/08/the-design-of-a-video-and-sound-card-for-midi020/) should be usable without being re-spun
* I2C bus with:
  * [DS13057](https://datasheets.maximintegrated.com/en/ds/DS1307.pdf) RTC
  * [LM75A](https://www.nxp.com/docs/en/data-sheet/LM75A.pdf) temperature sensor
  * [PCA9544APW](https://www.nxp.com/docs/en/data-sheet/PCA9544A.pdf) four way expansion slot bus multiplexer
* [IDE](https://en.wikipedia.org/wiki/Parallel_ATA)</header
* A [P7805-2000-S](https://www.mouser.co.uk/datasheet/2/670/p78_2000_s-1729053.pdf) 2A 5V potted switching regulator attached to a barrel jack

A [scehmatic](MAXI030.pdf) is included here, along with the KiCAD data files. Note that schematic symbols are included in the library cache.

## PCB desgin

The PCB is a 4 layer board designed in [KiCAD](https://www.kicad.org). The manufacturing capabilities are quite heavy; 6 mil traces are used, with 6.5 mil clearances between them. My boards were manufactured by [JLCPCB](https://www.jlcpcb.com) with no issues.

## Glue logic core

A major feature of this board is the EPF10K130EQC240 FPGA. This component is part of Altera's Flex 10KE family, which is a 3.3V/2.5V part decened from the Flex 10K line of 5V parts. These FPGAs are unfortunately obsolete, and difficult to get hold of; I sourced mine from [UTSource](https://www.utsource.net).

Beside getting hold of the actual part, the other problem is obtaining a compatible Altera Quartus version, since Intel have, in their wizdom, removed the download from their site. It can still be obtained if you know where to look, however.

Another small annoyance, related to the FPGA side of the board, is that two EPC2 configuration flahses are needed since this is a large, for the time, FPGA.

I have implemented the following functionality, all in VHDL:

* Core glue, address decoding etc
* A basic DRAM controller for one of the SIMM slots
* Buzzer and LED driver
* Simplistic interrupt routing (autovectored only for now)
* An I2C master to operate the RTC and temperature sensor
* A PS/2 controller for both PS/2 connections

As this is FPGA hardware, many other things could be implemented. In particular, the FPGA is wired to the full 32 bits of address and data, so a bus-mastering DMA controller could be constructed. This could be used for disk transfers, amongst other things, which would greatly speed up these operations. The interrupt handling is also basic at present, and vectored interrupts should probably be used.

## Machine-code monitor

Over the years I've extended my monitor to run on each 68K based board, as I've produced them. The monitor is basic, but serviceable. It is in no way designed for software development; it's main purpose is to exersise the hardware. It has lowlevel (memory/IO operations) and high level functionality:

* IDE identify, read and write sectors
* PS/2 reading/writing
* I2C reading/writing

It is also used to start the Linux kernel.

The monitor source is held in its [own repository](https://www.github.com/aslak3/m68k-monitor).

## Linux

A Linux port has been started and seems to work quite well. The following hardware has been shown to work:

* The /dev/ttySC{0,1} - these map to Port A and Port B on the board.
* IDE - though interrupt mode is not supported so it is rather slow
* Ethernet - works well, though the transfers are on an 8 bit port
* RTC and temperature sensor - an I2C bus driver has been produced which can talk to these peripherals
* PS/2 - the driver implemented supports both ports
* Framebuffer - a very slow and Work in Progress driver for the video card I've built

With a 40MHz can installed, a modern Linux kernel will boot in about 5 minutes. But see the Gotchas section below.

A [fork of the Linux kernel](https://www.github.com/aslak3/linux.git) from early 2022 has patches at the head with the changes I've made.

The userland I'm currently using is a very old Debian build, even though the kernel is almost the latest, since running the latest 68k Debian packages results in a very slow system. This is another thing to investigate.

At some point I will tidy up the script I'm using to build the Debian image and include it in this repo.

As it currently stands, the Linux system is useable across the UART (via a login getty), and via the network. Both SSH and telnet are available, SSH being rather slow as predicted.

## Gotchas

The big issue I'm currently working on is board speed. With all the functionality enabled in the FPGA design, I'm currently not able to run the board at the maximum speed of the 68030 I currently have installed, 40MHz.

The board also has a few very minor problems:

* The labeling of Port A and Port B in the silkscreen is the wrong way around
* The lableing of Enable/Disable on the MMU/Cache jumpers is also backwards

## Blog

The best place to learn about this board is undoubtably [my blog](https://www.aslak.net), including these posts:

* [The design of MAXI030](https://www.aslak.net/index.php/2021/10/02/the-design-of-a-68030-based-expandable-computer/)
* [Porting Linux to the MAXI030](https://www.aslak.net/index.php/2022/01/11/porting-linux-to-the-68030-based-maxi030/)

I've also made a [short YouTube video](https://www.youtube.com/watch?v=WL3ttsiriho), which discusses the board and demos the Linux port.
