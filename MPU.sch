EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 14
Title "MAXI030 - 68030 based expandable computer"
Date "2021-10-02"
Rev ""
Comp ""
Comment1 "Lawrence Manning"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS03 U?
U 1 1 814D9103
P 10250 1350
AR Path="/7DF01BC3/814D9103" Ref="U?"  Part="1" 
AR Path="/814D61C4/814D9103" Ref="U6"  Part="1" 
F 0 "U6" H 10250 1675 50  0000 C CNN
F 1 "74LS03" H 10250 1584 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10250 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 10250 1350 50  0001 C CNN
	1    10250 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1350 10650 1350
$Comp
L Device:R R?
U 1 1 814D910A
P 10650 1100
AR Path="/7DF01BC3/814D910A" Ref="R?"  Part="1" 
AR Path="/814D61C4/814D910A" Ref="R5"  Part="1" 
F 0 "R5" V 10730 1100 50  0000 C CNN
F 1 "4.7K" V 10550 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10580 1100 30  0001 C CNN
F 3 "" H 10650 1100 30  0000 C CNN
	1    10650 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	10650 1250 10650 1350
Connection ~ 10650 1350
Wire Wire Line
	10650 1350 10750 1350
Wire Wire Line
	9950 1450 9850 1450
Wire Wire Line
	9850 1450 9850 1250
Wire Wire Line
	9850 1250 9950 1250
Wire Wire Line
	9850 1250 9750 1250
Connection ~ 9850 1250
Text GLabel 9750 1250 0    39   Input ~ 0
SYSCLEAR
$Comp
L 74xx:74LS03 U?
U 2 1 814D9120
P 10250 2000
AR Path="/7DF01BC3/814D9120" Ref="U?"  Part="2" 
AR Path="/814D61C4/814D9120" Ref="U6"  Part="2" 
F 0 "U6" H 10250 2325 50  0000 C CNN
F 1 "74LS03" H 10250 2234 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10250 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 10250 2000 50  0001 C CNN
	2    10250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2100 9850 2100
Wire Wire Line
	9850 1900 9950 1900
$Comp
L 74xx:74LS03 U?
U 5 1 814D9130
P 9350 2400
AR Path="/7DF01BC3/814D9130" Ref="U?"  Part="5" 
AR Path="/814D61C4/814D9130" Ref="U6"  Part="5" 
F 0 "U6" H 9580 2446 50  0000 L CNN
F 1 "74LS03" H 9580 2355 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9350 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 9350 2400 50  0001 C CNN
	5    9350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1800 9350 1900
Wire Wire Line
	9350 2900 9350 3000
Text GLabel 10850 1350 2    39   BiDi ~ 0
~RESET
$Comp
L 74xx:74LS03 U?
U 3 1 814D914D
P 10250 2650
AR Path="/7DF01BC3/814D914D" Ref="U?"  Part="3" 
AR Path="/814D61C4/814D914D" Ref="U6"  Part="3" 
F 0 "U6" H 10250 2975 50  0000 C CNN
F 1 "74LS03" H 10250 2884 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10250 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 10250 2650 50  0001 C CNN
	3    10250 2650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS03 U?
U 4 1 814D9153
P 10250 3300
AR Path="/7DF01BC3/814D9153" Ref="U?"  Part="4" 
AR Path="/814D61C4/814D9153" Ref="U6"  Part="4" 
F 0 "U6" H 10250 3625 50  0000 C CNN
F 1 "74LS03" H 10250 3534 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10250 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 10250 3300 50  0001 C CNN
	4    10250 3300
	1    0    0    -1  
$EndComp
NoConn ~ 14750 -50 
NoConn ~ 14750 600 
Wire Wire Line
	1000 1400 800  1400
Wire Wire Line
	1000 1500 800  1500
Wire Wire Line
	1000 1600 800  1600
Wire Wire Line
	1000 1700 800  1700
Wire Wire Line
	1000 1800 800  1800
Wire Wire Line
	1000 1900 800  1900
Wire Wire Line
	1000 2000 800  2000
Wire Wire Line
	1000 2100 800  2100
Wire Wire Line
	1000 2200 800  2200
Wire Wire Line
	1000 2300 800  2300
Wire Wire Line
	1000 2400 800  2400
Wire Wire Line
	1000 2500 800  2500
Wire Wire Line
	1000 2600 800  2600
Wire Wire Line
	1000 2700 800  2700
Wire Wire Line
	1000 2800 800  2800
Wire Wire Line
	1000 2900 800  2900
Wire Wire Line
	1000 3000 800  3000
Wire Wire Line
	1000 3100 800  3100
Wire Wire Line
	1000 3200 800  3200
Wire Wire Line
	1000 3300 800  3300
Wire Wire Line
	1000 3400 800  3400
Wire Wire Line
	1000 3500 800  3500
Wire Wire Line
	1000 3600 800  3600
Wire Wire Line
	1000 3700 800  3700
Wire Wire Line
	1000 3800 800  3800
Wire Wire Line
	1000 3900 800  3900
Wire Wire Line
	1000 4000 800  4000
Wire Wire Line
	1000 4100 800  4100
Wire Wire Line
	1000 4200 800  4200
Wire Wire Line
	1000 4300 800  4300
Wire Wire Line
	1000 4400 800  4400
Wire Wire Line
	1000 4500 800  4500
Entry Wire Line
	800  1400 700  1500
Entry Wire Line
	800  1500 700  1600
Entry Wire Line
	800  1600 700  1700
Entry Wire Line
	800  1700 700  1800
Entry Wire Line
	800  1800 700  1900
Entry Wire Line
	800  1900 700  2000
Entry Wire Line
	800  2000 700  2100
Entry Wire Line
	800  2100 700  2200
Entry Wire Line
	800  2200 700  2300
Entry Wire Line
	800  2300 700  2400
Entry Wire Line
	800  2400 700  2500
Entry Wire Line
	800  2500 700  2600
Entry Wire Line
	800  2600 700  2700
Entry Wire Line
	800  2700 700  2800
Entry Wire Line
	800  2800 700  2900
Entry Wire Line
	800  2900 700  3000
Entry Wire Line
	800  3000 700  3100
Entry Wire Line
	800  3100 700  3200
Entry Wire Line
	800  3200 700  3300
Entry Wire Line
	800  3300 700  3400
Entry Wire Line
	800  3400 700  3500
Entry Wire Line
	800  3500 700  3600
Entry Wire Line
	800  3600 700  3700
Entry Wire Line
	800  3700 700  3800
Entry Wire Line
	800  3800 700  3900
Entry Wire Line
	800  3900 700  4000
Entry Wire Line
	800  4000 700  4100
Entry Wire Line
	800  4100 700  4200
Entry Wire Line
	800  4200 700  4300
Entry Wire Line
	800  4300 700  4400
Entry Wire Line
	800  4400 700  4500
Entry Wire Line
	800  4500 700  4600
Wire Wire Line
	4500 1400 4700 1400
Wire Wire Line
	4500 1500 4700 1500
Wire Wire Line
	4500 1600 4700 1600
Wire Wire Line
	4500 1700 4700 1700
Wire Wire Line
	4500 1800 4700 1800
Wire Wire Line
	4500 1900 4700 1900
Wire Wire Line
	4500 2000 4700 2000
Wire Wire Line
	4500 2100 4700 2100
Wire Wire Line
	4500 2200 4700 2200
Wire Wire Line
	4500 2300 4700 2300
Wire Wire Line
	4500 2400 4700 2400
