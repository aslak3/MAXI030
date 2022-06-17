EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 14
Title "MAXI030 - 68030 based expandable computer"
Date "2021-10-02"
Rev ""
Comp ""
Comment1 "Lawrence Manning"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1650 6100 0    39   Output ~ 0
~SIMMWE
Text GLabel 1650 6200 0    39   Output ~ 0
~SIMM
Text GLabel 8450 5800 2    39   Output ~ 0
SYSCLEAR
Text GLabel 1650 5600 0    39   Output ~ 0
LED
Text GLabel 1650 5900 0    39   Output ~ 0
~IDE3CS
Text GLabel 1650 6000 0    39   Output ~ 0
~IDE1CS
Text GLabel 1650 4400 0    39   Output ~ 0
~QUART
Text GLabel 1650 5500 0    39   Output ~ 0
~LROM
Text GLabel 1650 4700 0    39   Output ~ 0
~UROM
Text GLabel 7800 4000 2    39   Output ~ 0
~READ
Text GLabel 1650 4600 0    39   Output ~ 0
~IDECS
NoConn ~ 19550 22950
Text GLabel 7800 4100 2    39   Output ~ 0
~WRITE
Wire Wire Line
	8150 5800 8450 5800
Wire Wire Line
	8150 5000 8150 5250
Wire Wire Line
	8150 5550 8150 5800
$Comp
L Device:R R1
U 1 1 7367C3D3
P 8150 5400
F 0 "R1" V 8200 5150 50  0000 L CNN
F 1 "4.7K" V 8150 5300 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8080 5400 50  0001 C CNN
F 3 "~" H 8150 5400 50  0001 C CNN
	1    8150 5400
	1    0    0    -1  
$EndComp
Text GLabel 9100 1750 0    39   Input ~ 0
BUZZER
$Comp
L Device:R R2
U 1 1 816502F3
P 9750 1750
F 0 "R2" V 9830 1750 50  0000 C CNN
F 1 "1K" V 9650 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9680 1750 30  0001 C CNN
F 3 "" H 9750 1750 30  0000 C CNN
	1    9750 1750
	0    1    1    0   
$EndComp
Text GLabel 9050 2450 0    39   Input ~ 0
LED
$Comp
L Device:LED D1
U 1 1 8165030C
P 9350 2450
F 0 "D1" H 9350 2550 50  0000 C CNN
F 1 "CORELED" H 9350 2350 50  0000 C CNN
F 2 "LED_SMD:LED_1210_3225Metric" H 9350 2450 60  0001 C CNN
F 3 "" H 9350 2450 60  0000 C CNN
	1    9350 2450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9100 1750 9300 1750
Wire Wire Line
	9400 1850 9400 1750
Wire Wire Line
	9400 1750 9600 1750
Wire Wire Line
	9300 1750 9300 1850
Wire Wire Line
	9900 1750 10000 1750
Wire Wire Line
	10000 1750 10000 1850
Wire Wire Line
	9950 2450 10050 2450
Wire Wire Line
	10050 2450 10050 2550
Wire Wire Line
	9050 2450 9200 2450
Wire Wire Line
	9500 2450 9650 2450
$Comp
L Device:Speaker SP1
U 1 1 81650335
P 9400 2050
F 0 "SP1" H 9300 2300 50  0000 C CNN
F 1 "BUZZER" V 9600 2000 50  0000 C CNN
F 2 "Buzzer_Beeper:Buzzer_15x7.5RM7.6" H 9400 2050 60  0001 C CNN
F 3 "" H 9400 2050 60  0000 C CNN
	1    9400 2050
	0    1    1    0   
$EndComp
Text GLabel 7800 3600 2    39   BiDi ~ 0
SCL
Text GLabel 7800 3500 2    39   BiDi ~ 0
SDA
Text GLabel 1650 4100 0    39   BiDi ~ 0
PS2BDATA
Text GLabel 1650 3900 0    39   BiDi ~ 0
PS2ACLK
Text GLabel 1650 4000 0    39   BiDi ~ 0
PS2ADATA
Wire Wire Line
	3950 4650 4050 4650
Wire Wire Line
	3950 4550 4050 4550
Wire Wire Line
	3950 4450 4050 4450
Wire Wire Line
	3950 4350 4050 4350
Text GLabel 1650 4300 0    39   Input ~ 0
~QUARTIRQ
Text GLabel 1650 5700 0    39   Output ~ 0
BUZZER
Text GLabel 7800 4200 2    39   Output ~ 0
~UCSE0
Text GLabel 7800 5700 2    39   Input ~ 0
~INTE0
Text GLabel 7800 6000 2    39   Input ~ 0
~BERRE
Text GLabel 7800 4300 2    39   Output ~ 0
~LCSE0
Text GLabel 7800 3300 2    39   Output ~ 0
~FPUCS
Text GLabel 7800 5600 2    39   Input ~ 0
~INTE1
Text GLabel 7800 5500 2    39   Input ~ 0
~INTE2
Text GLabel 7800 5400 2    39   Input ~ 0
~INTE3
Text GLabel 7800 4400 2    39   Output ~ 0
~UCSE1
Text GLabel 7800 4600 2    39   Output ~ 0
~UCSE2
Text GLabel 7800 4800 2    39   Output ~ 0
~UCSE3
Text GLabel 7800 4500 2    39   Output ~ 0
~LCSE1
Text GLabel 7800 4700 2    39   Output ~ 0
~LCSE2
Text GLabel 7800 4900 2    39   Output ~ 0
~LCSE3
Wire Bus Line
	9100 5200 9500 5200
