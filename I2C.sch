EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 14
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
L Device:C C?
U 1 1 61D75F3A
P 8600 3850
AR Path="/83909542/61D75F3A" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/61D75F3A" Ref="C?"  Part="1" 
AR Path="/838A2035/61D75F3A" Ref="C28"  Part="1" 
F 0 "C28" H 8625 3950 50  0000 L CNN
F 1 "0.1u" H 8625 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8638 3700 30  0001 C CNN
F 3 "" H 8600 3850 60  0000 C CNN
	1    8600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 61D75F4E
P 8600 4350
AR Path="/814D61C4/61D75F4E" Ref="#PWR?"  Part="1" 
AR Path="/7DF01BC3/61D75F4E" Ref="#PWR?"  Part="1" 
AR Path="/838A2035/61D75F4E" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 8600 4100 50  0001 C CNN
F 1 "GNDD" H 8604 4195 50  0000 C CNN
F 2 "" H 8600 4350 50  0001 C CNN
F 3 "" H 8600 4350 50  0001 C CNN
	1    8600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3350 8600 3500
Wire Wire Line
	8600 4000 8600 4200
$Comp
L Timer_RTC:DS1307Z+ U18
U 1 1 60D34750
P 6250 2150
F 0 "U18" H 6550 1800 50  0000 L CNN
F 1 "DS1307Z+" H 5650 2500 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6250 1650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1307.pdf" H 6250 2150 50  0001 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2550 6250 2650
Wire Wire Line
	6250 1750 6250 1500
Wire Wire Line
	7000 1500 7000 1600
Wire Wire Line
	6250 1500 7000 1500
Wire Wire Line
	6250 2650 7000 2650
Wire Wire Line
	7000 2650 7000 1900
$Comp
L Device:Crystal Y2
U 1 1 60D3CE85
P 5300 2400
F 0 "Y2" V 5300 2250 50  0000 R CNN
F 1 "32.768" V 5300 2800 50  0000 R CNN
F 2 "Crystal:Crystal_SMD_EuroQuartz_EQ161-2Pin_3.2x1.5mm" H 5300 2400 50  0001 C CNN
F 3 "~" H 5300 2400 50  0001 C CNN
	1    5300 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 2250 5300 2150
Wire Wire Line
	5300 2150 5600 2150
Wire Wire Line
	5600 2150 5600 2250
Wire Wire Line
	5600 2250 5750 2250
Wire Wire Line
	5300 2550 5300 2650
Wire Wire Line
	5300 2650 5600 2650
Wire Wire Line
	5600 2650 5600 2350
Wire Wire Line
	5600 2350 5750 2350
Wire Wire Line
	6150 1750 6150 1400
Wire Wire Line
	6250 2650 6250 2750
Connection ~ 6250 2650
$Comp
L power:GNDD #PWR073
U 1 1 60D496DF
P 6250 2750
F 0 "#PWR073" H 6250 2500 50  0001 C CNN
F 1 "GNDD" H 6254 2595 50  0000 C CNN
F 2 "" H 6250 2750 50  0001 C CNN
F 3 "" H 6250 2750 50  0001 C CNN
	1    6250 2750
	1    0    0    -1  
$EndComp
Text GLabel 5100 1950 0    39   BiDi ~ 0
SCL
Text GLabel 5100 2050 0    39   BiDi ~ 0
SDA
Wire Wire Line
	5100 1950 5250 1950
Wire Wire Line
	5750 2050 5550 2050
$Comp
L Device:R R9
U 1 1 60D4F405
P 5250 1650
F 0 "R9" H 5320 1696 50  0000 L CNN
F 1 "4.7K" H 5320 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5180 1650 50  0001 C CNN
F 3 "~" H 5250 1650 50  0001 C CNN
	1    5250 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 60D52921
P 5550 1650
F 0 "R10" H 5620 1696 50  0000 L CNN
F 1 "4.7K" H 5620 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5480 1650 50  0001 C CNN
F 3 "~" H 5550 1650 50  0001 C CNN
	1    5550 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1800 5250 1950
Connection ~ 5250 1950
Wire Wire Line
	5250 1950 5750 1950
Wire Wire Line
	5550 1800 5550 2050
Connection ~ 5550 2050
Wire Wire Line
	5550 2050 5100 2050
Wire Wire Line
	5250 1500 5250 1400
Wire Wire Line
	5250 1400 5550 1400
Wire Wire Line
	5550 1400 5550 1500
Wire Wire Line
	5550 1400 6150 1400
Connection ~ 5550 1400
Connection ~ 6150 1400
Wire Wire Line
	6150 1400 6150 1300
Text GLabel 7700 2150 2    39   Output ~ 0
RTCSQWAVE
$Comp
L power:+5VD #PWR072
U 1 1 60D645DD
P 6150 1300
F 0 "#PWR072" H 6150 1150 50  0001 C CNN
F 1 "+5VD" H 6165 1473 50  0000 C CNN
F 2 "" H 6150 1300 50  0001 C CNN
F 3 "" H 6150 1300 50  0001 C CNN
	1    6150 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 6160747F