Wire Wire Line
	4500 2500 4700 2500
Wire Wire Line
	4500 2600 4700 2600
Wire Wire Line
	4500 2700 4700 2700
Wire Wire Line
	4500 2800 4700 2800
Wire Wire Line
	4500 2900 4700 2900
Wire Wire Line
	4500 3000 4700 3000
Wire Wire Line
	4500 3100 4700 3100
Wire Wire Line
	4500 3200 4700 3200
Wire Wire Line
	4500 3300 4700 3300
Wire Wire Line
	4500 3400 4700 3400
Wire Wire Line
	4500 3500 4700 3500
Wire Wire Line
	4500 3600 4700 3600
Wire Wire Line
	4500 3700 4700 3700
Wire Wire Line
	4500 3800 4700 3800
Wire Wire Line
	4500 3900 4700 3900
Wire Wire Line
	4500 4000 4700 4000
Wire Wire Line
	4500 4100 4700 4100
Wire Wire Line
	4500 4200 4700 4200
Wire Wire Line
	4500 4300 4700 4300
Wire Wire Line
	4500 4400 4700 4400
Wire Wire Line
	4500 4500 4700 4500
Entry Wire Line
	4700 1400 4800 1500
Entry Wire Line
	4700 1500 4800 1600
Entry Wire Line
	4700 1600 4800 1700
Entry Wire Line
	4700 1700 4800 1800
Entry Wire Line
	4700 1800 4800 1900
Entry Wire Line
	4700 1900 4800 2000
Entry Wire Line
	4700 2000 4800 2100
Entry Wire Line
	4700 2100 4800 2200
Entry Wire Line
	4700 2200 4800 2300
Entry Wire Line
	4700 2300 4800 2400
Entry Wire Line
	4700 2400 4800 2500
Entry Wire Line
	4700 2500 4800 2600
Entry Wire Line
	4700 2600 4800 2700
Entry Wire Line
	4700 2700 4800 2800
Entry Wire Line
	4700 2800 4800 2900
Entry Wire Line
	4700 2900 4800 3000
Entry Wire Line
	4700 3000 4800 3100
Entry Wire Line
	4700 3100 4800 3200
Entry Wire Line
	4700 3200 4800 3300
Entry Wire Line
	4700 3300 4800 3400
Entry Wire Line
	4700 3400 4800 3500
Entry Wire Line
	4700 3500 4800 3600
Entry Wire Line
	4700 3600 4800 3700
Entry Wire Line
	4700 3700 4800 3800
Entry Wire Line
	4700 3800 4800 3900
Entry Wire Line
	4700 3900 4800 4000
Entry Wire Line
	4700 4000 4800 4100
Entry Wire Line
	4700 4100 4800 4200
Entry Wire Line
	4700 4200 4800 4300
Entry Wire Line
	4700 4300 4800 4400
Entry Wire Line
	4700 4400 4800 4500
Entry Wire Line
	4700 4500 4800 4600
Text Label 4500 1400 0    50   ~ 0
D0
Text Label 4500 1500 0    50   ~ 0
D1
Text Label 4500 1600 0    50   ~ 0
D2
Text Label 4500 1700 0    50   ~ 0
D3
Text Label 4500 1800 0    50   ~ 0
D4
Text Label 4500 1900 0    50   ~ 0
D5
Text Label 4500 2000 0    50   ~ 0
D6
Text Label 4500 2100 0    50   ~ 0
D7
Text Label 4500 2200 0    50   ~ 0
D8
Text Label 4500 2300 0    50   ~ 0
D9
Text Label 4500 2400 0    50   ~ 0
D10
Text Label 4500 2500 0    50   ~ 0
D11
Text Label 4500 2600 0    50   ~ 0
D12
Text Label 4500 2700 0    50   ~ 0
D13
Text Label 4500 2800 0    50   ~ 0
D14
Text Label 4500 2900 0    50   ~ 0
D15
Text Label 4500 3000 0    50   ~ 0
D16
Text Label 4500 3100 0    50   ~ 0
D17
Text Label 4500 3200 0    50   ~ 0
D18
Text Label 4500 3300 0    50   ~ 0
D19
Text Label 4500 3400 0    50   ~ 0
D20
Text Label 4500 3500 0    50   ~ 0
D21
Text Label 4500 3600 0    50   ~ 0
D22
Text Label 4500 3700 0    50   ~ 0
D23
Text Label 4500 3800 0    50   ~ 0
D24
Text Label 4500 3900 0    50   ~ 0
D25
Text Label 4500 4000 0    50   ~ 0
D26
Text Label 4500 4100 0    50   ~ 0
D27
Text Label 4500 4200 0    50   ~ 0
D28
Text Label 4500 4300 0    50   ~ 0
D29
Text Label 4500 4400 0    50   ~ 0
D30
Text Label 4500 4500 0    50   ~ 0
D31
Wire Wire Line
	4500 5100 4700 5100
Wire Wire Line
	4500 5200 4700 5200
Wire Wire Line
	4500 5300 4700 5300
Wire Wire Line
	4500 5500 4700 5500
Wire Wire Line
	1000 6100 800  6100
Wire Wire Line
	1000 6200 800  6200
Wire Wire Line
	4500 6850 4700 6850
Wire Wire Line
	1000 4700 800  4700
Wire Wire Line
	1000 4800 800  4800
Wire Wire Line
	1000 4900 800  4900
Wire Wire Line
	4500 5400 4700 5400
Wire Wire Line
	1000 5100 800  5100
Wire Wire Line
	1000 5200 800  5200
Wire Wire Line
	4500 6750 4700 6750
Wire Wire Line
	4500 6650 4700 6650
Wire Wire Line
	1000 5800 800  5800
Wire Wire Line
	1000 5900 800  5900
Wire Wire Line
	1000 5600 800  5600
Text Label 950  1400 2    50   ~ 0
A0
Text Label 950  1500 2    50   ~ 0
A1
Text Label 950  1600 2    50   ~ 0
A2
Text Label 950  1700 2    50   ~ 0
A3
Text Label 950  1800 2    50   ~ 0
A4
Text Label 950  1900 2    50   ~ 0
A5
Text Label 950  2000 2    50   ~ 0
A6
Text Label 950  2100 2    50   ~ 0
A7
Text Label 950  2200 2    50   ~ 0
A8
Text Label 950  2300 2    50   ~ 0
A9
Text Label 950  2400 2    50   ~ 0
A10
Text Label 950  2500 2    50   ~ 0
A11
Text Label 950  2600 2    50   ~ 0
A12
Text Label 950  2700 2    50   ~ 0
A13
Text Label 950  2800 2    50   ~ 0
A14
Text Label 950  2900 2    50   ~ 0
A15
Text Label 950  3000 2    50   ~ 0
A16
Text Label 950  3100 2    50   ~ 0
A17
Text Label 950  3200 2    50   ~ 0
A18
Text Label 950  3300 2    50   ~ 0
A19
Text Label 950  3400 2    50   ~ 0
A20
Text Label 950  3500 2    50   ~ 0
A21
Text Label 950  3600 2    50   ~ 0
A22
Text Label 950  3700 2    50   ~ 0
A23
Text Label 950  3800 2    50   ~ 0
A24
Text Label 950  3900 2    50   ~ 0
A25
Text Label 950  4000 2    50   ~ 0
A26
Text Label 950  4100 2    50   ~ 0
A27
Text Label 950  4200 2    50   ~ 0
A28
Text Label 950  4300 2    50   ~ 0
A29
Text Label 950  4400 2    50   ~ 0
A30
Text Label 950  4500 2    50   ~ 0
A31
Text GLabel 4700 5100 2    35   Input ~ 0
~IPL0
Text GLabel 800  4700 0    50   Output ~ 0
FC0
Text GLabel 800  4800 0    50   Output ~ 0
FC1
Text GLabel 800  4900 0    50   Output ~ 0
FC2
Text GLabel 800  5100 0    50   Output ~ 0
SIZ0
Text GLabel 800  5200 0    50   Output ~ 0
SIZ1
Text GLabel 4700 5500 2    35   Input ~ 0
~AVEC
Text GLabel 4700 5200 2    35   Input ~ 0
~IPL1
Text GLabel 4700 5300 2    35   Input ~ 0
~IPL2
Text GLabel 800  6100 0    35   Input ~ 0
~DSACK0
Text GLabel 800  6200 0    35   Input ~ 0
~DSACK1
Text GLabel 4700 6850 2    35   Input ~ 0
~BERR
Text GLabel 4700 5400 2    35   Output ~ 0
~IPEND
Text GLabel 4700 6750 2    35   Input ~ 0
~HALT
Text GLabel 4700 6650 2    35   BiDi ~ 0
~RESET
Text GLabel 800  5800 0    35   Output ~ 0
~AS
Text GLabel 800  5900 0    35   Output ~ 0
~DS
Text GLabel 800  5600 0    35   Output ~ 0
R~W
Text GLabel 1600 800  0    35   Input ~ 0
MPUCLK
Wire Wire Line
	1950 7300 1950 7400