Text Label 9350 5200 2    39   ~ 0
D[0..31]
Text GLabel 9500 5200 2    39   BiDi ~ 0
D[0..31]
Wire Bus Line
	9100 5300 9500 5300
Text GLabel 9500 5300 2    39   Input ~ 0
A[0..31]
Text Label 9350 5300 2    39   ~ 0
A[0..31]
$Comp
L power:GNDD #PWR09
U 1 1 61D8E3B3
P 10050 2550
F 0 "#PWR09" H 10050 2300 50  0001 C CNN
F 1 "GNDD" H 10054 2395 50  0000 C CNN
F 2 "" H 10050 2550 50  0001 C CNN
F 3 "" H 10050 2550 50  0001 C CNN
	1    10050 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR08
U 1 1 61E36011
P 10000 1850
F 0 "#PWR08" H 10000 1600 50  0001 C CNN
F 1 "GNDD" H 10004 1695 50  0000 C CNN
F 2 "" H 10000 1850 50  0001 C CNN
F 3 "" H 10000 1850 50  0001 C CNN
	1    10000 1850
	1    0    0    -1  
$EndComp
Text GLabel 7800 3800 2    39   Output ~ 0
~UEXP
Text GLabel 1650 5800 0    39   Input ~ 0
IDEIRQ
Text GLabel 7800 5900 2    39   Input ~ 0
~WAITE
Text GLabel 7800 3900 2    39   Input ~ 0
RTCSQWAVE
$Comp
L power:+5VD #PWR?
U 1 1 6430FB59
P 8150 5000
AR Path="/6430FB59" Ref="#PWR?"  Part="1" 
AR Path="/7DF01BC3/6430FB59" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 8150 4850 50  0001 C CNN
F 1 "+5VD" H 8150 5140 50  0000 C CNN
F 2 "" H 8150 5000 60  0000 C CNN
F 3 "" H 8150 5000 60  0000 C CNN
	1    8150 5000
	1    0    0    -1  
$EndComp
Text GLabel 7800 3700 2    39   Output ~ 0
~LEXP
$Comp
L Device:R R3
U 1 1 60DE74C7
P 9800 2450
F 0 "R3" V 9880 2450 50  0000 C CNN
F 1 "1K" V 9700 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9730 2450 30  0001 C CNN
F 3 "" H 9800 2450 30  0000 C CNN
	1    9800 2450
	0    1    1    0   
$EndComp
Text Label 5300 6200 0    50   ~ 0
A7
Text Label 5300 6100 0    50   ~ 0
A8
Text Label 5300 6000 0    50   ~ 0
A9
Wire Wire Line
	4150 4750 3950 4750
Wire Wire Line
	4150 4850 3950 4850
Wire Wire Line
	4150 4950 3950 4950
Wire Wire Line
	4150 5050 3950 5050
Wire Wire Line
	4150 5150 3950 5150
Wire Wire Line
	4150 5250 3950 5250
Wire Wire Line
	4150 5350 3950 5350
Wire Wire Line
	4150 5450 3950 5450
Wire Wire Line
	4150 2350 3950 2350
Wire Wire Line
	4150 2450 3950 2450
Wire Wire Line
	4150 2550 3950 2550
Wire Wire Line
	4150 2650 3950 2650
Wire Wire Line
	4150 2750 3950 2750
Wire Wire Line
	4150 2850 3950 2850
Wire Wire Line
	4150 2950 3950 2950
Wire Wire Line
	4150 3050 3950 3050
Wire Wire Line
	5250 1500 5450 1500
Wire Wire Line
	5250 1600 5450 1600
Wire Wire Line
	5250 1700 5450 1700
Wire Wire Line
	5250 1800 5450 1800
Wire Wire Line
	5250 1900 5450 1900
Wire Wire Line
	5250 2000 5450 2000
Wire Wire Line
	5250 2100 5450 2100
Wire Wire Line
	5250 2200 5450 2200
Wire Wire Line
	4150 1550 3950 1550
Wire Wire Line
	4150 1650 3950 1650
Wire Wire Line
	4150 1750 3950 1750
Wire Wire Line
	4150 1850 3950 1850
Wire Wire Line
	4150 1950 3950 1950
Wire Wire Line
	4150 2050 3950 2050
Wire Wire Line
	4150 2150 3950 2150
Wire Wire Line
	4150 2250 3950 2250
