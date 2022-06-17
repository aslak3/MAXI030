EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 14
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
L Connector_Generic:Conn_02x05_Odd_Even P?
U 1 1 60F87933
P 4850 1850
AR Path="/7DF01BC3/60F87933" Ref="P?"  Part="1" 
AR Path="/60F832D9/60F87933" Ref="P3"  Part="1" 
F 0 "P3" H 4850 2150 50  0000 C CNN
F 1 "JTAG" H 4850 1550 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 4850 650 60  0001 C CNN
F 3 "" H 4850 650 60  0000 C CNN
	1    4850 1850
	1    0    0    -1  
$EndComp
Text GLabel 4250 1850 0    39   Output ~ 0
TMS
Text GLabel 4250 1650 0    39   Output ~ 0
TCK
Text GLabel 4250 2050 0    39   Output ~ 0
HEADERTOCF
Text GLabel 4250 1750 0    39   Input ~ 0
CORETOHEADER
NoConn ~ 4650 1950
NoConn ~ 5150 1950
NoConn ~ 5150 1850
Wire Wire Line
	5150 1650 5350 1650
Wire Wire Line
	5150 2050 5350 2050
Connection ~ 5350 2050
Wire Wire Line
	5250 1750 5150 1750
Wire Wire Line
	5250 1050 5250 1150
Wire Wire Line
	4250 1650 4350 1650
Wire Wire Line
	4250 1750 4650 1750
Wire Wire Line
	4250 1850 4450 1850
Wire Wire Line
	4250 2050 4550 2050
Wire Wire Line
	4350 1650 4350 2150
Connection ~ 4350 1650
Wire Wire Line
	4450 1850 4450 1550
Connection ~ 4450 1850
Wire Wire Line
	4550 2050 4550 1550
Connection ~ 4550 2050
Wire Wire Line
	4450 1250 4450 1150
Wire Wire Line
	4450 1150 4550 1150
Wire Wire Line
	4550 1150 4550 1250
Connection ~ 5250 1150
Connection ~ 4550 1150
Wire Wire Line
	4350 1650 4650 1650
Wire Wire Line
	4450 1850 4650 1850
Wire Wire Line
	4550 2050 4650 2050
Wire Wire Line
	4550 1150 5250 1150
$Comp
L Device:R R?
U 1 1 60F8799B
P 4450 1400
AR Path="/7DF01BC3/60F8799B" Ref="R?"  Part="1" 
AR Path="/60F832D9/60F8799B" Ref="R26"  Part="1" 
F 0 "R26" H 4250 1450 50  0000 L CNN
F 1 "1K" H 4300 1350 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4380 1400 50  0001 C CNN
F 3 "~" H 4450 1400 50  0001 C CNN
	1    4450 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60F879A1
P 4550 1400
AR Path="/7DF01BC3/60F879A1" Ref="R?"  Part="1" 
AR Path="/60F832D9/60F879A1" Ref="R27"  Part="1" 
F 0 "R27" H 4620 1446 50  0000 L CNN
F 1 "1K" H 4620 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4480 1400 50  0001 C CNN
F 3 "~" H 4550 1400 50  0001 C CNN
	1    4550 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1650 5350 2050
Wire Wire Line
	5250 1150 5250 1750
$Comp
L power:GNDD #PWR?
U 1 1 60F879B0
P 5350 2650
AR Path="/7DF01BC3/60F879B0" Ref="#PWR?"  Part="1" 
AR Path="/60F832D9/60F879B0" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 5350 2400 50  0001 C CNN
F 1 "GNDD" H 5354 2495 50  0000 C CNN
F 2 "" H 5350 2650 50  0001 C CNN
F 3 "" H 5350 2650 50  0001 C CNN
	1    5350 2650
	1    0    0    -1  
$EndComp
$Comp
L Aslak:EPF10K130EQC240 U35
U 3 1 625B08B9
P 7900 2300
F 0 "U35" H 8500 3350 60  0000 C CNN
F 1 "EPF10K130EQC240" H 8200 1650 60  0000 C CNN
F 2 "Package_QFP:PQFP-240_32.1x32.1mm_P0.5mm" H 4050 1800 60  0001 C CNN
F 3 "" H 4050 1800 60  0000 C CNN
	3    7900 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1450 6650 1450
Wire Wire Line
	6850 1550 6650 1550
Wire Wire Line
	6850 1650 6650 1650
Wire Wire Line
	6850 1750 6650 1750
Wire Wire Line
	6850 2150 6650 2150
Wire Wire Line
	6850 2250 6650 2250
Wire Wire Line
	6850 2350 6650 2350