Wire Wire Line
	1950 7400 2050 7400
Wire Wire Line
	3150 7400 3150 7300
Wire Wire Line
	2050 7300 2050 7400
Connection ~ 2050 7400
Wire Wire Line
	2050 7400 2150 7400
Wire Wire Line
	2150 7300 2150 7400
Connection ~ 2150 7400
Wire Wire Line
	2150 7400 2250 7400
Wire Wire Line
	2250 7300 2250 7400
Connection ~ 2250 7400
Wire Wire Line
	2250 7400 2350 7400
Wire Wire Line
	2350 7300 2350 7400
Connection ~ 2350 7400
Wire Wire Line
	2350 7400 2450 7400
Wire Wire Line
	2450 7300 2450 7400
Connection ~ 2450 7400
Wire Wire Line
	2450 7400 2550 7400
Wire Wire Line
	2550 7300 2550 7400
Connection ~ 2550 7400
Wire Wire Line
	2550 7400 2650 7400
Wire Wire Line
	2650 7300 2650 7400
Connection ~ 2650 7400
Wire Wire Line
	2950 7300 2950 7400
Connection ~ 2950 7400
Wire Wire Line
	2950 7400 3050 7400
Wire Wire Line
	3050 7300 3050 7400
Connection ~ 3050 7400
Wire Wire Line
	3050 7400 3150 7400
Wire Wire Line
	2650 7400 2650 7500
Wire Wire Line
	2300 900  2300 800 
Wire Wire Line
	2300 800  2400 800 
Wire Wire Line
	3200 800  3200 900 
Wire Wire Line
	2400 800  2400 900 
Connection ~ 2400 800 
Wire Wire Line
	2400 800  2500 800 
Wire Wire Line
	2500 800  2500 900 
Connection ~ 2500 800 
Wire Wire Line
	2500 800  2600 800 
Wire Wire Line
	2600 800  2600 900 
Connection ~ 2600 800 
Wire Wire Line
	2600 800  2700 800 
Wire Wire Line
	2700 800  2700 900 
Connection ~ 2700 800 
Wire Wire Line
	2700 800  2750 800 
Wire Wire Line
	2800 800  2800 900 
Connection ~ 2800 800 
Wire Wire Line
	2800 800  2900 800 
Wire Wire Line
	2900 800  2900 900 
Connection ~ 2900 800 
Wire Wire Line
	2900 800  3000 800 
Wire Wire Line
	3000 800  3000 900 
Connection ~ 3000 800 
Wire Wire Line
	3000 800  3100 800 
Wire Wire Line
	3100 800  3100 900 
Connection ~ 3100 800 
Wire Wire Line
	3100 800  3200 800 
Wire Wire Line
	2750 800  2750 700 
Connection ~ 2750 800 
Wire Wire Line
	2750 800  2800 800 
Wire Wire Line
	1900 900  1900 800 
Wire Wire Line
	1600 800  1900 800 
Wire Wire Line
	8600 1400 8800 1400
Wire Wire Line
	8600 1500 8800 1500
Wire Wire Line
	8600 1600 8800 1600
Wire Wire Line
	8600 1700 8800 1700
Wire Wire Line
	8600 1800 8800 1800
Wire Wire Line
	8600 1900 8800 1900
Wire Wire Line
	8600 2000 8800 2000
Wire Wire Line
	8600 2100 8800 2100
Wire Wire Line
	8600 2200 8800 2200
Wire Wire Line
	8600 2300 8800 2300
Wire Wire Line
	8600 2400 8800 2400
Wire Wire Line
	8600 2500 8800 2500
Wire Wire Line
	8600 2600 8800 2600
Wire Wire Line
	8600 2700 8800 2700
Wire Wire Line
	8600 2800 8800 2800
Wire Wire Line
	8600 2900 8800 2900
Wire Wire Line
	8600 3000 8800 3000
Wire Wire Line
	8600 3100 8800 3100
Wire Wire Line
	8600 3200 8800 3200
Wire Wire Line
	8600 3300 8800 3300
Wire Wire Line
	8600 3400 8800 3400
Wire Wire Line
	8600 3500 8800 3500
Wire Wire Line
	8600 3600 8800 3600
Wire Wire Line
	8600 3700 8800 3700
Wire Wire Line
	8600 3800 8800 3800
Wire Wire Line
	8600 3900 8800 3900
Wire Wire Line
	8600 4000 8800 4000
Wire Wire Line
	8600 4100 8800 4100
Wire Wire Line
	8600 4200 8800 4200
Wire Wire Line
	8600 4300 8800 4300
Wire Wire Line
	8600 4400 8800 4400
Wire Wire Line
	8600 4500 8800 4500
Entry Wire Line
	8800 1400 8900 1500
Entry Wire Line
	8800 1500 8900 1600
Entry Wire Line
	8800 1600 8900 1700
Entry Wire Line
	8800 1700 8900 1800
Entry Wire Line
	8800 1800 8900 1900
Entry Wire Line
	8800 1900 8900 2000
Entry Wire Line
	8800 2000 8900 2100
Entry Wire Line
	8800 2100 8900 2200
Entry Wire Line
	8800 2200 8900 2300
Entry Wire Line
	8800 2300 8900 2400
Entry Wire Line
	8800 2400 8900 2500
Entry Wire Line
	8800 2500 8900 2600
Entry Wire Line
	8800 2600 8900 2700
Entry Wire Line
	8800 2700 8900 2800
Entry Wire Line
	8800 2800 8900 2900
Entry Wire Line
	8800 2900 8900 3000
Entry Wire Line
	8800 3000 8900 3100
Entry Wire Line
	8800 3100 8900 3200
Entry Wire Line
	8800 3200 8900 3300
Entry Wire Line
	8800 3300 8900 3400
Entry Wire Line
	8800 3400 8900 3500
Entry Wire Line
	8800 3500 8900 3600
Entry Wire Line
	8800 3600 8900 3700
Entry Wire Line
	8800 3700 8900 3800