Text Label 4150 4750 2    50   ~ 0
D0
Text Label 4150 4850 2    50   ~ 0
D1
Text Label 4150 4950 2    50   ~ 0
D2
Text Label 4150 5050 2    50   ~ 0
D3
Text Label 4150 5150 2    50   ~ 0
D4
Text Label 4150 5250 2    50   ~ 0
D5
Text Label 4150 5350 2    50   ~ 0
D6
Text Label 4150 5450 2    50   ~ 0
D7
Text Label 4150 2350 2    50   ~ 0
D8
Text Label 4150 2450 2    50   ~ 0
D9
Text Label 4150 2550 2    50   ~ 0
D10
Text Label 4150 2650 2    50   ~ 0
D11
Text Label 4150 2750 2    50   ~ 0
D12
Text Label 4150 2850 2    50   ~ 0
D13
Text Label 4150 2950 2    50   ~ 0
D14
Text Label 4150 3050 2    50   ~ 0
D15
Text Label 5250 1500 0    50   ~ 0
D16
Text Label 5250 1600 0    50   ~ 0
D17
Text Label 5250 1700 0    50   ~ 0
D18
Text Label 5250 1800 0    50   ~ 0
D19
Text Label 5250 1900 0    50   ~ 0
D20
Text Label 5250 2000 0    50   ~ 0
D21
Text Label 5250 2100 0    50   ~ 0
D22
Text Label 5250 2200 0    50   ~ 0
D23
Text Label 4150 1550 2    50   ~ 0
D24
Text Label 4150 1650 2    50   ~ 0
D25
Text Label 4150 1750 2    50   ~ 0
D26
Text Label 4150 1850 2    50   ~ 0
D27
Text Label 4150 1950 2    50   ~ 0
D28
Text Label 4150 2050 2    50   ~ 0
D29
Text Label 4150 2150 2    50   ~ 0
D30
Text Label 4150 2250 2    50   ~ 0
D31
Wire Wire Line
	3950 4250 4050 4250
Wire Wire Line
	3950 4150 4050 4150
Wire Wire Line
	3950 4050 4050 4050
Wire Wire Line
	3950 3950 4050 3950
$Comp
L Device:R_Pack08 RN1
U 1 1 61E62C2C
P 4250 4250
AR Path="/7DF01BC3/61E62C2C" Ref="RN1"  Part="1" 
AR Path="/82769150/61E62C2C" Ref="RN?"  Part="1" 
F 0 "RN1" V 3750 4250 50  0000 C CNN
F 1 "33" V 3750 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_Cat16-8" V 4725 4250 50  0001 C CNN
F 3 "~" H 4250 4250 50  0001 C CNN
	1    4250 4250
	0    1    -1   0   
$EndComp
Wire Wire Line
	4450 4650 4650 4650
Wire Wire Line
	4450 4550 4650 4550
Wire Wire Line
	4450 4450 4650 4450
Wire Wire Line
	4450 4350 4650 4350
Wire Wire Line
	4450 4250 4650 4250
$Comp
L Device:R_Pack08 RN2
U 1 1 62064DFC
P 4250 3450
AR Path="/7DF01BC3/62064DFC" Ref="RN2"  Part="1" 
AR Path="/82769150/62064DFC" Ref="RN?"  Part="1" 
F 0 "RN2" V 4650 3450 50  0000 C CNN
F 1 "33" V 4650 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_Cat16-8" V 4725 3450 50  0001 C CNN
F 3 "~" H 4250 3450 50  0001 C CNN
	1    4250 3450
	0    1    -1   0   
$EndComp
Wire Wire Line
	3950 6250 4050 6250
Wire Wire Line
	3950 6150 4050 6150
Wire Wire Line
	3950 6050 4050 6050
Wire Wire Line
	3950 5950 4050 5950
Wire Wire Line
	3950 5850 4050 5850
Wire Wire Line
	3950 5750 4050 5750
Wire Wire Line
	3950 5650 4050 5650
Wire Wire Line
	3950 5550 4050 5550
Wire Wire Line
	4450 6250 4650 6250
Wire Wire Line
	4450 6150 4650 6150
Wire Wire Line
	4450 5950 4650 5950
Wire Wire Line
	4450 5850 4650 5850
Wire Wire Line
	4450 5750 4650 5750
Wire Wire Line
	4450 5550 4650 5550
Text Label 4500 6250 0    50   ~ 0
SA0
Text Label 4500 6150 0    50   ~ 0
SA1
Text Label 4500 6050 0    50   ~ 0
SA2
Text Label 4500 5950 0    50   ~ 0
SA3
Text Label 4500 5850 0    50   ~ 0
SA4
Text Label 4500 5750 0    50   ~ 0
SA5
Text Label 4500 5650 0    50   ~ 0
SA6
Text Label 4500 5550 0    50   ~ 0
SA10
Text GLabel 9500 5400 2    39   Output ~ 0
SA[0..11]
Wire Wire Line
	4450 5650 4650 5650
Wire Wire Line
	4450 6050 4650 6050