Wire Wire Line
	6850 2450 6650 2450
Wire Wire Line
	6850 2650 6650 2650
Text GLabel 6650 1450 0    39   Output ~ 0
CORETOHEADER
Text GLabel 6650 1550 0    39   Input ~ 0
CFTOCORE
Text GLabel 6650 1650 0    39   Input ~ 0
TCK
Text GLabel 6650 1750 0    39   Input ~ 0
TMS
Wire Wire Line
	6750 2050 6750 2900
Wire Wire Line
	6750 2050 6850 2050
$Comp
L power:GNDD #PWR?
U 1 1 62629100
P 6750 2900
AR Path="/7DF01BC3/62629100" Ref="#PWR?"  Part="1" 
AR Path="/60F832D9/62629100" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 6750 2650 50  0001 C CNN
F 1 "GNDD" H 6754 2745 50  0000 C CNN
F 2 "" H 6750 2900 50  0001 C CNN
F 3 "" H 6750 2900 50  0001 C CNN
	1    6750 2900
	1    0    0    -1  
$EndComp
Text GLabel 6650 2150 0    39   BiDi ~ 0
CFSTATUS
Text GLabel 6650 2250 0    39   Input ~ 0
CFDONE
Text GLabel 6650 2350 0    39   Input ~ 0
CFCONFIG
Text GLabel 6650 2450 0    39   Input ~ 0
CFCLOCK
Text GLabel 6650 2650 0    39   Input ~ 0
CFDATA
NoConn ~ 8850 1950
Wire Wire Line
	8850 2150 9000 2150
Wire Wire Line
	9000 2150 9000 2250
Wire Wire Line
	8850 2250 9000 2250
Connection ~ 9000 2250
Wire Wire Line
	9000 2250 9000 2350
$Comp
L power:GNDD #PWR?
U 1 1 62688024
P 9000 2350
AR Path="/7DF01BC3/62688024" Ref="#PWR?"  Part="1" 
AR Path="/60F832D9/62688024" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 9000 2100 50  0001 C CNN
F 1 "GNDD" H 9004 2195 50  0000 C CNN
F 2 "" H 9000 2350 50  0001 C CNN
F 3 "" H 9000 2350 50  0001 C CNN
	1    9000 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0174
U 1 1 626A25F1
P 5250 1050
F 0 "#PWR0174" H 5250 900 50  0001 C CNN
F 1 "+3.3V" H 5265 1223 50  0000 C CNN
F 2 "" H 5250 1050 50  0001 C CNN
F 3 "" H 5250 1050 50  0001 C CNN
	1    5250 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1850 6750 1850
Wire Wire Line
	6750 1850 6750 1250
$Comp
L power:+3.3V #PWR0182
U 1 1 61EABA0D
P 6750 1250
F 0 "#PWR0182" H 6750 1100 50  0001 C CNN
F 1 "+3.3V" H 6765 1423 50  0000 C CNN
F 2 "" H 6750 1250 50  0001 C CNN
F 3 "" H 6750 1250 50  0001 C CNN
	1    6750 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1500 2450 1600
Wire Wire Line
	2450 2000 2450 2100
$Comp
L power:+3.3V #PWR0175
U 1 1 626A2CF9
P 2450 1500
F 0 "#PWR0175" H 2450 1350 50  0001 C CNN
F 1 "+3.3V" H 2465 1673 50  0000 C CNN
F 2 "" H 2450 1500 50  0001 C CNN
F 3 "" H 2450 1500 50  0001 C CNN
	1    2450 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 614CB98F
P 2450 2200
AR Path="/814D61C4/614CB98F" Ref="#PWR?"  Part="1" 
AR Path="/7DF01BC3/614CB98F" Ref="#PWR?"  Part="1" 
AR Path="/838A565C/614CB98F" Ref="#PWR?"  Part="1" 
AR Path="/60F832D9/614CB98F" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 2450 1950 50  0001 C CNN
F 1 "GNDD" H 2454 2045 50  0000 C CNN
F 2 "" H 2450 2200 50  0001 C CNN
F 3 "" H 2450 2200 50  0001 C CNN
	1    2450 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614CB979
P 2450 1850
AR Path="/83909542/614CB979" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/614CB979" Ref="C?"  Part="1" 
AR Path="/838A565C/614CB979" Ref="C?"  Part="1" 
AR Path="/60F832D9/614CB979" Ref="C61"  Part="1" 
F 0 "C61" H 2475 1950 50  0000 L CNN
F 1 "0.1u" H 2475 1750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2488 1700 30  0001 C CNN
F 3 "" H 2450 1850 60  0000 C CNN
	1    2450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2550 5350 2650