Entry Wire Line
	8800 3800 8900 3900
Entry Wire Line
	8800 3900 8900 4000
Entry Wire Line
	8800 4000 8900 4100
Entry Wire Line
	8800 4100 8900 4200
Entry Wire Line
	8800 4200 8900 4300
Entry Wire Line
	8800 4300 8900 4400
Entry Wire Line
	8800 4400 8900 4500
Entry Wire Line
	8800 4500 8900 4600
Text Label 8600 2400 0    50   ~ 0
D10
Text Label 8600 2500 0    50   ~ 0
D11
Text Label 8600 2600 0    50   ~ 0
D12
Text Label 8600 2700 0    50   ~ 0
D13
Text Label 8600 2800 0    50   ~ 0
D14
Text Label 8600 2900 0    50   ~ 0
D15
Text Label 8600 3000 0    50   ~ 0
D16
Text Label 8600 3100 0    50   ~ 0
D17
Text Label 8600 3200 0    50   ~ 0
D18
Text Label 8600 3300 0    50   ~ 0
D19
Text Label 8600 3400 0    50   ~ 0
D20
Text Label 8600 3500 0    50   ~ 0
D21
Text Label 8600 3600 0    50   ~ 0
D22
Text Label 8600 3700 0    50   ~ 0
D23
Text Label 8600 3800 0    50   ~ 0
D24
Text Label 8600 3900 0    50   ~ 0
D25
Text Label 8600 4000 0    50   ~ 0
D26
Text Label 8600 4100 0    50   ~ 0
D27
Text Label 8600 4200 0    50   ~ 0
D28
Text Label 8600 4300 0    50   ~ 0
D29
Text Label 8600 4400 0    50   ~ 0
D30
Text Label 8600 4500 0    50   ~ 0
D31
Wire Wire Line
	7650 5000 7750 5000
Connection ~ 7750 5000
Wire Wire Line
	7750 5000 7850 5000
Connection ~ 7850 5000
Wire Wire Line
	7850 5000 7950 5000
Connection ~ 7950 5000
Wire Wire Line
	7950 5000 8050 5000
Wire Wire Line
	7250 5000 7350 5000
Connection ~ 7350 5000
Wire Wire Line
	7350 5000 7450 5000
Connection ~ 7450 5000
Wire Wire Line
	7450 5000 7500 5000
Connection ~ 7550 5000
Wire Wire Line
	7550 5000 7650 5000
Connection ~ 7650 5000
Wire Wire Line
	6950 5000 7050 5000
Connection ~ 7050 5000
Wire Wire Line
	7050 5000 7150 5000
Connection ~ 7150 5000
Wire Wire Line
	7150 5000 7250 5000
Connection ~ 7250 5000
Wire Wire Line
	7200 1000 7200 900 
Wire Wire Line
	7200 900  7300 900 
Wire Wire Line
	7800 900  7800 1000
Wire Wire Line
	7700 1000 7700 900 
Connection ~ 7700 900 
Wire Wire Line
	7700 900  7800 900 
Wire Wire Line
	7600 900  7600 1000
Connection ~ 7600 900 
Wire Wire Line
	7600 900  7700 900 
Wire Wire Line
	7500 1000 7500 900 
Connection ~ 7500 900 
Wire Wire Line
	7500 900  7600 900 
Wire Wire Line
	7400 900  7400 1000
Connection ~ 7400 900 
Wire Wire Line
	7400 900  7500 900 
Wire Wire Line
	7300 1000 7300 900 
Connection ~ 7300 900 
Wire Wire Line
	7300 900  7400 900 
Wire Wire Line
	7500 900  7500 800 
Wire Wire Line
	7500 5000 7500 5100
Connection ~ 7500 5000
Wire Wire Line
	7500 5000 7550 5000
Wire Wire Line
	6400 2050 6250 2050
Wire Wire Line
	6400 2250 6250 2250
Wire Wire Line
	6400 2450 6250 2450
Wire Wire Line
	6400 2550 6250 2550
Wire Wire Line
	6400 2650 6250 2650
Wire Wire Line
	6400 2750 6250 2750
Wire Wire Line
	6400 2950 6250 2950
Wire Wire Line
	6400 3050 6250 3050
Wire Wire Line
	6400 3350 6250 3350
Wire Wire Line
	6400 3450 6250 3450
Wire Wire Line
	6400 3550 6250 3550
Wire Wire Line
	6400 3650 6250 3650
Text Label 8600 1400 0    50   ~ 0
D0
Text Label 8600 1500 0    50   ~ 0
D1
Text Label 8600 1600 0    50   ~ 0
D2
Text Label 8600 1700 0    50   ~ 0
D3
Text Label 8600 1800 0    50   ~ 0
D4
Text Label 8600 1900 0    50   ~ 0
D5
Text Label 8600 2000 0    50   ~ 0
D6
Text Label 8600 2100 0    50   ~ 0
D7
Text Label 8600 2200 0    50   ~ 0
D8
Text Label 8600 2300 0    50   ~ 0
D9
Entry Wire Line
	6150 3450 6250 3350
Entry Wire Line
	6150 3550 6250 3450
Entry Wire Line
	6150 3650 6250 3550
Entry Wire Line
	6150 3750 6250 3650
Text GLabel 6250 2950 0    35   Output ~ 0
~DSACK0
Text GLabel 6250 3050 0    35   Output ~ 0
~DSACK1
Text GLabel 6250 2250 0    35   Input ~ 0
~RESET
Text GLabel 6250 2550 0    35   Input ~ 0
~AS
Text GLabel 6250 2650 0    35   Input ~ 0
R~W
Text GLabel 6250 2450 0    35   Input ~ 0
~DS
$Comp
L power:GNDD #PWR032
U 1 1 6100841E
P 7500 5100
F 0 "#PWR032" H 7500 4850 50  0001 C CNN
F 1 "GNDD" H 7504 4945 50  0000 C CNN
F 2 "" H 7500 5100 50  0001 C CNN
F 3 "" H 7500 5100 50  0001 C CNN
	1    7500 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR022
U 1 1 61009623
P 2650 7500
F 0 "#PWR022" H 2650 7250 50  0001 C CNN
F 1 "GNDD" H 2654 7345 50  0000 C CNN
F 2 "" H 2650 7500 50  0001 C CNN
F 3 "" H 2650 7500 50  0001 C CNN
	1    2650 7500
	1    0    0    -1  
$EndComp
Text Label 6300 3350 0    50   ~ 0
A1
Text Label 6300 3450 0    50   ~ 0
A2
Text Label 6300 3550 0    50   ~ 0
A3
Text Label 6300 3650 0    50   ~ 0
A4
Wire Wire Line
	5750 2350 6400 2350
Text GLabel 6250 2750 0    35   Input ~ 0
~FPUCS
$Comp
L Device:C C?
U 1 1 610C1884
P 5650 6050
AR Path="/83909542/610C1884" Ref="C?"  Part="1" 
AR Path="/814D61C4/610C1884" Ref="C17"  Part="1" 
F 0 "C17" H 5675 6150 50  0000 L CNN
F 1 "0.1u" H 5675 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5688 5900 30  0001 C CNN
F 3 "" H 5650 6050 60  0000 C CNN
	1    5650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5700 5650 5800
Wire Wire Line
	5650 6200 5650 6300
$Comp
L Device:C C?
U 1 1 610C1898
P 5900 6050
AR Path="/83909542/610C1898" Ref="C?"  Part="1" 
AR Path="/814D61C4/610C1898" Ref="C18"  Part="1" 
F 0 "C18" H 5925 6150 50  0000 L CNN
F 1 "0.1u" H 5925 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5938 5900 30  0001 C CNN
F 3 "" H 5900 6050 60  0000 C CNN
	1    5900 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 610C189E