$Comp
L Device:R_Pack08 RN3
U 1 1 6206C8CD
P 4250 5850
AR Path="/7DF01BC3/6206C8CD" Ref="RN3"  Part="1" 
AR Path="/82769150/6206C8CD" Ref="RN?"  Part="1" 
F 0 "RN3" V 4150 6550 50  0000 C CNN
F 1 "33" V 4250 6550 50  0000 C CNN
F 2 "Resistor_SMD:R_Cat16-8" V 4725 5850 50  0001 C CNN
F 3 "~" H 4250 5850 50  0001 C CNN
	1    4250 5850
	0    1    -1   0   
$EndComp
Text Label 9100 5400 0    39   ~ 0
SA[0..11]
Wire Bus Line
	9500 5400 9100 5400
Text GLabel 7800 3400 2    35   Input ~ 0
~FPUSENSE
Text GLabel 5250 2300 0    39   Input ~ 0
FC0
Text GLabel 5250 2400 0    39   Input ~ 0
FC1
Text GLabel 5250 2500 0    39   Input ~ 0
FC2
Text GLabel 5250 2600 0    39   Input ~ 0
SIZ0
Text GLabel 5250 2700 0    39   Input ~ 0
SIZ1
Text GLabel 5250 2900 0    35   Input ~ 0
~AS
Text GLabel 5250 3000 0    35   Input ~ 0
~DS
Text GLabel 5250 2800 0    35   Input ~ 0
R~W
Text GLabel 7800 2800 2    35   Output ~ 0
~STERM
Text GLabel 1650 3400 0    35   Input ~ 0
~RMC
Text GLabel 7800 2300 2    35   Output ~ 0
~IPL0
Text GLabel 7800 2900 2    35   Output ~ 0
~AVEC
Text GLabel 7800 2400 2    35   Output ~ 0
~IPL1
Text GLabel 7800 2500 2    35   Output ~ 0
~IPL2
Text GLabel 5250 3600 0    35   Output ~ 0
~BERR
Text GLabel 5250 3500 0    35   Output ~ 0
~HALT
Text GLabel 5250 3400 0    35   BiDi ~ 0
~RESET
Text GLabel 7800 3000 2    35   Input ~ 0
~CBREQ
Text GLabel 7800 3100 2    35   Output ~ 0
~CBACK
Text GLabel 7800 3200 2    35   Output ~ 0
~CIIN
Text GLabel 5250 3200 0    35   Input ~ 0
~BG
Text GLabel 5250 3100 0    35   Output ~ 0
~BR
Text GLabel 1650 3200 0    35   Input ~ 0
MPUCLK
Wire Wire Line
	1650 3200 1800 3200
Text Label 4500 4650 0    50   ~ 0
SA7
Text Label 4500 4550 0    50   ~ 0
SA11
Text Label 4500 4450 0    50   ~ 0
SA8
Text Label 4500 4350 0    50   ~ 0
SA9
Text GLabel 4550 4250 2    39   Output ~ 0
~RASB3
Text GLabel 4550 4050 2    39   Output ~ 0
~RASA3
Text GLabel 4550 4150 2    39   Output ~ 0
~RASB2
Text GLabel 4550 3950 2    39   Output ~ 0
~RASA2
Wire Wire Line
	4450 4150 4650 4150
$Comp
L Aslak:EPF10K130EQC240 U35
U 2 1 6228AD1B
P 6500 2350
F 0 "U35" H 6525 3487 60  0000 C CNN
F 1 "EPF10K130EQC240" H 6525 3381 60  0000 C CNN
F 2 "Package_QFP:PQFP-240_32.1x32.1mm_P0.5mm" H 2650 1850 60  0001 C CNN
F 3 "" H 2650 1850 60  0000 C CNN
	2    6500 2350
	1    0    0    -1  
$EndComp
Text Label 5300 3800 0    50   ~ 0
A31
Text Label 5300 3900 0    50   ~ 0
A30
Text Label 5300 4000 0    50   ~ 0
A29
Text Label 5300 4100 0    50   ~ 0
A28
Text Label 5300 4200 0    50   ~ 0
A27
Text Label 5300 4300 0    50   ~ 0
A26
Text Label 5300 4400 0    50   ~ 0
A25
Text Label 5300 4500 0    50   ~ 0
A24
Text Label 5300 4600 0    50   ~ 0
A23
Text Label 5300 4700 0    50   ~ 0
A22
Text Label 5300 4800 0    50   ~ 0
A21
Text Label 5300 4900 0    50   ~ 0
A20
Text Label 5300 5000 0    50   ~ 0
A19
Text Label 5300 5100 0    50   ~ 0
A18
Text Label 5300 5200 0    50   ~ 0
A17
Text Label 5300 5300 0    50   ~ 0
A16
Text Label 5300 5400 0    50   ~ 0
A15
Text Label 5300 5500 0    50   ~ 0
A14
Text Label 5300 5600 0    50   ~ 0
A13
Text Label 5300 5700 0    50   ~ 0
A12
Text Label 5300 5800 0    50   ~ 0
A11
Text Label 5300 5900 0    50   ~ 0
A10
Wire Wire Line
	5250 3800 5450 3800
Wire Wire Line
	5250 3900 5450 3900
Wire Wire Line
	5250 4000 5450 4000
Wire Wire Line
	5250 4100 5450 4100
Wire Wire Line
	5250 4200 5450 4200
