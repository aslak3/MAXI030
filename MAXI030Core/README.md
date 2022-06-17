# MAXI030Core

The MAXI030 FPGA is responsible for essentially all the functionality that would have traditionally been included in glue logic, wether implemented with discrete logic ICs, GALs, or whatever. It also contains the logic for implementing various controllers and interfaces including:

* DRAM controller for the SIMM slots, including the address multiplexers
* I2C master
* PS/2 interfaces (for keyboard and mouse)
* Interrupt control
* LED and buzzer output control
* 5 pins of user-headers, generally used for debugging and board bringup

Since the FPGA is attached to the full 32 bits of address bus, it is eventually intended to implement a bus-mastering DMA controller, though no progress has been made to this end.

The design also includes a debug/bringup aid in the form of an SPI output-only interface.

Currently only the top 8 bits of databus are used for communication between the processor and the FPGA. This is a result of this design being an evolution of earlier ones. Consequently services which require larger values to be programmed into them, like the timer, require multiple addresses. This will be eliminated when the full 32 bit databus is utilised.

Note that for consistency all internal signals use positive logic. Inputs are converted to positive logic and outputs are converted to negative logic, if needed. The n_ prefix on signal names is used to indicate negative logic.

Please note that I'm a self-taught VHDL designer. Except in rare cases, these designs do not make use of test benches.

## maxi030_core.vhd

This is the main design file and includes the following entities:

### vector_mapper

This entity deals with startup. Like most 68K based boards, a "trick" is used to map the ROM/flash into low memory only for the initial startup. After the initial Stack Pointer and Program Counter (2 long words, or 4 short words) have been read in, the system enters the normal runtime mode where address decoding will decode into the runtime address map, which is described below. This is achieved by counting (with a shift register) Address Strobes edges; after 4 rising edges the vectors have been read and the system is in the normal runtime mode, indicated by a high vector_fetched output.

### addr_decode

This is the main address decoding logic. Due to various factors, this is currently implemented as a sequential block instead of the more obvious and likely correct combinational design. Partly this is because of the complexity in the memory map for the system. A combinational decoder would be very hard to write "nicely".

The address map is as follows, all addresses in hex. Note that the decoding is partial in that the selected devices will appear at many addresses not just the "official" address used by software. This saves logic resouces. Don't cares are illustrated by dashes in the table below:

<table>
<tr>
<th>Address</th>
<th>Function</th>
</tr><tr>
<td>00000000-30000000</td>
<td>SIMM slot 0</td>
</tr><tr>
<td>40000000-40ffffff</td>
<td>Expansion slot 0</td>
</tr><tr>
<td>41000000-41ffffff</td>
<td>Expansion slot 1</td>
</tr><tr>
<td>42000000-42ffffff</td>
<td>Expansion slot 2</td>
</tr><tr>
<td>43000000-43ffffff</td>
<td>Expansion slot 3</td>
</tr><tr>
<td>44--0---</td>
<td>FPGA registers</td>
</tr><tr>
<td>44--0-00</td>
<td>LED</td>
</tr><tr>
<td>44--0-01</td>
<td>BUZZER</td>
</tr><tr>
<td>44--0-02</td>
<td>SYS_CONFIG</td>
</tr><tr>
<td>44--0-03</td>
<td>PS2A_STATUS</td>
</tr><tr>
<td>44--0-04</td>
<td>PS2A_SCANCODE</td>
</tr><tr>
<td>44--0-05</td>
<td>PS2B_STATUS</td>
</tr><tr>
<td>44--0-06</td>
<td>PS2B_SCANCODE</td>
</tr><tr>
<td>44--0-07</td>
<td>I2C_ADDRESS</td>
</tr><tr>
<td>44--0-08</td>
<td>I2C_WRITE_DATA</td>
</tr><tr>
<td>44--0-09</td>
<td>I2C_READ_DATA</td>
</tr><tr>
<td>44--0-0a</td>
<td>I2C_CONTROL</td>
</tr><tr>
<td>44--0-0B</td>
<td>RTC_INT_CONTROL</td>
</tr><tr>
<td>44--0-0c</td>
<td>SPI</td>
</tr><tr>
<td>44--0-0d</td>
<td>TIMER_COUNTU</td>
</tr><tr>
<td>44--0-0e</td>
<td>TIMER_COUNTM</td>
</tr><tr>
<td>44--0-0f</td>
<td>TIMER_COUNTL</td>
</tr><tr>
<td>44--0-10</td>
<td>TIMER_CONTROL</td>
</tr><tr>
<td>44--0-11</td>
<td>INT_PASS</td>
</tr><tr>
<td>44--1---</td>
<td>QUART</td>
</tr><tr>
<td>44--2---</td>
<td>IDE1</td>
</tr><tr>
<td>44--3---</td>
<td>IDE3</td>
</tr><tr>
<td>44--4---</td>
<td>ETH</td>
</tr><tr>
<td>ff------</td>
<td>ROM</td>
</tr><tr>
</table>

The address decoder also deals with non "normal" accesses, namely:

* FPU: The coprocessor uses standard bus cycles, but with a specific Function Code output, and address outputs.
* Interrupt Acknowledgement: Similar to coprocessor access.

In the vector_fetched state, the address decoder is also responsible for forcing the ROM to be selected, regardless of other inputs.

Note the overlying state of a cycle, which is one of:

* CYCLE_NULL: set when the address strobe is not asserted
* CYCLE_BOOT_VECTORS: set for the first four address strobe cycles
* CYCLE_FPU: set when the cycle is an FPU cycle
* CYCLE_INT_ACK: set when the cycle is an interrupt acknowledgement
* CYCLE_REG: set when an FPGA register is being accessed
* CYCLE_NORMAL: set for all other accessses

This is asserted combinationally in the external entity, and is fed to the address decoder to save it somme work.

The output of the address decoder is an array, with one element per device. The address decoder will only assert one select at a time. Another key signal the address decoder is responsible for generating is the addr_width output, which sets the width of the device selected (byte, word or long). This in turn is used to generate the processor's /DSACK signals. For instance, the SIMM is a 32 bit (long) wide device, whilst the flash and expansion slots are 16 bits wide.

## dtack_generator

This entity's job is to delay the /DSACK signal for the number of cycles required for that particular device. It is is fed a generic; the cycle count. A simple counter is used to assert a "wait complete" signal when the counter reaches the delay value. An instance of this entity is created for each device which needs waitstates. This is one of the few entities to have multiple instances.

## buzzer_generator

A simple tone generator. The tone to be played is generated by incrementing a counter until it reaches the programmed value, upon which the buzzer output is toggled. The upper 8 bits of the 18 bit counter are tested, to scale the tone to audible values. Setting the programmed value to zero disables the counter, silencing the buzzer.

## maxi030_core

This is the top level entity. It is mostly concerned with instantiating the other entities, but also has some functionality of its own.

### Port sizing

The 68030 is a 32 bit processor with a byte addressable address bus. It supports both narrowed accesses and unaligned accesses. This is facilitated by the following signals:

* SIZ{0,1} outputs: This encodes the size of the request.
* /DSACK{0,1} inputs: This encodes the size of the port available at the selected address, in addition to indicating that the processor should generate an internal waitstate.
* A0 and A1: This indicates the offset into the word or long.

To complete the access, the processor may need to generate individual byte selects. For instance, a 32 bit device, like a 72 pin SIMM, needs byte select for each of the 4 bytes available. These outputs need to be generated based on the size of the request and the A0/A1 values for the access.

Luckily the [MC68030 datasheet](https://www.nxp.com/docs/en/reference-manual/MC68030UM.pdf) includes both a schematic including 74-series logic gates, and some [ABEL](https://en.wikipedia.org/wiki/Advanced_Boolean_Expression_Language) code for a circuit that generates the needed signals for word and long-wide devices. This ABEL can has been translated into VHDL and included verbatim. Devices use these internal signals to form their final chip selects, by combining them with the device selects generated by the address decoder.

### Cycle type generator

This was covered in the address decoding section above.

### Read and Write generator

This is a simple but critical part of the design which generates internal read and write signals, using the /DS data strobe and R/W signal. In this block the write line is also inhibited for ROM access, if the SYS_CONFIG register is configured to do this.

### Register Read and Write action

This sequential process is responsible for managing the internal state based on accesses by the processor to FPGA-exposed registers. For instance, the board LED is controlled by the processor writing to the low bit of the LED registers address (generally 44000001). This action, and that of the other registers, is handled here.

This block is also responsible for clearing trigger signals which are set for one cycle only after writing to a register. This is the basic mechanism for many parts of the overall design, such as the I2C data sender: writing to the I2C_WRITE_DATA register will both latch the data to be sent, and trigger its sending.

Lastly read accesses are handled here. Most read accesses are "no ops", but some have side effects: for instance reading a PS2 scancode register will cause the read FIFO to expose the next data item, assuming there is one.

### Presenting data on the databus

The main instance when data must be presented on the FPGA's databus is when FPGA-exposed registers are read, though there are other potential cases, including when interrupt vectors are generated, though this is not currently implemented. This is simple combinational logic: the address decoder output is combined with the general read signal and the databus asserted with the needed value. Note that some registers use the full 8 bits of data, but some will just use the lower bits and set the higher bits to zero.

### Chip Selects and other outputs

Here decoded internal selects are combined with the request sizing state to generate the external chip selects. For instance the lower ROM IC is enabled (set low) when the address decoder selects the ROM and the sizing logic indicates the low half of the word has been selected. The eight expansion card upper and lower selects are also generated here.

This block also includes the SIMM /RAS and /CAS output generation, as well as the generation of negative logic for other outputs like /READ and /WRITE.

The LED output is set here based on the status of bit 0 of the LED register, which is itself held in the led_state signal, which is set in the register write action process, described above.

### /DSACK generation

/DSACK generation uses a combination of the addr_width signal, generated by the address decoding, and the waitstate generator for each of the devices that require waitstates. If a waitstate is needed both outputs are driven high. If no waitstates are pending then the /DSACK output is set to the size of the selected port. One exceptional case is the FPU, which requires the /DSACK pins on the FPGA to be tristated so that FPU itself can generate the processor's /DSACK inputs.

### Interrupt routing

At the current time interrupt routing is sequential logic, though this is probably incorrect. In any case the interrupt routing is very simplisitic: a priority encoder is used based on the interrupt inputs and the interrupt mask bits in the INT_PASS register. Currently 5 bits are defined, one for each of the possible interrupt sources. If a bit is 1, the interrupt can be enabled, if it is 0 it will be blocked.

### Generation of misc MPU signals

Some simple combinational logic is used to generate the /CIIN (Cache Inhibit Input) signal: if the ROM or the SIMM is selected, the cache is enabled (/CIIN is high) otherwise it is disabled. This prevents IO operations from being cached. Currently the bus mastering functionality in the 68030 is not used, so signals related to it are all driven high here.

### SYS_CLEAR signal generation

As an extra precaution for a clean processor startup, the board /RESET signal is held off being asserted at power on by a counter. This keeps the processor paused while the FPGA configures itself, which is accomplished with a pull-down resistor), and for a short time afterwards. In theory it is not needed, but is present out of paranoia. Note that system reset (except the FPGA itself) is under FPGA control. This could allow the implementation of a watchdog timer, and similar functionality, though nothing has so far been written to do this.