P 6150 6050
AR Path="/83909542/610C189E" Ref="C?"  Part="1" 
AR Path="/814D61C4/610C189E" Ref="C19"  Part="1" 
F 0 "C19" H 6175 6150 50  0000 L CNN
F 1 "0.1u" H 6175 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6188 5900 30  0001 C CNN
F 3 "" H 6150 6050 60  0000 C CNN
	1    6150 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 610C18A4
P 6400 6050
AR Path="/83909542/610C18A4" Ref="C?"  Part="1" 
AR Path="/814D61C4/610C18A4" Ref="C20"  Part="1" 
F 0 "C20" H 6425 6150 50  0000 L CNN
F 1 "0.1u" H 6425 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6438 5900 30  0001 C CNN
F 3 "" H 6400 6050 60  0000 C CNN
	1    6400 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5800 5900 5800
Connection ~ 5650 5800
Wire Wire Line
	5650 5800 5650 5900
Connection ~ 5650 6300
Wire Wire Line
	5650 6300 5650 6400
Wire Wire Line
	5900 6200 5900 6300
Connection ~ 5900 6300
Wire Wire Line
	5900 6300 5650 6300
Wire Wire Line
	6150 6200 6150 6300
Connection ~ 6150 6300
Wire Wire Line
	6150 6300 5900 6300
Wire Wire Line
	6400 6200 6400 6300
Wire Wire Line
	6400 6300 6150 6300
Wire Wire Line
	6400 5800 6400 5900
Wire Wire Line
	6150 5900 6150 5800
Connection ~ 6150 5800
Wire Wire Line
	6150 5800 6400 5800
Wire Wire Line
	5900 5900 5900 5800
Connection ~ 5900 5800
Wire Wire Line
	5900 5800 6150 5800
$Comp
L power:GNDD #PWR025
U 1 1 610D8BF2
P 5650 6400
F 0 "#PWR025" H 5650 6150 50  0001 C CNN
F 1 "GNDD" H 5654 6245 50  0000 C CNN
F 2 "" H 5650 6400 50  0001 C CNN
F 3 "" H 5650 6400 50  0001 C CNN
	1    5650 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2250 5750 2350
Wire Wire Line
	5750 3250 5750 2350
Wire Wire Line
	5750 3250 6400 3250
Connection ~ 5750 2350
Wire Bus Line
	6100 7250 6500 7250
Text Label 6350 7250 2    39   ~ 0
D[0..31]
Text GLabel 6500 7250 2    39   BiDi ~ 0
D[0..31]
Wire Bus Line
	6100 7350 6500 7350
Text GLabel 6500 7350 2    39   Output ~ 0
A[0..31]
Text Label 6350 7350 2    39   ~ 0
A[0..31]
$Comp
L Device:C C?
U 1 1 61D5C315
P 6650 6050
AR Path="/83909542/61D5C315" Ref="C?"  Part="1" 
AR Path="/814D61C4/61D5C315" Ref="C21"  Part="1" 
F 0 "C21" H 6675 6150 50  0000 L CNN
F 1 "0.1u" H 6675 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6688 5900 30  0001 C CNN
F 3 "" H 6650 6050 60  0000 C CNN
	1    6650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 6200 6650 6300
Wire Wire Line
	6650 6300 6400 6300
Wire Wire Line
	6650 5800 6650 5900
Wire Wire Line
	6400 5800 6650 5800
Connection ~ 6400 5800
Connection ~ 6400 6300
$Comp
L power:GNDD #PWR036
U 1 1 6084874C
P 9350 3000
F 0 "#PWR036" H 9350 2750 50  0001 C CNN
F 1 "GNDD" H 9354 2845 50  0000 C CNN
F 2 "" H 9350 3000 50  0001 C CNN
F 3 "" H 9350 3000 50  0001 C CNN
	1    9350 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 605C81E5
P 5750 3550
F 0 "R4" H 5820 3596 50  0000 L CNN
F 1 "4.7K" H 5820 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5680 3550 50  0001 C CNN
F 3 "~" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3400 5750 3250
Connection ~ 5750 3250
Wire Wire Line
	6400 3850 5750 3850
Wire Wire Line
	5750 3700 5750 3850
Connection ~ 5750 3850
Wire Wire Line
	5750 3850 5500 3850
Text GLabel 5500 3850 0    35   Output ~ 0
~FPUSENSE
Wire Wire Line
	9400 5700 9300 5700
Wire Wire Line
	9400 5900 9300 5900
Wire Wire Line
	9400 5800 9300 5800
Text GLabel 9300 6200 0    35   Input ~ 0
~AVEC
Wire Wire Line
	8050 5000 8050 4900
Wire Wire Line
	7950 4900 7950 5000
Wire Wire Line
	7850 4900 7850 5000
Wire Wire Line
	7750 4900 7750 5000
Wire Wire Line
	7650 5000 7650 4900
Wire Wire Line
	7550 4900 7550 5000
Wire Wire Line
	7450 4900 7450 5000
Wire Wire Line
	7350 4900 7350 5000
Wire Wire Line
	7250 5000 7250 4900
Wire Wire Line
	7150 4900 7150 5000
Wire Wire Line
	7050 4900 7050 5000
Wire Wire Line
	6950 4900 6950 5000
Wire Wire Line
	9400 5600 9300 5600
Wire Wire Line
	9400 5500 9300 5500
Wire Wire Line
	9800 5500 9900 5500
Text GLabel 9300 5800 0    35   Input ~ 0
~DSACK0
Text GLabel 9300 5500 0    35   Input ~ 0
~BERR
Text GLabel 9300 5600 0    35   Input ~ 0
~HALT
$Comp
L Device:R_Pack08 RN?
U 1 1 61BD570F
P 9600 5900
AR Path="/847EF586/61BD570F" Ref="RN?"  Part="1" 
AR Path="/814D61C4/61BD570F" Ref="RN4"  Part="1" 
F 0 "RN4" H 9050 5850 50  0000 C CNN
F 1 "4.7K" H 9050 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_Cat16-8" V 10075 5900 50  0001 C CNN
F 3 "~" H 9600 5900 50  0001 C CNN
	1    9600 5900
	0    1    1    0   
$EndComp
Text GLabel 9300 5700 0    35   Input ~ 0
~DSACK1
$Comp
L Aslak:MC68882 U?
U 1 1 60BED807
P 7500 2900
AR Path="/60BED807" Ref="U?"  Part="1" 
AR Path="/814D61C4/60BED807" Ref="U5"  Part="1" 
F 0 "U5" H 8250 4550 50  0000 C CNN
F 1 "68882" H 6850 4550 50  0000 C CNN
F 2 "Package_LCC:PLCC-68_THT-Socket" H 8200 4550 50  0001 C CNN
F 3 "" H 8200 4550 50  0001 C CNN
	1    7500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 5300 9900 5500
Wire Wire Line
	9800 5600 9900 5600
Connection ~ 9900 5500
Wire Wire Line
	9800 5700 9900 5700
Wire Wire Line
	9900 5500 9900 5600
Connection ~ 9900 5600
Wire Wire Line
	9900 5600 9900 5700
Wire Wire Line
	9800 5800 9900 5800
Wire Wire Line
	9900 5800 9900 5700
Connection ~ 9900 5700
Wire Wire Line
	9900 5800 9900 5900