Wire Wire Line
	5250 4300 5450 4300
Wire Wire Line
	5250 4400 5450 4400
Wire Wire Line
	5250 4500 5450 4500
Wire Wire Line
	5250 4600 5450 4600
Wire Wire Line
	5250 4700 5450 4700
Wire Wire Line
	5250 4800 5450 4800
Wire Wire Line
	5250 4900 5450 4900
Wire Wire Line
	5250 5000 5450 5000
Wire Wire Line
	5250 5100 5450 5100
Wire Wire Line
	5250 5200 5450 5200
Wire Wire Line
	5250 5300 5450 5300
Wire Wire Line
	5250 5400 5450 5400
Wire Wire Line
	5250 5500 5450 5500
Wire Wire Line
	5250 5600 5450 5600
Wire Wire Line
	5250 5700 5450 5700
Wire Wire Line
	5250 5800 5450 5800
Wire Wire Line
	5250 5900 5450 5900
Wire Wire Line
	5250 6000 5450 6000
Wire Wire Line
	5250 6100 5450 6100
Wire Wire Line
	5250 6200 5450 6200
Text GLabel 5250 3300 0    35   Output ~ 0
~BGACK
Text GLabel 7800 2600 2    35   Output ~ 0
~DSACK1
Text GLabel 7800 2700 2    35   Output ~ 0
~DSACK0
Text GLabel 7800 5000 2    39   Output ~ 0
~IACKE3
Text GLabel 7800 5100 2    39   Output ~ 0
~IACKE2
Text GLabel 7800 5200 2    39   Output ~ 0
~IACKE1
Text GLabel 7800 5300 2    39   Output ~ 0
~IACKE0
Text GLabel 1650 4200 0    39   BiDi ~ 0
PS2BCLK
Wire Wire Line
	4450 3150 4550 3150
Wire Wire Line
	4450 3250 4550 3250
Wire Wire Line
	4450 3450 4550 3450
Wire Wire Line
	4450 3550 4550 3550
Wire Wire Line
	4450 3650 4550 3650
Wire Wire Line
	4450 3750 4550 3750
Text GLabel 4550 3450 2    39   Output ~ 0
~RASB0
Text GLabel 4550 3250 2    39   Output ~ 0
~RASB1
Text GLabel 4550 3850 2    39   Output ~ 0
~CAS0
Text GLabel 4550 3550 2    39   Output ~ 0
~CAS1
Text GLabel 4550 3750 2    39   Output ~ 0
~CAS2
Text GLabel 4550 3650 2    39   Output ~ 0
~CAS3
Text GLabel 4550 3350 2    39   Output ~ 0
~RASA0
Text GLabel 4550 3150 2    39   Output ~ 0
~RASA1
Wire Wire Line
	3950 3150 4050 3150
Wire Wire Line
	3950 3250 4050 3250
Wire Wire Line
	3950 3350 4050 3350
Wire Wire Line
	3950 3450 4050 3450
Wire Wire Line
	3950 3550 4050 3550
Wire Wire Line
	3950 3650 4050 3650
Wire Wire Line
	3950 3750 4050 3750
Wire Wire Line
	3950 3850 4050 3850
Wire Wire Line
	7600 2200 7800 2200
Wire Wire Line
	7600 2100 7800 2100
Wire Wire Line
	7600 2000 7800 2000
Wire Wire Line
	7600 1900 7800 1900
Wire Wire Line
	7600 1800 7800 1800
Wire Wire Line
	7600 1700 7800 1700
Wire Wire Line
	7600 1600 7800 1600
Text Label 7650 1600 0    50   ~ 0
A6
Text Label 7650 1700 0    50   ~ 0
A5
Text Label 7650 1800 0    50   ~ 0
A4
Text Label 7650 1900 0    50   ~ 0
A3
Text Label 7650 2000 0    50   ~ 0
A2
Text Label 7650 2100 0    50   ~ 0
A1
Text Label 7650 2200 0    50   ~ 0
A0
Wire Wire Line
	5250 2300 5450 2300
Wire Wire Line
	5250 2400 5450 2400
Wire Wire Line
	5250 2500 5450 2500
Wire Wire Line
	5250 2600 5450 2600
Wire Wire Line
	5250 2700 5450 2700
Wire Wire Line
	5250 2800 5450 2800
Wire Wire Line
	5250 2900 5450 2900
Wire Wire Line
	5250 3000 5450 3000
Wire Wire Line
	5250 3100 5450 3100
Wire Wire Line
	5250 3200 5450 3200
Wire Wire Line
	5250 3300 5450 3300
Wire Wire Line
	5250 3400 5450 3400
Wire Wire Line
	5450 3500 5250 3500
Wire Wire Line
	5250 3600 5450 3600
Wire Wire Line
	7800 2300 7600 2300
Wire Wire Line
	7800 2400 7600 2400
Wire Wire Line
	7800 2500 7600 2500
Wire Wire Line
	7600 2600 7800 2600
Wire Wire Line
	7600 2700 7800 2700
Wire Wire Line
	7800 2800 7600 2800
Wire Wire Line
	7800 2900 7600 2900