## timer.vhd

Though the boards QUART contains two timers, the Linux port required a standalone timer, so one was added to MAXI030Core.

The timer has a 24 bit countdown register starting value (exposed on 3 byte wide FPGA-addressable registers) and a control register.

On a trigger, which is set for one cycle when the control register is written to, the current counter value is copied from the starting value and the counter is enabled. At every cycle, if the counter is enabled it counts down. When it reaches 0 the counter rollover signal is set to 1, but the counter keeps counting down. Thus no matter how slow the processor is at acknowledging the rollover interrupt, the frequency of the interrupt will match the counter start value.

There are two bits used on the exposed TIMER_CONTROL register:

* bit 0: starts the timer
* bit 1: stops the timer

Clearing the interrupt is achieved by writing a 1 to bit 0, which will restart (though it will still be running) the counter, clearing the rollover output but not otherwise affecting the timer since, at that point, it is already running and not stopped.

## i2c.vhd

The I2C controller used is a direct copy of a project I have published as a [standalone piece of programmable logic](https://github.com/aslak3/i2c-controller). It's interface to the outside world is through the I2C registers. The four registers are used as follows:

* I2C_ADDRESS : Sets the slave address. The MSB (and not the LSB) is used to set the read (1) or write mode. This will trigger a transfer, sending the address.
* I2C_READ_DATA : This will (somewhat unobviously) trigger a transfer. Poll on bit 0 of I2C_CONTROL until it is 0 to know when the data can actually be read.
* I2C_WRITE_DATA : This will trigger a transfer.
* I2C_CONTROL : This is a read and write register. In read (AKA I2C_STATUS) bit 0 is the busy flag, and bit 1 is the ack_error flag. In write bit 0 indicates that this is the last byte to be transferred.

## ps2_controller.vhd

This is a bi-directional PS/2 interface. This will, eventually, be pushed up into a standalone repository like the I2C controller was, and will be documented fully there.

Note that this FPGA makes use of one Altera "MegaFunction": A FIFO in front of the PS/2 output data. This was added because of problems with missing data bytes from the port when running Linux, presumably because under some conditions Linux will disable interrupts, causing lost data if it is not buffered in hardware.

## simm_controller.vhd

There are two entities which form a fairly dumb DRAM controller, which is used by the SIMM slots (well only one slot currently). A simple state machine is used. Refresh timing is mostly approximated. Also, the controller does not support EDO mode or rows being held open, or anything else clever that could make it more efficient.

However one nice aspect of the design is that because the FPGA is exposed to the entire processor address bus, *and* it is directly attached to the address pins on the SIMM, complete flexibility of supported memory sizes is possible. I currently have access to an 8 MByte and a 32 MByte SIMM, and both have been tested and are working.

This is a particularly interesting area, from the point of view of improvements to the performance of the MAXI030 board: besides the missing EDO mode, it would be great to make use of the MC68030 burst mode to fill the cache with back to back transfers.

## spi.vhd

This is a simple SPI sender. During  bring-up I have used this to capture the state of the processor code execution, by routing the output of this SPI controller to one of the user IO pins and monitoring it with a Logic Analyser. It is normally not used.

## uart.vhd

The MAXI030 board formed a test-bench for a project I have been meaning to tackle for a few years: implementing my own UART. This is about the last of the "old school" serial protocol I have not looked at implementing a controller for, so I thought I would have a go at it. The result is a simple UART interface which has no support for parity and runs at a fixed baud rate. This will be removed from MAXI030Core at some point, since it is not useful as the board contains a nice "hard" QUART IC.