Wire Wire Line
	5350 2050 5350 2550
Connection ~ 5350 2550
$Comp
L power:+3.3V #PWR0168
U 1 1 626A1FCB
P 4150 3600
F 0 "#PWR0168" H 4150 3450 50  0001 C CNN
F 1 "+3.3V" H 4165 3773 50  0000 C CNN
F 2 "" H 4150 3600 50  0001 C CNN
F 3 "" H 4150 3600 50  0001 C CNN
	1    4150 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60F879AA
P 4150 5750
AR Path="/7DF01BC3/60F879AA" Ref="#PWR?"  Part="1" 
AR Path="/60F832D9/60F879AA" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 4150 5500 50  0001 C CNN
F 1 "GNDD" H 4154 5595 50  0000 C CNN
F 2 "" H 4150 5750 50  0001 C CNN
F 3 "" H 4150 5750 50  0001 C CNN
	1    4150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5650 4900 5650
$Comp
L Device:R R?
U 1 1 60F87995
P 4350 2300
AR Path="/7DF01BC3/60F87995" Ref="R?"  Part="1" 
AR Path="/60F832D9/60F87995" Ref="R25"  Part="1" 
F 0 "R25" H 4420 2346 50  0000 L CNN
F 1 "1K" H 4420 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 2300 50  0001 C CNN
F 3 "~" H 4350 2300 50  0001 C CNN
	1    4350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5450 4900 5650
Wire Wire Line
	4900 4850 4900 5050
Wire Wire Line
	4900 4850 5000 4850
Wire Wire Line
	4150 3700 4150 3900
Wire Wire Line
	4150 5650 4150 5750
Wire Wire Line
	3200 3700 3300 3700
Connection ~ 4900 4850
Wire Wire Line
	4350 2550 5350 2550
Wire Wire Line
	4350 2450 4350 2550
Connection ~ 4150 3700
Wire Wire Line
	3550 4500 3100 4500
Wire Wire Line
	3550 4400 3100 4400
Wire Wire Line
	3550 4300 3100 4300
Wire Wire Line
	6150 4200 5750 4200
Wire Wire Line
	3200 4900 3550 4900
Wire Wire Line
	3200 3700 3200 4900
Wire Wire Line
	3550 4700 3300 4700
Connection ~ 4150 5650
Wire Wire Line
	3300 4700 3300 4800
Wire Wire Line
	3550 4800 3300 4800
Wire Wire Line
	4800 4850 4900 4850
Wire Wire Line
	4800 4500 5000 4500
Wire Wire Line
	4800 4400 5000 4400
Wire Wire Line
	4800 4300 5000 4300
Wire Wire Line
	4800 4200 5000 4200
Wire Wire Line
	4150 5200 4150 5650
Wire Wire Line
	4150 3600 4150 3700
$Comp
L Switch:SW_Push SW?
U 1 1 60F87952
P 4900 5250
AR Path="/7DF01BC3/60F87952" Ref="SW?"  Part="1" 
AR Path="/60F832D9/60F87952" Ref="SW1"  Part="1" 
F 0 "SW1" V 5050 5360 50  0000 C CNN
F 1 "RESETBUTTON" H 4900 5170 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_CK_KSC6xxJ" H 4900 5250 60  0001 C CNN
F 3 "" H 4900 5250 60  0000 C CNN
	1    4900 5250
	0    1    1    0   
$EndComp
Text GLabel 3100 4500 0    39   Input ~ 0
TMS
Text GLabel 3100 4400 0    39   Input ~ 0
HEADERTOCF
Text GLabel 3100 4300 0    39   Input ~ 0
TCK
Text GLabel 5750 4200 0    39   Output ~ 0
CFTOCORE
Text GLabel 5000 4850 2    39   Output ~ 0
CFCONFIG
Text GLabel 5000 4500 2    39   Output ~ 0
CFDONE
Text GLabel 5000 4400 2    39   BiDi ~ 0
CFSTATUS
Text GLabel 5000 4300 2    39   Output ~ 0
CFCLOCK
Text GLabel 5000 4200 2    39   Output ~ 0
CFDATA
$Comp
L Aslak:EPC2 U?
U 1 1 60F8792D
P 4150 4550
AR Path="/7DF01BC3/60F8792D" Ref="U?"  Part="1" 
AR Path="/60F832D9/60F8792D" Ref="U34"  Part="1" 
F 0 "U34" H 3850 4050 60  0000 C CNN
F 1 "EPC2" H 4400 5050 60  0000 C CNN
F 2 "Package_LCC:PLCC-20" H 4150 4500 60  0001 C CNN
F 3 "" H 4150 4500 60  0000 C CNN
	1    4150 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6222D85A