Wire Wire Line
	7600 3000 7800 3000
Wire Wire Line
	7600 3100 7800 3100
Wire Wire Line
	7800 3200 7600 3200
Wire Wire Line
	7800 3300 7600 3300
Wire Wire Line
	7800 3400 7600 3400
Wire Wire Line
	1650 3400 1800 3400
Wire Wire Line
	7800 3500 7600 3500
Wire Wire Line
	7600 3600 7800 3600
Wire Wire Line
	7800 3700 7600 3700
Wire Wire Line
	7800 3800 7600 3800
Wire Wire Line
	7600 3900 7800 3900
Wire Wire Line
	7800 4000 7600 4000
Wire Wire Line
	7600 4100 7800 4100
Wire Wire Line
	7800 4200 7600 4200
Wire Wire Line
	7800 4400 7600 4400
Wire Wire Line
	7800 4600 7600 4600
Wire Wire Line
	7800 4300 7600 4300
Wire Wire Line
	7800 4500 7600 4500
Wire Wire Line
	7800 4700 7600 4700
Wire Wire Line
	7800 4900 7600 4900
Wire Wire Line
	7800 4800 7600 4800
Wire Wire Line
	7800 5000 7600 5000
Wire Wire Line
	7800 5100 7600 5100
Wire Wire Line
	7800 5200 7600 5200
Wire Wire Line
	7600 5300 7800 5300
Wire Wire Line
	7600 5400 7800 5400
Wire Wire Line
	7600 5500 7800 5500
Wire Wire Line
	7600 5600 7800 5600
Wire Wire Line
	7600 5700 7800 5700
Wire Wire Line
	8150 5800 7600 5800
Connection ~ 8150 5800
Wire Wire Line
	7800 6000 7600 6000
Wire Wire Line
	7800 5900 7600 5900
Text GLabel 1650 5400 0    35   Output ~ 0
RESET
Text GLabel 1650 4500 0    47   Input ~ 0
ETHINT
Text GLabel 1650 5300 0    35   Output ~ 0
~ETHCS
Wire Wire Line
	1650 5500 1800 5500
Wire Wire Line
	1650 5600 1800 5600
Wire Wire Line
	1650 5700 1800 5700
Wire Wire Line
	1650 5800 1800 5800
Wire Wire Line
	1650 5900 1800 5900
Wire Wire Line
	1650 6000 1800 6000
$Comp
L Connector_Generic:Conn_01x06 J12
U 1 1 61AE4528
P 950 5100
F 0 "J12" H 868 4575 50  0000 C CNN
F 1 "Conn_01x06" H 868 4666 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 950 5100 50  0001 C CNN
F 3 "~" H 950 5100 50  0001 C CNN
	1    950  5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 5400 1800 5400
Wire Wire Line
	1150 5300 1250 5300
Wire Wire Line
	1250 5300 1250 5400
$Comp
L power:GNDA #PWR0180
U 1 1 61BCE65C
P 1250 5400
F 0 "#PWR0180" H 1250 5150 50  0001 C CNN
F 1 "GNDA" H 1255 5227 50  0000 C CNN
F 2 "" H 1250 5400 50  0001 C CNN
F 3 "" H 1250 5400 50  0001 C CNN
	1    1250 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5300 1800 5300
Text Label 1250 4800 0    50   ~ 0
USER0
Text Label 1250 4900 0    50   ~ 0
USER1
Text Label 1250 5000 0    50   ~ 0
USER2
Text Label 1250 5100 0    50   ~ 0
USER3
Text Label 1250 5200 0    50   ~ 0
USER4
NoConn ~ 1800 3300
NoConn ~ 1800 3000
NoConn ~ 1800 2900
NoConn ~ 1800 2000
NoConn ~ 1800 1900
NoConn ~ 1800 1800
NoConn ~ 1800 1700
Text GLabel 7800 6100 2    39   Output ~ 0
~QUARTIACK
Wire Wire Line
	7600 6100 7800 6100
Text GLabel 1650 3700 0    39   Input ~ 0
~QUARTDTACK
Wire Wire Line
	1650 3700 1800 3700
Text GLabel 1650 3500 0    35   Input ~ 0
~IPEND
Wire Wire Line
	1650 3500 1800 3500
Text GLabel 5250 3700 0    39   Input ~ 0
TEMPALERT
Wire Wire Line
	5250 3700 5450 3700
Wire Wire Line
	1650 3900 1800 3900
Wire Wire Line
	1650 4000 1800 4000
Wire Wire Line
	1650 4100 1800 4100
Wire Wire Line
	1650 4200 1800 4200
Wire Wire Line
	1650 4300 1800 4300
Wire Wire Line
	1650 4400 1800 4400
Wire Wire Line
	1650 4500 1800 4500
Wire Wire Line
	1650 4600 1800 4600
Wire Wire Line
	1650 4700 1800 4700
Wire Wire Line
	1800 2500 1650 2500
Wire Wire Line
	1800 2300 1650 2300