Wire Wire Line
	9900 6200 9800 6200
Connection ~ 9900 5800
Wire Wire Line
	9800 5900 9900 5900
Connection ~ 9900 5900
Wire Wire Line
	9900 5900 9900 6000
Wire Wire Line
	9800 6000 9900 6000
Connection ~ 9900 6000
Wire Wire Line
	9900 6000 9900 6100
Wire Wire Line
	9800 6100 9900 6100
Connection ~ 9900 6100
Wire Wire Line
	9900 6100 9900 6200
Wire Wire Line
	10650 750  10650 950 
Wire Wire Line
	9850 1800 9850 1900
Connection ~ 9850 1900
Wire Wire Line
	9850 1900 9850 2100
NoConn ~ 10550 2000
$Comp
L power:+5VD #PWR031
U 1 1 61691A04
P 7500 800
F 0 "#PWR031" H 7500 650 50  0001 C CNN
F 1 "+5VD" H 7515 973 50  0000 C CNN
F 2 "" H 7500 800 50  0001 C CNN
F 3 "" H 7500 800 50  0001 C CNN
	1    7500 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR033
U 1 1 61692C5B
P 9850 1800
F 0 "#PWR033" H 9850 1650 50  0001 C CNN
F 1 "+5VD" H 9865 1973 50  0000 C CNN
F 2 "" H 9850 1800 50  0001 C CNN
F 3 "" H 9850 1800 50  0001 C CNN
	1    9850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR037
U 1 1 61693338
P 10650 750
F 0 "#PWR037" H 10650 600 50  0001 C CNN
F 1 "+5VD" H 10665 923 50  0000 C CNN
F 2 "" H 10650 750 50  0001 C CNN
F 3 "" H 10650 750 50  0001 C CNN
	1    10650 750 
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR035
U 1 1 6169577F
P 9350 1800
F 0 "#PWR035" H 9350 1650 50  0001 C CNN
F 1 "+5VD" H 9365 1973 50  0000 C CNN
F 2 "" H 9350 1800 50  0001 C CNN
F 3 "" H 9350 1800 50  0001 C CNN
	1    9350 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 900  7900 900 
Wire Wire Line
	7900 900  7900 1000
Connection ~ 7800 900 
$Comp
L power:+5VD #PWR026
U 1 1 60DA498B
P 5750 2250
F 0 "#PWR026" H 5750 2100 50  0001 C CNN
F 1 "+5VD" H 5765 2423 50  0000 C CNN
F 2 "" H 5750 2250 50  0001 C CNN
F 3 "" H 5750 2250 50  0001 C CNN
	1    5750 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR034
U 1 1 60DA9F0F
P 9900 5300
F 0 "#PWR034" H 9900 5150 50  0001 C CNN
F 1 "+5VD" H 9915 5473 50  0000 C CNN
F 2 "" H 9900 5300 50  0001 C CNN
F 3 "" H 9900 5300 50  0001 C CNN
	1    9900 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR024
U 1 1 60E2A7E6
P 5650 5700
F 0 "#PWR024" H 5650 5550 50  0001 C CNN
F 1 "+5VD" H 5665 5873 50  0000 C CNN
F 2 "" H 5650 5700 50  0001 C CNN
F 3 "" H 5650 5700 50  0001 C CNN
	1    5650 5700
	1    0    0    -1  
$EndComp
$Comp
L Aslak:MC68030RC U?
U 1 1 60E4B6FD
P 2800 3950
AR Path="/60E4B6FD" Ref="U?"  Part="1" 
AR Path="/814D61C4/60E4B6FD" Ref="U4"  Part="1" 
F 0 "U4" H 2850 6882 70  0000 C CNN
F 1 "MC68030RC" H 3900 6750 70  0000 C CNN
F 2 "kiss68030:PGA128" H 2800 3950 60  0001 C CNN
F 3 "" H 2800 3950 60  0000 C CNN
	1    2800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3400 9850 3400
Wire Wire Line
	9850 3400 9850 3200
Connection ~ 9850 2100
Wire Wire Line
	9950 2550 9850 2550
Connection ~ 9850 2550
Wire Wire Line
	9850 2550 9850 2100
Wire Wire Line
	9950 2750 9850 2750
Connection ~ 9850 2750
Wire Wire Line
	9850 2750 9850 2550
Wire Wire Line
	2650 7400 2950 7400
Wire Wire Line
	3150 7400 3250 7400
Wire Wire Line
	3250 7400 3250 7300
Connection ~ 3150 7400
Wire Wire Line
	3250 7400 3350 7400
Wire Wire Line
	3350 7400 3350 7300
Connection ~ 3250 7400
Wire Wire Line
	3350 7400 3450 7400
Wire Wire Line
	3450 7400 3450 7300
Connection ~ 3350 7400
Text GLabel 4700 5900 2    35   Input ~ 0
~CDIS
Text GLabel 4700 6000 2    35   Input ~ 0
~MMUDIS
Wire Wire Line
	4700 5900 4500 5900
Wire Wire Line
	4500 6000 4700 6000
Wire Wire Line
	1000 6400 800  6400
Text GLabel 800  6400 0    35   Input ~ 0
~STERM
$Comp
L power:+5VD #PWR023
U 1 1 61914044
P 2750 700
F 0 "#PWR023" H 2750 550 50  0001 C CNN
F 1 "+5VD" H 2765 873 50  0000 C CNN
F 2 "" H 2750 700 50  0001 C CNN
F 3 "" H 2750 700 50  0001 C CNN
	1    2750 700 
	1    0    0    -1  
$EndComp
Text GLabel 4700 6400 2    35   Output ~ 0
~CBREQ
Text GLabel 4700 6500 2    35   Input ~ 0
~CBACK
Wire Wire Line
	4700 6400 4500 6400
Wire Wire Line
	4500 6500 4700 6500
Text GLabel 4700 6200 2    35   Input ~ 0
~CIIN
Wire Wire Line
	4500 6200 4700 6200
Wire Wire Line
	1000 5700 800  5700
Text GLabel 800  5700 0    35   Output ~ 0
~RMC
Wire Wire Line
	4500 4900 4700 4900
Wire Wire Line
	4500 4800 4700 4800
Wire Wire Line
	4500 4700 4700 4700
Text GLabel 4700 4900 2    35   Input ~ 0
~BGACK
Text GLabel 4700 4800 2    35   Output ~ 0
~BG
Text GLabel 4700 4700 2    35   Input ~ 0
~BR
Wire Wire Line
	9400 6200 9300 6200
Wire Wire Line
	9400 6100 9300 6100
Text GLabel 9300 6000 0    35   Input ~ 0
~IPL2
Wire Wire Line
	9400 6000 9300 6000
Text GLabel 9300 5900 0    35   Input ~ 0
~IPL0
Text GLabel 9300 6100 0    35   Input ~ 0
~IPL1
Text GLabel 10350 4400 2    39   Output ~ 0
MPUCLK
$Comp
L power:+5VD #PWR?
U 1 1 61DB2677
P 9950 3850
AR Path="/7DF01BC3/61DB2677" Ref="#PWR?"  Part="1" 
AR Path="/814D61C4/61DB2677" Ref="#PWR0178"  Part="1" 
F 0 "#PWR0178" H 9950 3700 50  0001 C CNN
F 1 "+5VD" H 9950 3990 50  0000 C CNN
F 2 "" H 9950 3850 60  0000 C CNN
F 3 "" H 9950 3850 60  0000 C CNN
	1    9950 3850
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:SG-210SED X?
U 1 1 61DB267D
P 9950 4400
AR Path="/7DF01BC3/61DB267D" Ref="X?"  Part="1" 
AR Path="/814D61C4/61DB267D" Ref="X1"  Part="1" 
F 0 "X1" H 10050 4650 50  0000 L CNN
F 1 "MPUOSC" H 9550 4150 50  0000 L CNN
F 2 "Oscillator:Oscillator_SMD_SeikoEpson_SG8002LB-4Pin_5.0x3.2mm" H 10400 4050 50  0001 C CNN
F 3 "https://support.epson.biz/td/api/doc_check.php?mode=dl&lang=en&Parts=SG-210SED" H 9850 4400 50  0001 C CNN
	1    9950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4400 10300 4400