P 2700 1850
AR Path="/83909542/6222D85A" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/6222D85A" Ref="C?"  Part="1" 
AR Path="/838A565C/6222D85A" Ref="C?"  Part="1" 
AR Path="/60F832D9/6222D85A" Ref="C78"  Part="1" 
F 0 "C78" H 2725 1950 50  0000 L CNN
F 1 "0.1u" H 2725 1750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2738 1700 30  0001 C CNN
F 3 "" H 2700 1850 60  0000 C CNN
	1    2700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2100 2700 2100
Wire Wire Line
	2700 2100 2700 2000
Connection ~ 2450 2100
Wire Wire Line
	2450 2100 2450 2200
Wire Wire Line
	2450 1600 2700 1600
Wire Wire Line
	2700 1600 2700 1700
Connection ~ 2450 1600
Wire Wire Line
	2450 1600 2450 1700
$Comp
L power:+3.3V #PWR0183
U 1 1 62251A16
P 6750 3600
F 0 "#PWR0183" H 6750 3450 50  0001 C CNN
F 1 "+3.3V" H 6765 3773 50  0000 C CNN
F 2 "" H 6750 3600 50  0001 C CNN
F 3 "" H 6750 3600 50  0001 C CNN
	1    6750 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 62251A20
P 6750 5750
AR Path="/7DF01BC3/62251A20" Ref="#PWR?"  Part="1" 
AR Path="/60F832D9/62251A20" Ref="#PWR0184"  Part="1" 
F 0 "#PWR0184" H 6750 5500 50  0001 C CNN
F 1 "GNDD" H 6754 5595 50  0000 C CNN
F 2 "" H 6750 5750 50  0001 C CNN
F 3 "" H 6750 5750 50  0001 C CNN
	1    6750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3700 6750 3900
Wire Wire Line
	5850 3700 5950 3700
Connection ~ 6750 3700
Wire Wire Line
	5850 4900 6150 4900
Wire Wire Line
	5850 3700 5850 4900
Wire Wire Line
	6150 4700 5950 4700
Wire Wire Line
	5950 4700 5950 4800
Wire Wire Line
	6150 4800 5950 4800
Wire Wire Line
	7400 4500 7600 4500
Wire Wire Line
	7400 4400 7600 4400
Wire Wire Line
	7400 4300 7600 4300
Wire Wire Line
	7400 4200 7600 4200
Wire Wire Line
	6750 3600 6750 3700
NoConn ~ 7400 4750
Text GLabel 7600 4300 2    39   Input ~ 0
CFCLOCK
Text GLabel 7600 4200 2    39   Output ~ 0
CFDATA
$Comp
L Aslak:EPC2 U?
U 1 1 62251A5B
P 6750 4550
AR Path="/7DF01BC3/62251A5B" Ref="U?"  Part="1" 
AR Path="/60F832D9/62251A5B" Ref="U1"  Part="1" 
F 0 "U1" H 6450 4050 60  0000 C CNN
F 1 "EPC2" H 7000 5050 60  0000 C CNN
F 2 "Package_LCC:PLCC-20" H 6750 4500 60  0001 C CNN
F 3 "" H 6750 4500 60  0000 C CNN
	1    6750 4550
	1    0    0    -1  
$EndComp
NoConn ~ 7400 4850
Text GLabel 7600 4400 2    39   BiDi ~ 0
CFSTATUS
Wire Wire Line
	4800 4750 5450 4750
Wire Wire Line
	5450 4750 5450 5350
Wire Wire Line
	5450 5350 7600 5350
Wire Wire Line
	7600 5350 7600 4500
Wire Wire Line
	6750 5200 6750 5750
Wire Wire Line
	3300 4700 3300 3700
Connection ~ 3300 4700
Connection ~ 3300 3700
Wire Wire Line
	3300 3700 4150 3700
Wire Wire Line
	5950 4700 5950 3700
Connection ~ 5950 4700
Connection ~ 5950 3700
Wire Wire Line
	5950 3700 6750 3700
Wire Wire Line
	6150 4500 5750 4500
Text GLabel 5750 4500 0    39   Input ~ 0
TMS
Wire Wire Line
	6150 4300 5750 4300
Text GLabel 5750 4300 0    39   Input ~ 0
TCK
Wire Wire Line
	6150 4400 6050 4400
Wire Wire Line
	6050 4400 6050 3950
Wire Wire Line
	6050 3950 3450 3950
Wire Wire Line
	3450 3950 3450 4200
Wire Wire Line
	3450 4200 3550 4200
$EndSCHEMATC