Text GLabel 1650 2500 0    39   Output ~ 0
~IDEWRITE
Text GLabel 1650 2300 0    39   Output ~ 0
~IDEREAD
Wire Wire Line
	1800 2400 1650 2400
Text GLabel 1650 2400 0    39   Output ~ 0
~IDEDMAACK
NoConn ~ 1800 2700
Wire Wire Line
	1800 4800 1150 4800
Wire Wire Line
	1800 5200 1150 5200
Wire Wire Line
	1150 5100 1800 5100
Wire Wire Line
	1800 5000 1150 5000
Wire Wire Line
	1150 4900 1800 4900
Wire Wire Line
	1800 3600 1650 3600
Text GLabel 1650 3600 0    39   Input ~ 0
~IDEREADY
$Comp
L Aslak:EPF10K130EQC240 U35
U 1 1 6227EAA4
P 2850 2400
F 0 "U35" H 2875 3587 60  0000 C CNN
F 1 "EPF10K130EQC240" H 2875 3481 60  0000 C CNN
F 2 "Package_QFP:PQFP-240_32.1x32.1mm_P0.5mm" H -1000 1900 60  0001 C CNN
F 3 "" H -1000 1900 60  0000 C CNN
	1    2850 2400
	1    0    0    -1  
$EndComp
Text GLabel 1650 2600 0    39   Input ~ 0
~IDEDMAREQ
Wire Wire Line
	1800 2600 1650 2600
NoConn ~ 1800 2100
NoConn ~ 1800 1500
NoConn ~ 1800 1600
Wire Wire Line
	4450 3950 4550 3950
Text GLabel 1550 7050 0    39   Input ~ 0
~SIMMWE
Text GLabel 1550 7150 0    39   Input ~ 0
~SIMM
Wire Wire Line
	1550 7150 1600 7150
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61A64601
P 1600 7150
AR Path="/814D61C4/61A64601" Ref="TP?"  Part="1" 
AR Path="/8283B935/61A64601" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61A64601" Ref="TP9"  Part="1" 
F 0 "TP9" H 1752 7251 50  0001 L CNN
F 1 "~SIMM" H 1750 7150 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 1800 7150 50  0001 C CNN
F 3 "~" H 1800 7150 50  0001 C CNN
	1    1600 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61A6460B
P 1600 7050
AR Path="/814D61C4/61A6460B" Ref="TP?"  Part="1" 
AR Path="/8283B935/61A6460B" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61A6460B" Ref="TP8"  Part="1" 
F 0 "TP8" H 1752 7151 50  0001 L CNN
F 1 "~SIMMWE" H 1750 7050 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 1800 7050 50  0001 C CNN
F 3 "~" H 1800 7050 50  0001 C CNN
	1    1600 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 7050 1600 7050
Wire Wire Line
	1650 6100 1800 6100
Wire Wire Line
	1650 6200 1800 6200
Text GLabel 1550 6900 0    39   Input ~ 0
~CAS0
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61A8F7D8
P 1600 6900
AR Path="/814D61C4/61A8F7D8" Ref="TP?"  Part="1" 
AR Path="/8283B935/61A8F7D8" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61A8F7D8" Ref="TP7"  Part="1" 
F 0 "TP7" H 1752 7001 50  0001 L CNN
F 1 "~CAS0" V 1600 7050 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 1800 6900 50  0001 C CNN
F 3 "~" H 1800 6900 50  0001 C CNN
	1    1600 6900
	0    1    -1   0   
$EndComp
Wire Wire Line
	1600 6900 1550 6900
Wire Wire Line
	4450 3850 4550 3850
Wire Wire Line
	4450 3350 4550 3350
Text GLabel 1550 6800 0    39   Input ~ 0
~RASA0
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61B35115
P 1600 6800
AR Path="/814D61C4/61B35115" Ref="TP?"  Part="1" 
AR Path="/8283B935/61B35115" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61B35115" Ref="TP6"  Part="1" 
F 0 "TP6" H 1752 6901 50  0001 L CNN
F 1 "~RASA0" V 1600 6950 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 1800 6800 50  0001 C CNN
F 3 "~" H 1800 6800 50  0001 C CNN
	1    1600 6800
	0    1    -1   0   
$EndComp
Wire Wire Line
	1600 6800 1550 6800
Text GLabel 2500 7150 0    39   Input ~ 0
~ETHCS
Wire Wire Line
	2500 7150 2550 7150
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61B7655E
P 2550 7150
AR Path="/814D61C4/61B7655E" Ref="TP?"  Part="1" 
AR Path="/8283B935/61B7655E" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61B7655E" Ref="TP15"  Part="1" 
F 0 "TP15" H 2702 7251 50  0001 L CNN
F 1 "~ETHCS" H 2700 7150 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 7150 50  0001 C CNN
F 3 "~" H 2750 7150 50  0001 C CNN
	1    2550 7150
	1    0    0    -1  