Wire Wire Line
	9950 4700 9950 4850
Wire Wire Line
	9950 3850 9950 4000
Wire Wire Line
	9650 4400 9550 4400
Wire Wire Line
	9550 4400 9550 4000
Wire Wire Line
	9550 4000 9950 4000
Connection ~ 9950 4000
Wire Wire Line
	9950 4000 9950 4100
$Comp
L power:GNDD #PWR?
U 1 1 61DB268B
P 9950 4850
AR Path="/7DF01BC3/61DB268B" Ref="#PWR?"  Part="1" 
AR Path="/814D61C4/61DB268B" Ref="#PWR0179"  Part="1" 
F 0 "#PWR0179" H 9950 4600 50  0001 C CNN
F 1 "GNDD" H 9954 4695 50  0000 C CNN
F 2 "" H 9950 4850 50  0001 C CNN
F 3 "" H 9950 4850 50  0001 C CNN
	1    9950 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6200 10850 6200
Wire Wire Line
	10850 6000 10950 6000
Wire Wire Line
	10950 6000 10950 6100
Wire Wire Line
	10850 6100 10950 6100
Connection ~ 10950 6100
Wire Wire Line
	10950 6100 10950 6200
$Comp
L power:+5VD #PWR02
U 1 1 62087200
P 10950 5850
F 0 "#PWR02" H 10950 5700 50  0001 C CNN
F 1 "+5VD" H 10965 6023 50  0000 C CNN
F 2 "" H 10950 5850 50  0001 C CNN
F 3 "" H 10950 5850 50  0001 C CNN
	1    10950 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 6200 10400 6200
Text GLabel 10400 6200 0    35   Input ~ 0
~STERM
Text GLabel 10400 6100 0    35   Input ~ 0
~CBACK
Wire Wire Line
	10400 6100 10550 6100
Text GLabel 10400 6000 0    35   Input ~ 0
~CIIN
Wire Wire Line
	10400 6000 10550 6000
Wire Wire Line
	10950 5850 10950 6000
Connection ~ 10950 6000
$Comp
L Device:R R8
U 1 1 61DA266D
P 10700 6000
F 0 "R8" V 10650 6100 50  0000 L CNN
F 1 "4.7K" V 10700 5900 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10630 6000 50  0001 C CNN
F 3 "~" H 10700 6000 50  0001 C CNN
	1    10700 6000
	0    1    1    0   
$EndComp
$Comp
L Device:R R28
U 1 1 61DC72BA
P 10700 6100
F 0 "R28" V 10650 6200 50  0000 L CNN
F 1 "4.7K" V 10700 6000 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10630 6100 50  0001 C CNN
F 3 "~" H 10700 6100 50  0001 C CNN
	1    10700 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R R29
U 1 1 61DC74BD
P 10700 6200
F 0 "R29" V 10650 6300 50  0000 L CNN
F 1 "4.7K" V 10700 6100 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10630 6200 50  0001 C CNN
F 3 "~" H 10700 6200 50  0001 C CNN
	1    10700 6200
	0    1    1    0   
$EndComp
NoConn ~ 1000 6000
NoConn ~ 4500 5800
NoConn ~ 4500 5700
NoConn ~ 4500 6300
Text GLabel 6250 2050 0    35   Input ~ 0
MPUCLK
NoConn ~ 10550 2650
NoConn ~ 10550 3300
Wire Wire Line
	9850 3200 9950 3200
Connection ~ 9850 3200
Wire Wire Line
	9850 3200 9850 2750
$Comp
L Device:C C?
U 1 1 61FF0611
P 6900 6050
AR Path="/83909542/61FF0611" Ref="C?"  Part="1" 
AR Path="/814D61C4/61FF0611" Ref="C72"  Part="1" 
F 0 "C72" H 6925 6150 50  0000 L CNN
F 1 "0.1u" H 6925 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6938 5900 30  0001 C CNN
F 3 "" H 6900 6050 60  0000 C CNN
	1    6900 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 6200 6900 6300
Wire Wire Line
	6900 6300 6650 6300
Wire Wire Line
	6900 5800 6900 5900
Wire Wire Line
	6650 5800 6900 5800
$Comp
L Device:C C?
U 1 1 61FF061F
P 7150 6050
AR Path="/83909542/61FF061F" Ref="C?"  Part="1" 
AR Path="/814D61C4/61FF061F" Ref="C73"  Part="1" 
F 0 "C73" H 7175 6150 50  0000 L CNN
F 1 "0.1u" H 7175 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7188 5900 30  0001 C CNN
F 3 "" H 7150 6050 60  0000 C CNN
	1    7150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6200 7150 6300
Wire Wire Line
	7150 6300 6900 6300
Wire Wire Line
	7150 5800 7150 5900
Wire Wire Line
	6900 5800 7150 5800
Connection ~ 6900 5800
Connection ~ 6900 6300
Connection ~ 6650 5800
Connection ~ 6650 6300
$Comp
L Device:C C?
U 1 1 6206EBC3
P 7400 6050
AR Path="/83909542/6206EBC3" Ref="C?"  Part="1" 
AR Path="/814D61C4/6206EBC3" Ref="C74"  Part="1" 
F 0 "C74" H 7425 6150 50  0000 L CNN
F 1 "0.1u" H 7425 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7438 5900 30  0001 C CNN
F 3 "" H 7400 6050 60  0000 C CNN
	1    7400 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 6200 7400 6300
Wire Wire Line
	7400 6300 7150 6300
Wire Wire Line
	7400 5800 7400 5900
Wire Wire Line
	7150 5800 7400 5800
$Comp
L Device:C C?
U 1 1 6206EBD1
P 7650 6050
AR Path="/83909542/6206EBD1" Ref="C?"  Part="1" 
AR Path="/814D61C4/6206EBD1" Ref="C75"  Part="1" 
F 0 "C75" H 7675 6150 50  0000 L CNN
F 1 "0.1u" H 7675 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7688 5900 30  0001 C CNN
F 3 "" H 7650 6050 60  0000 C CNN
	1    7650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 6200 7650 6300
Wire Wire Line
	7650 6300 7400 6300
Wire Wire Line
	7650 5800 7650 5900
Wire Wire Line
	7400 5800 7650 5800
Connection ~ 7400 5800
Connection ~ 7400 6300
Connection ~ 7150 5800
Connection ~ 7150 6300
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 6055A8F5
P 5600 4450
F 0 "J3" H 5680 4492 50  0000 L CNN
F 1 "Conn_01x03" H 5350 4250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5600 4450 50  0001 C CNN
F 3 "~" H 5600 4450 50  0001 C CNN
	1    5600 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 617AB6ED
