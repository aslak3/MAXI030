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
`define FUNCTION_FPU                    (1 << `FUNCTION_FPU_POS)
`define FUNCTION_INT_ACK                (1 << `FUNCTION_INT_ACK_POS)
`define FUNCTION_NORMAL                 (1 << `FUNCTION_NORMAL_POS)

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
// 32bit port
`define DEVICE_SIMM                     (1 << `DEVICE_SIMM_POS)
// 8 bit port
`define DEVICE_REGISTER8                (1 << `DEVICE_REGISTER8_POS)
`define DEVICE_QUART                    (1 << `DEVICE_QUART_POS)
// 16 bit port
`define DEVICE_REGISTER16               (1 << `DEVICE_REGISTER16_POS)
`define DEVICE_SLOT0                    (1 << `DEVICE_SLOT0_POS)
`define DEVICE_SLOT1                    (1 << `DEVICE_SLOT1_POS)
`define DEVICE_SLOT2                    (1 << `DEVICE_SLOT2_POS)
`define DEVICE_SLOT3                    (1 << `DEVICE_SLOT3_POS)
`define DEVICE_IDE1                      (1 << `DEVICE_IDE1_POS)
`define DEVICE_IDE3                     (1 << `DEVICE_IDE3_POS)
`define DEVICE_ETH                      (1 << `DEVICE_ETH_POS)
`define DEVICE_ROM                      (1 << `DEVICE_ROM_POS)
// 32 bit port
`define DEVICE_REGISTER32               (1 << `DEVICE_REGISTER32_POS)

// REGISTERS 8 bit
`define REGISTER8_LED_POS               0
`define REGISTER8_SELECTED_MAXPOS       1

`define REGISTER8_NULL                  {`REGISTER8_SELECTED_MAXPOS{1'b0}}
`define REGISTER8_LED                   (1 << `REGISTER8_LED_POS)

// REGISTERS 16 bit
`define REGISTER16_TEST_POS             0
`define REGISTER16_SELECTED_MAXPOS      1

`define REGISTER16_NULL                  {`REGISTER16_SELECTED_MAXPOS{1'b0}}
`define REGISTER16_TEST                  (1 << `REGISTER16_TEST_POS)


// REGISTERS 32 bit
`define REGISTER32_TEST_POS             0
`define REGISTER32_SELECTED_MAXPOS      1

`define REGISTER32_NULL                 {`REGISTER32_SELECTED_MAXPOS{1'b0}}
`define REGISTER32_TEST                 (1 << `REGISTER32_TEST_POS)