P 7400 1650
F 0 "R11" H 7470 1696 50  0000 L CNN
F 1 "4.7K" H 7470 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7330 1650 50  0001 C CNN
F 3 "~" H 7400 1650 50  0001 C CNN
	1    7400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1400 7400 1400
Wire Wire Line
	7400 1400 7400 1500
Wire Wire Line
	7400 1800 7400 2150
Wire Wire Line
	6750 2150 7400 2150
Connection ~ 7400 2150
Wire Wire Line
	7400 2150 7700 2150
Wire Wire Line
	3500 2850 3500 2750
Wire Wire Line
	3500 4150 3500 4300
$Comp
L power:GNDD #PWR069
U 1 1 6677F06C
P 3500 4300
F 0 "#PWR069" H 3500 4050 50  0001 C CNN
F 1 "GNDD" H 3504 4145 50  0000 C CNN
F 2 "" H 3500 4300 50  0001 C CNN
F 3 "" H 3500 4300 50  0001 C CNN
	1    3500 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR068
U 1 1 6678978A
P 3500 2650
F 0 "#PWR068" H 3500 2500 50  0001 C CNN
F 1 "+5VD" H 3515 2823 50  0000 C CNN
F 2 "" H 3500 2650 50  0001 C CNN
F 3 "" H 3500 2650 50  0001 C CNN
	1    3500 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3400 4250 3400
Wire Wire Line
	4100 3500 4250 3500
Wire Wire Line
	4100 3600 4250 3600
Wire Wire Line
	2950 3400 2800 3400
Wire Wire Line
	2950 3500 2800 3500
Text GLabel 2800 3400 0    39   BiDi ~ 0
SDA
Text GLabel 2800 3500 0    39   BiDi ~ 0
SCL
Text Notes 3700 4000 0    39   ~ 0
Address=100 1111 (0x4f)
Text Notes 7150 2400 0    39   ~ 0
Address=110 1000 (0x68)
Wire Wire Line
	4250 3600 4250 3500
Wire Wire Line
	4250 2750 3500 2750
Connection ~ 4250 3400
Wire Wire Line
	4250 3400 4250 2750
Connection ~ 4250 3500
Wire Wire Line
	4250 3500 4250 3400
Connection ~ 3500 2750
Wire Wire Line
	3500 2750 3500 2650
$Comp
L Device:C C?
U 1 1 66ADD91E
P 8850 3850
AR Path="/83909542/66ADD91E" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/66ADD91E" Ref="C?"  Part="1" 
AR Path="/838A2035/66ADD91E" Ref="C29"  Part="1" 
F 0 "C29" H 8875 3950 50  0000 L CNN
F 1 "0.1u" H 8875 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8888 3700 30  0001 C CNN
F 3 "" H 8850 3850 60  0000 C CNN
	1    8850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3500 8850 3700
Wire Wire Line
	8850 4000 8850 4200
$Comp
L Device:C C?
U 1 1 66ADFA78
P 9100 3850
AR Path="/83909542/66ADFA78" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/66ADFA78" Ref="C?"  Part="1" 
AR Path="/838A2035/66ADFA78" Ref="C30"  Part="1" 
F 0 "C30" H 9125 3950 50  0000 L CNN
F 1 "0.1u" H 9125 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9138 3700 30  0001 C CNN
F 3 "" H 9100 3850 60  0000 C CNN
	1    9100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3500 9100 3700
Wire Wire Line
	9100 4000 9100 4200
Wire Wire Line
	8600 3500 8850 3500
Connection ~ 8600 3500
Wire Wire Line
	8600 3500 8600 3700
Wire Wire Line
	8850 3500 9100 3500
Connection ~ 8850 3500
Wire Wire Line
	9100 4200 8850 4200
Wire Wire Line
	8850 4200 8600 4200
Connection ~ 8850 4200
Connection ~ 8600 4200
Wire Wire Line
	8600 4200 8600 4350
$Comp
L Aslak:LM75A U16
U 1 1 66BD7249
P 3500 3500
F 0 "U16" H 3250 3900 39  0000 C CNN
F 1 "LM75A" H 3700 3900 39  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 3500 3650 39  0001 C CNN
F 3 "" H 3500 3650 39  0001 C CNN
	1    3500 3500
	1    0    0    -1  
$EndComp
$Comp
L Interface_Expansion:PCA9544APW U17
U 1 1 66EBCEF3
P 5950 4200
F 0 "U17" H 6200 5050 50  0000 C CNN
F 1 "PCA9544APW" H 5550 5050 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 7050 3350 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA9544A.pdf" H 5750 3100 50  0001 C CNN
	1    5950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4300 5300 4300