$EndComp
Text GLabel 2500 7000 0    39   Input ~ 0
~UROM
Wire Wire Line
	2500 7000 2550 7000
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61B9D56F
P 2550 7000
AR Path="/814D61C4/61B9D56F" Ref="TP?"  Part="1" 
AR Path="/8283B935/61B9D56F" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61B9D56F" Ref="TP14"  Part="1" 
F 0 "TP14" H 2702 7101 50  0001 L CNN
F 1 "~UROM" H 2700 7000 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 7000 50  0001 C CNN
F 3 "~" H 2750 7000 50  0001 C CNN
	1    2550 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6900 2550 6900
Text GLabel 1550 7300 0    39   Input ~ 0
SYSCLEAR
Wire Wire Line
	1550 7300 1600 7300
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61C05E1E
P 1600 7300
AR Path="/814D61C4/61C05E1E" Ref="TP?"  Part="1" 
AR Path="/8283B935/61C05E1E" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61C05E1E" Ref="TP10"  Part="1" 
F 0 "TP10" H 1752 7401 50  0001 L CNN
F 1 "SYSCLEAR" H 1750 7300 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 1800 7300 50  0001 C CNN
F 3 "~" H 1800 7300 50  0001 C CNN
	1    1600 7300
	1    0    0    -1  
$EndComp
Text GLabel 2500 7250 0    39   Input ~ 0
~HALT
Wire Wire Line
	2500 7250 2550 7250
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61C43F9B
P 2550 7250
AR Path="/814D61C4/61C43F9B" Ref="TP?"  Part="1" 
AR Path="/8283B935/61C43F9B" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61C43F9B" Ref="TP16"  Part="1" 
F 0 "TP16" H 2702 7351 50  0001 L CNN
F 1 "~HALT" H 2700 7250 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 7250 50  0001 C CNN
F 3 "~" H 2750 7250 50  0001 C CNN
	1    2550 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4050 4450 4050
Text GLabel 2500 7350 0    39   Input ~ 0
~BERR
Wire Wire Line
	2500 7350 2550 7350
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61CB065F
P 2550 7350
AR Path="/814D61C4/61CB065F" Ref="TP?"  Part="1" 
AR Path="/8283B935/61CB065F" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61CB065F" Ref="TP17"  Part="1" 
F 0 "TP17" H 2702 7451 50  0001 L CNN
F 1 "~BERR" H 2700 7350 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 7350 50  0001 C CNN
F 3 "~" H 2750 7350 50  0001 C CNN
	1    2550 7350
	1    0    0    -1  
$EndComp
Text GLabel 2500 6900 0    39   Input ~ 0
~LROM
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61BBDC05
P 2550 6900
AR Path="/814D61C4/61BBDC05" Ref="TP?"  Part="1" 
AR Path="/8283B935/61BBDC05" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61BBDC05" Ref="TP13"  Part="1" 
F 0 "TP13" H 2702 7001 50  0001 L CNN
F 1 "~LROM" H 2700 6900 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 6900 50  0001 C CNN
F 3 "~" H 2750 6900 50  0001 C CNN
	1    2550 6900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61D860B9
P 2550 6650
AR Path="/814D61C4/61D860B9" Ref="TP?"  Part="1" 
AR Path="/8283B935/61D860B9" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61D860B9" Ref="TP11"  Part="1" 
F 0 "TP11" H 2702 6751 50  0001 L CNN
F 1 "~LEXP" H 2700 6650 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 6650 50  0001 C CNN
F 3 "~" H 2750 6650 50  0001 C CNN
	1    2550 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6650 2550 6650
Text GLabel 2500 6650 0    39   Input ~ 0
~LEXP
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61D860AD
P 2550 6750
AR Path="/814D61C4/61D860AD" Ref="TP?"  Part="1" 
AR Path="/8283B935/61D860AD" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61D860AD" Ref="TP12"  Part="1" 
F 0 "TP12" H 2702 6851 50  0001 L CNN
F 1 "~UEXP" H 2700 6750 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 6750 50  0001 C CNN
F 3 "~" H 2750 6750 50  0001 C CNN
	1    2550 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6750 2550 6750
Text GLabel 2500 6750 0    39   Input ~ 0
~UEXP
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61E11347
P 2550 7500
AR Path="/814D61C4/61E11347" Ref="TP?"  Part="1" 
AR Path="/8283B935/61E11347" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61E11347" Ref="TP18"  Part="1" 
F 0 "TP18" H 2702 7601 50  0001 L CNN
F 1 "SCL" H 2700 7500 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 7500 50  0001 C CNN
F 3 "~" H 2750 7500 50  0001 C CNN
	1    2550 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7500 2550 7500
Text GLabel 2500 7500 0    39   Input ~ 0
SCL
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 61E11353
P 2550 7600
AR Path="/814D61C4/61E11353" Ref="TP?"  Part="1" 
AR Path="/8283B935/61E11353" Ref="TP?"  Part="1" 
AR Path="/7DF01BC3/61E11353" Ref="TP19"  Part="1" 
F 0 "TP19" H 2702 7701 50  0001 L CNN
F 1 "SDA" H 2700 7600 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 7600 50  0001 C CNN
F 3 "~" H 2750 7600 50  0001 C CNN
	1    2550 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7600 2550 7600
Text GLabel 2500 7600 0    39   Input ~ 0
SDA
$EndSCHEMATC
