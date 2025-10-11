// PORT WIDTHS
//
`define PORT_WIDTH_WIDTH                2
`define PORT_WIDTH_LONG                 2'b00
`define PORT_WIDTH_WORD                 2'b01
`define PORT_WIDTH_BYTE                 2'b10
`define PORT_WIDTH_NULL                 2'b11

// FUNCTIONS
//
`define FUNCTION_FPU_POS                0
`define FUNCTION_INT_ACK_POS            1
`define FUNCTION_NORMAL_POS             2
`define FUNCTION_SELECTED_MAXPOS        3

`define FUNCTION_NULL                   {`FUNCTION_SELECTED_MAXPOS{1'b0}}

// DEVICES
//
// 32bit port
`define DEVICE_SIMM_POS                 0
// 8 bit port
`define DEVICE_REGISTER8_POS            1
`define DEVICE_QUART_POS                2
// 16 bit port
`define DEVICE_REGISTER16_POS           3
`define DEVICE_SLOT0_POS                4
`define DEVICE_SLOT1_POS                5
`define DEVICE_SLOT2_POS                6
`define DEVICE_SLOT3_POS                7
`define DEVICE_IDE1_POS                 8
`define DEVICE_IDE3_POS                 9
`define DEVICE_ETH_POS                  10
`define DEVICE_ROM_POS                  11
// 32 bit port
`define DEVICE_REGISTER32_POS           12
`define DEVICE_SELECTED_MAXPOS          13

`define DEVICE_NULL                     {`DEVICE_SELECTED_MAXPOS{1'b0}}

// REGISTERS 8 bit
`define REGISTER8_LED_POS               0
`define REGISTER8_INTS_ENABLED_POS      1
`define REGISTER8_TIMER_CONTROL_POS     2
`define REGISTER8_SELECTED_MAXPOS       3

`define REGISTER8_NULL                  {`REGISTER8_SELECTED_MAXPOS{1'b0}}

// REGISTERS 16 bit
`define REGISTER16_SELECTED_MAXPOS      1

`define REGISTER16_NULL                  {`REGISTER16_SELECTED_MAXPOS{1'b0}}

// REGISTERS 32 bit
`define REGISTER32_TIMER_START_VALUE_POS    0
`define REGISTER32_TIMER_CURRENT_VALUE_POS  1
`define REGISTER32_SELECTED_MAXPOS          2

`define REGISTER32_NULL                 {`REGISTER32_SELECTED_MAXPOS{1'b0}}