P 6500 4450
F 0 "J4" H 6580 4492 50  0000 L CNN
F 1 "Conn_01x03" H 6250 4250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6500 4450 50  0001 C CNN
F 3 "~" H 6500 4450 50  0001 C CNN
	1    6500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4350 5300 4350
Wire Wire Line
	5300 4350 5300 4250
Wire Wire Line
	5400 4550 5300 4550
Wire Wire Line
	5300 4550 5300 4650
Wire Wire Line
	6300 4350 6200 4350
Wire Wire Line
	6200 4350 6200 4250
Wire Wire Line
	6300 4550 6200 4550
Wire Wire Line
	6200 4550 6200 4650
$Comp
L power:GNDD #PWR028
U 1 1 6181823F
P 5300 4650
F 0 "#PWR028" H 5300 4400 50  0001 C CNN
F 1 "GNDD" H 5304 4495 50  0000 C CNN
F 2 "" H 5300 4650 50  0001 C CNN
F 3 "" H 5300 4650 50  0001 C CNN
	1    5300 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR030
U 1 1 61818975
P 6200 4650
F 0 "#PWR030" H 6200 4400 50  0001 C CNN
F 1 "GNDD" H 6204 4495 50  0000 C CNN
F 2 "" H 6200 4650 50  0001 C CNN
F 3 "" H 6200 4650 50  0001 C CNN
	1    6200 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR029
U 1 1 61818F16
P 6200 4250
F 0 "#PWR029" H 6200 4100 50  0001 C CNN
F 1 "+5VD" H 6215 4423 50  0000 C CNN
F 2 "" H 6200 4250 50  0001 C CNN
F 3 "" H 6200 4250 50  0001 C CNN
	1    6200 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR027
U 1 1 61819670
P 5300 4250
F 0 "#PWR027" H 5300 4100 50  0001 C CNN
F 1 "+5VD" H 5315 4423 50  0000 C CNN
F 2 "" H 5300 4250 50  0001 C CNN
F 3 "" H 5300 4250 50  0001 C CNN
	1    5300 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4450 5300 4450
Wire Wire Line
	6300 4450 6200 4450
Text GLabel 5300 4450 0    35   Output ~ 0
~MMUDIS
Text GLabel 6200 4450 0    35   Output ~ 0
~CDIS
$Comp
L Device:C C?
U 1 1 62195315
P 7900 6050
AR Path="/83909542/62195315" Ref="C?"  Part="1" 
AR Path="/814D61C4/62195315" Ref="C76"  Part="1" 
F 0 "C76" H 7925 6150 50  0000 L CNN
F 1 "0.1u" H 7925 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7938 5900 30  0001 C CNN
F 3 "" H 7900 6050 60  0000 C CNN
	1    7900 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 6200 7900 6300
Wire Wire Line
	7900 6300 7650 6300
Wire Wire Line
	7900 5800 7900 5900
Wire Wire Line
	7650 5800 7900 5800
$Comp
L Device:C C?
U 1 1 62195323
P 8150 6050
AR Path="/83909542/62195323" Ref="C?"  Part="1" 
AR Path="/814D61C4/62195323" Ref="C77"  Part="1" 
F 0 "C77" H 8175 6150 50  0000 L CNN
F 1 "0.1u" H 8175 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8188 5900 30  0001 C CNN
F 3 "" H 8150 6050 60  0000 C CNN
	1    8150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 6200 8150 6300
Wire Wire Line
	8150 6300 7900 6300
Wire Wire Line
	8150 5800 8150 5900
Wire Wire Line
	7900 5800 8150 5800
Connection ~ 7900 5800
Connection ~ 7900 6300
Connection ~ 7650 5800
Connection ~ 7650 6300
NoConn ~ 1000 5400
NoConn ~ 1000 5500
$Comp
L Connector:TestPoint_Probe TP4
U 1 1 6184CD99
P 10300 4400
F 0 "TP4" H 10452 4501 50  0001 L CNN
F 1 "MPUCLK" H 10250 4600 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10500 4400 50  0001 C CNN
F 3 "~" H 10500 4400 50  0001 C CNN
	1    10300 4400
	1    0    0    -1  
$EndComp
Connection ~ 10300 4400
Wire Wire Line
	10300 4400 10350 4400
$Comp
L Connector:TestPoint_Probe TP5
U 1 1 6189808A
P 10750 1350
F 0 "TP5" H 10902 1451 50  0001 L CNN
F 1 "~RESET" H 10850 1550 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10950 1350 50  0001 C CNN
F 3 "~" H 10950 1350 50  0001 C CNN
	1    10750 1350
	1    0    0    -1  
$EndComp
Connection ~ 10750 1350
Wire Wire Line
	10750 1350 10850 1350
$Comp
L Device:C C?
U 1 1 61E76AA4
P 8400 6050
AR Path="/83909542/61E76AA4" Ref="C?"  Part="1" 
AR Path="/814D61C4/61E76AA4" Ref="C81"  Part="1" 
F 0 "C81" H 8425 6150 50  0000 L CNN
F 1 "0.1u" H 8425 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8438 5900 30  0001 C CNN
F 3 "" H 8400 6050 60  0000 C CNN
	1    8400 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 6200 8400 6300
Wire Wire Line
	8400 6300 8150 6300
Wire Wire Line
	8400 5800 8400 5900
Wire Wire Line
	8150 5800 8400 5800
Connection ~ 8150 5800
Connection ~ 8150 6300
$Comp
L Device:C C?
U 1 1 61E9F121
P 8650 6050
AR Path="/83909542/61E9F121" Ref="C?"  Part="1" 
AR Path="/814D61C4/61E9F121" Ref="C82"  Part="1" 
F 0 "C82" H 8675 6150 50  0000 L CNN
F 1 "0.1u" H 8675 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8688 5900 30  0001 C CNN
F 3 "" H 8650 6050 60  0000 C CNN
	1    8650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 6200 8650 6300
Wire Wire Line
	8650 6300 8400 6300
Wire Wire Line
	8650 5800 8650 5900
Wire Wire Line
	8400 5800 8650 5800
Connection ~ 8400 5800
Connection ~ 8400 6300
Wire Wire Line
	10950 6400 10850 6400
Wire Wire Line
	10950 6200 10950 6300
Wire Wire Line
	10850 6300 10950 6300
Connection ~ 10950 6300
Wire Wire Line
	10950 6300 10950 6400
Wire Wire Line
	10550 6400 10400 6400
Text GLabel 10400 6400 0    35   Input ~ 0
~BGACK
Text GLabel 10400 6300 0    35   Input ~ 0
~BR
Wire Wire Line
	10400 6300 10550 6300
$Comp
L Device:R R35
U 1 1 61ECDE0B
P 10700 6300
F 0 "R35" V 10650 6400 50  0000 L CNN
F 1 "4.7K" V 10700 6200 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10630 6300 50  0001 C CNN
F 3 "~" H 10700 6300 50  0001 C CNN
	1    10700 6300
	0    1    1    0   
$EndComp
$Comp
L Device:R R36
U 1 1 61ECDE15
P 10700 6400
F 0 "R36" V 10650 6500 50  0000 L CNN
F 1 "4.7K" V 10700 6300 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10630 6400 50  0001 C CNN
F 3 "~" H 10700 6400 50  0001 C CNN
	1    10700 6400
	0    1    1    0   
$EndComp
Connection ~ 10950 6200
Wire Bus Line
	6150 3350 6150 3750
Wire Bus Line
	8900 1400 8900 4600
Wire Bus Line
	4800 1400 4800 4600
Wire Bus Line
	700  1400 700  4600
$EndSCHEMATC