Wire Wire Line
	5450 4400 5300 4400
Text GLabel 5300 4300 0    39   BiDi ~ 0
SDA
Text GLabel 5300 4400 0    39   BiDi ~ 0
SCL
Wire Wire Line
	5450 4700 5300 4700
Wire Wire Line
	5300 4700 5300 4800
Wire Wire Line
	5450 4800 5300 4800
Connection ~ 5300 4800
Wire Wire Line
	5300 4800 5300 4900
Wire Wire Line
	5450 4900 5300 4900
Connection ~ 5300 4900
Wire Wire Line
	5300 4900 5300 5250
Wire Wire Line
	5300 5250 5950 5250
Wire Wire Line
	5950 5250 5950 5100
Text GLabel 6650 3600 2    39   BiDi ~ 0
EXPSCLE0
Text GLabel 6650 3500 2    39   BiDi ~ 0
EXPSDAE0
Wire Wire Line
	6650 3500 6450 3500
Wire Wire Line
	6650 3600 6450 3600
Text GLabel 6650 4000 2    39   BiDi ~ 0
EXPSCLE1
Text GLabel 6650 3900 2    39   BiDi ~ 0
EXPSDAE1
Wire Wire Line
	6650 3900 6450 3900
Wire Wire Line
	6650 4000 6450 4000
Text GLabel 6650 4400 2    39   BiDi ~ 0
EXPSCLE2
Text GLabel 6650 4300 2    39   BiDi ~ 0
EXPSDAE2
Wire Wire Line
	6650 4300 6450 4300
Wire Wire Line
	6650 4400 6450 4400
Text GLabel 6650 4800 2    39   BiDi ~ 0
EXPSCLE3
Text GLabel 6650 4700 2    39   BiDi ~ 0
EXPSDAE3
Wire Wire Line
	6650 4700 6450 4700
Wire Wire Line
	6650 4800 6450 4800
$Comp
L power:+5VD #PWR070
U 1 1 66F78D38
P 5950 3200
F 0 "#PWR070" H 5950 3050 50  0001 C CNN
F 1 "+5VD" H 5965 3373 50  0000 C CNN
F 2 "" H 5950 3200 50  0001 C CNN
F 3 "" H 5950 3200 50  0001 C CNN
	1    5950 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3300 5950 3250
Wire Wire Line
	5950 5250 5950 5400
$Comp
L power:GNDD #PWR071
U 1 1 66F87F79
P 5950 5400
F 0 "#PWR071" H 5950 5150 50  0001 C CNN
F 1 "GNDD" H 5954 5245 50  0000 C CNN
F 2 "" H 5950 5400 50  0001 C CNN
F 3 "" H 5950 5400 50  0001 C CNN
	1    5950 5400
	1    0    0    -1  
$EndComp
Connection ~ 5950 5250
Text Notes 6600 5200 0    39   ~ 0
Address=111 0000 (0x70)
Wire Wire Line
	6450 3700 6550 3700
Wire Wire Line
	6550 3700 6550 3250
Wire Wire Line
	6550 3250 5950 3250
Connection ~ 5950 3250
Wire Wire Line
	5950 3250 5950 3200
Wire Wire Line
	6450 4100 6550 4100
Wire Wire Line
	6550 4100 6550 3700
Connection ~ 6550 3700
Wire Wire Line
	6450 4500 6550 4500
Wire Wire Line
	6550 4500 6550 4100
Connection ~ 6550 4100
Wire Wire Line
	6450 4900 6550 4900
Wire Wire Line
	6550 4900 6550 4500
Connection ~ 6550 4500
NoConn ~ 5450 4500
$Comp
L Device:Battery_Cell BT1
U 1 1 60AD5248
P 7000 1800
F 0 "BT1" H 7118 1896 50  0000 L CNN
F 1 "Battery_Cell" H 6500 1950 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_3000_1x12mm" V 7000 1860 50  0001 C CNN
F 3 "~" V 7000 1860 50  0001 C CNN
	1    7000 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 60AD7140
P 7000 1300
F 0 "#FLG02" H 7000 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 7000 1473 50  0000 C CNN
F 2 "" H 7000 1300 50  0001 C CNN
F 3 "~" H 7000 1300 50  0001 C CNN
	1    7000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1300 7000 1500
Connection ~ 7000 1500
$Comp
L power:+5VD #PWR074
U 1 1 60CF4D14
P 8600 3350
F 0 "#PWR074" H 8600 3200 50  0001 C CNN
F 1 "+5VD" H 8615 3523 50  0000 C CNN
F 2 "" H 8600 3350 50  0001 C CNN
F 3 "" H 8600 3350 50  0001 C CNN
	1    8600 3350
	1    0    0    -1  
$EndComp
Text GLabel 2800 3600 0    39   Output ~ 0
TEMPALERT
Wire Wire Line
	2800 3600 2950 3600
$EndSCHEMATC