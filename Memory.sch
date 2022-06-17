EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 14
Title "MAXI030 - 68030 based expandable computer"
Date "2021-10-02"
Rev ""
Comp ""
Comment1 "Lawrence Manning"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5400 2000 5400 1800
$Comp
L power:GNDD #PWR079
U 1 1 83900566
P 5400 4700
F 0 "#PWR079" H 5400 4450 50  0001 C CNN
F 1 "GNDD" H 5400 4550 50  0000 C CNN
F 2 "" H 5400 4700 60  0000 C CNN
F 3 "" H 5400 4700 60  0000 C CNN
	1    5400 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR078
U 1 1 8390056C
P 5400 1800
F 0 "#PWR078" H 5400 1650 50  0001 C CNN
F 1 "+5VD" H 5400 1940 50  0000 C CNN
F 2 "" H 5400 1800 60  0000 C CNN
F 3 "" H 5400 1800 60  0000 C CNN
	1    5400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2200 4700 2200
Wire Wire Line
	4900 2300 4700 2300
Wire Wire Line
	4900 2400 4700 2400
Wire Wire Line
	4900 2500 4700 2500
Wire Wire Line
	4900 2600 4700 2600
Wire Wire Line
	4900 2700 4700 2700
Wire Wire Line
	4900 2800 4700 2800
Wire Wire Line
	4900 2900 4700 2900
Wire Wire Line
	4900 3000 4700 3000
Wire Wire Line
	4900 3100 4700 3100
Wire Wire Line
	4900 3200 4700 3200
Wire Wire Line
	4900 3300 4700 3300
Wire Wire Line
	4900 3400 4700 3400
Wire Wire Line
	4900 3500 4700 3500
Wire Wire Line
	4900 3600 4700 3600
Wire Wire Line
	5900 3300 6350 3300
Wire Wire Line
	5900 3200 6350 3200
Entry Wire Line
	4600 2100 4700 2200
Entry Wire Line
	4600 2200 4700 2300
Entry Wire Line
	4600 2300 4700 2400
Entry Wire Line
	4600 2400 4700 2500
Entry Wire Line
	4600 2500 4700 2600
Entry Wire Line
	4600 2600 4700 2700
Entry Wire Line
	4600 2700 4700 2800
Entry Wire Line
	4600 2800 4700 2900
Entry Wire Line
	4600 2900 4700 3000
Entry Wire Line
	4600 3000 4700 3100
Entry Wire Line
	4600 3100 4700 3200
Entry Wire Line
	4600 3200 4700 3300
Entry Wire Line
	4600 3300 4700 3400
Entry Wire Line
	4600 3400 4700 3500
Entry Wire Line
	4600 3500 4700 3600
Entry Wire Line
	6100 2200 6200 2300
Entry Wire Line
	6100 2300 6200 2400
Entry Wire Line
	6100 2400 6200 2500
Entry Wire Line
	6100 2500 6200 2600
Entry Wire Line
	6100 2600 6200 2700
Entry Wire Line
	6100 2700 6200 2800
Entry Wire Line
	6100 2800 6200 2900
Entry Wire Line
	6100 2900 6200 3000
Text Label 4800 2200 2    39   ~ 0
A1
Text Label 4800 2300 2    39   ~ 0
A2
Text Label 4800 2400 2    39   ~ 0
A3
Text Label 4800 2500 2    39   ~ 0
A4
Text Label 4800 2600 2    39   ~ 0
A5
Text Label 4800 2700 2    39   ~ 0
A6
Text Label 4800 2800 2    39   ~ 0
A7
Text Label 4800 2900 2    39   ~ 0
A8
Text Label 4800 3000 2    39   ~ 0
A9
Text Label 4850 3100 2    39   ~ 0
A10
Text Label 4850 3200 2    39   ~ 0
A11
Text GLabel 6350 3300 2    39   Input ~ 0
~READ
Text GLabel 6350 3200 2    39   Input ~ 0
~UROM
Text GLabel 8600 3400 2    39   Input ~ 0
~WRITE
Entry Wire Line
	4600 3600 4700 3700
Entry Wire Line
	4600 3700 4700 3800
Entry Wire Line
	4600 3800 4700 3900
Entry Wire Line
	4600 3900 4700 4000
Wire Wire Line
	4700 3700 4900 3700
Wire Wire Line
	4700 3800 4900 3800
Wire Wire Line
	4700 3900 4900 3900
Wire Wire Line
	4700 4000 4900 4000
Wire Wire Line
	5400 4200 5400 4700
Wire Wire Line
	7650 2000 7650 1800
$Comp
L power:GNDD #PWR081
U 1 1 8390068C
P 7650 4750
F 0 "#PWR081" H 7650 4500 50  0001 C CNN
F 1 "GNDD" H 7650 4600 50  0000 C CNN
F 2 "" H 7650 4750 60  0000 C CNN
F 3 "" H 7650 4750 60  0000 C CNN
	1    7650 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR080
U 1 1 83900692
P 7650 1800
F 0 "#PWR080" H 7650 1650 50  0001 C CNN
F 1 "+5VD" H 7650 1940 50  0000 C CNN
F 2 "" H 7650 1800 60  0000 C CNN
F 3 "" H 7650 1800 60  0000 C CNN
	1    7650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2200 6950 2200
Wire Wire Line
	7150 2300 6950 2300
Wire Wire Line
	7150 2400 6950 2400
Wire Wire Line
	7150 2500 6950 2500
Wire Wire Line
	7150 2600 6950 2600
Wire Wire Line
	7150 2700 6950 2700
Wire Wire Line
	7150 2800 6950 2800
Wire Wire Line
	7150 2900 6950 2900
Wire Wire Line
	7150 3000 6950 3000
Wire Wire Line
	7150 3100 6950 3100
Wire Wire Line
	7150 3200 6950 3200
Wire Wire Line
	7150 3300 6950 3300
Wire Wire Line
	7150 3400 6950 3400
Wire Wire Line
	7150 3500 6950 3500
Wire Wire Line
	7150 3600 6950 3600
Wire Wire Line
	8150 3300 8600 3300
Wire Wire Line
	8150 3200 8600 3200
Entry Wire Line
	6850 2100 6950 2200
Entry Wire Line
	6850 2200 6950 2300
Entry Wire Line
	6850 2300 6950 2400
Entry Wire Line
	6850 2400 6950 2500
Entry Wire Line
	6850 2500 6950 2600
Entry Wire Line
	6850 2600 6950 2700
Entry Wire Line
	6850 2700 6950 2800
Entry Wire Line
	6850 2800 6950 2900
Entry Wire Line
	6850 2900 6950 3000
Entry Wire Line
	6850 3000 6950 3100
Entry Wire Line
	6850 3100 6950 3200
Entry Wire Line
	6850 3200 6950 3300
Entry Wire Line
	6850 3300 6950 3400
Entry Wire Line
	6850 3400 6950 3500
Entry Wire Line
	6850 3500 6950 3600
Entry Wire Line
	8350 2200 8450 2300
Entry Wire Line
	8350 2300 8450 2400
Entry Wire Line
	8350 2400 8450 2500
Entry Wire Line
	8350 2500 8450 2600
Entry Wire Line
	8350 2600 8450 2700
Entry Wire Line
	8350 2700 8450 2800
Entry Wire Line
	8350 2800 8450 2900
Entry Wire Line
	8350 2900 8450 3000
Text Label 7050 2200 2    39   ~ 0
A1
Text Label 7050 2300 2    39   ~ 0
A2
Text Label 7050 2400 2    39   ~ 0
A3
Text Label 7050 2500 2    39   ~ 0
A4
Text Label 7050 2600 2    39   ~ 0
A5
Text Label 7050 2700 2    39   ~ 0
A6
Text Label 7050 2800 2    39   ~ 0
A7
Text Label 7050 2900 2    39   ~ 0
A8
Text Label 7050 3000 2    39   ~ 0
A9
Text Label 7100 3100 2    39   ~ 0
A10
Text Label 7100 3200 2    39   ~ 0
A11
Text GLabel 8600 3300 2    39   Input ~ 0
~READ
Text GLabel 8600 3200 2    39   Input ~ 0
~LROM
Entry Wire Line
	6850 3600 6950 3700
Entry Wire Line
	6850 3700 6950 3800
Entry Wire Line
	6850 3800 6950 3900
Entry Wire Line
	6850 3900 6950 4000
Wire Wire Line
	6950 3700 7150 3700
Wire Wire Line
	6950 3800 7150 3800
Wire Wire Line
	6950 3900 7150 3900
Wire Wire Line
	6950 4000 7150 4000
Wire Wire Line
	7650 4200 7650 4750
Connection ~ 6200 5200
Wire Bus Line
	6200 5200 8450 5200
Connection ~ 4600 1300
Wire Bus Line
	4600 1300 6850 1300
$Comp
L Aslak:SST39SF040-PC32 U19
U 1 1 83900716
P 7650 3100
F 0 "U19" H 7300 4150 50  0000 C CNN
F 1 "SST39SF040-PC32" H 8050 4150 50  0000 C CNN
F 2 "Package_LCC_local:PLCC-32_THT-Socket" H 7650 3200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 7650 3200 50  0001 C CNN
	1    7650 3100
	1    0    0    -1  
$EndComp
Text GLabel 6350 3400 2    39   Input ~ 0
~WRITE
Wire Wire Line
	5900 3400 6350 3400
Wire Wire Line
	8150 3400 8600 3400
$Comp
L Device:C C?
U 1 1 61D30C48
P 2850 3850
AR Path="/83909542/61D30C48" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/61D30C48" Ref="C?"  Part="1" 
AR Path="/838A565C/61D30C48" Ref="C32"  Part="1" 
F 0 "C32" H 2875 3950 50  0000 L CNN
F 1 "0.1u" H 2875 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2888 3700 30  0001 C CNN
F 3 "" H 2850 3850 60  0000 C CNN
	1    2850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3500 2850 3600
Wire Wire Line
	2850 4000 2850 4100
$Comp
L Device:C C?
U 1 1 61D30C56
P 3100 3850
AR Path="/83909542/61D30C56" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/61D30C56" Ref="C?"  Part="1" 
AR Path="/838A565C/61D30C56" Ref="C33"  Part="1" 
F 0 "C33" H 3125 3950 50  0000 L CNN
F 1 "0.1u" H 3125 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3138 3700 30  0001 C CNN
F 3 "" H 3100 3850 60  0000 C CNN
	1    3100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3600 3100 3600
Connection ~ 2850 3600
Wire Wire Line
	2850 3600 2850 3700
Connection ~ 2850 4100
Wire Wire Line
	2850 4100 2850 4200
Wire Wire Line
	3100 4000 3100 4100
Wire Wire Line
	3100 4100 2850 4100
Wire Wire Line
	3100 3700 3100 3600
$Comp
L power:GNDD #PWR?
U 1 1 61D30C7C
P 2850 4200
AR Path="/814D61C4/61D30C7C" Ref="#PWR?"  Part="1" 
AR Path="/7DF01BC3/61D30C7C" Ref="#PWR?"  Part="1" 
AR Path="/838A565C/61D30C7C" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 2850 3950 50  0001 C CNN
F 1 "GNDD" H 2854 4045 50  0000 C CNN
F 2 "" H 2850 4200 50  0001 C CNN
F 3 "" H 2850 4200 50  0001 C CNN
	1    2850 4200
	1    0    0    -1  
$EndComp
Text Label 4750 3300 0    39   ~ 0
A12
Text Label 4750 3400 0    39   ~ 0
A13
Text Label 4750 3500 0    39   ~ 0
A14
Text Label 4750 3600 0    39   ~ 0
A15
Text Label 4750 3700 0    39   ~ 0
A16
Text Label 4750 3800 0    39   ~ 0
A17
Text Label 4750 3900 0    39   ~ 0
A18
Text Label 4750 4000 0    39   ~ 0
A19
Text Label 7000 3300 0    39   ~ 0
A12
Text Label 7000 3400 0    39   ~ 0
A13
Text Label 7000 3500 0    39   ~ 0
A14
Text Label 7000 3600 0    39   ~ 0
A15
Text Label 7000 3700 0    39   ~ 0
A16
Text Label 7000 3800 0    39   ~ 0
A17
Text Label 7000 3900 0    39   ~ 0
A18
Text Label 7000 4000 0    39   ~ 0
A19
Wire Bus Line
	7850 5500 8250 5500
Text Label 8100 5500 2    39   ~ 0
D[0..31]
Text GLabel 8250 5500 2    39   BiDi ~ 0
D[0..31]
Wire Bus Line
	7850 5600 8250 5600
Text GLabel 8250 5600 2    39   Input ~ 0
A[0..31]
Text Label 8100 5600 2    39   ~ 0
A[0..31]
$Comp
L Aslak:SST39SF040-PC32 U20
U 1 1 839006DD
P 5400 3100
F 0 "U20" H 5050 4150 50  0000 C CNN
F 1 "SST39SF040-PC32" H 5800 4150 50  0000 C CNN
F 2 "Package_LCC_local:PLCC-32_THT-Socket" H 5400 3200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 5400 3200 50  0001 C CNN
	1    5400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2200 6100 2200
Wire Wire Line
	5900 2300 6100 2300
Wire Wire Line
	5900 2400 6100 2400
Wire Wire Line
	5900 2500 6100 2500
Wire Wire Line
	5900 2600 6100 2600
Wire Wire Line
	5900 2700 6100 2700
Wire Wire Line
	5900 2800 6100 2800
Wire Wire Line
	5900 2900 6100 2900
Wire Wire Line
	8150 2200 8350 2200
Wire Wire Line
	8150 2300 8350 2300
Wire Wire Line
	8150 2400 8350 2400
Wire Wire Line
	8150 2500 8350 2500
Wire Wire Line
	8150 2600 8350 2600
Wire Wire Line
	8150 2700 8350 2700
Wire Wire Line
	8150 2800 8350 2800
Wire Wire Line
	8150 2900 8350 2900
Text Label 5950 2200 0    39   ~ 0
D24
Text Label 5950 2300 0    39   ~ 0
D25
Text Label 5950 2400 0    39   ~ 0
D26
Text Label 5950 2500 0    39   ~ 0
D27
Text Label 5950 2600 0    39   ~ 0
D28
Text Label 5950 2700 0    39   ~ 0
D29
Text Label 5950 2800 0    39   ~ 0
D30
Text Label 5950 2900 0    39   ~ 0
D31
Text Label 8200 2200 0    39   ~ 0
D16
Text Label 8200 2300 0    39   ~ 0
D17
Text Label 8200 2400 0    39   ~ 0
D18
Text Label 8200 2500 0    39   ~ 0
D19
Text Label 8200 2600 0    39   ~ 0
D20
Text Label 8200 2700 0    39   ~ 0
D21
Text Label 8200 2800 0    39   ~ 0
D22
Text Label 8200 2900 0    39   ~ 0
D23
Wire Bus Line
	2800 5200 6200 5200
Wire Bus Line
	2800 1300 4600 1300
$Comp
L power:+5VD #PWR076
U 1 1 611F7A7C
P 2850 3500
F 0 "#PWR076" H 2850 3350 50  0001 C CNN
F 1 "+5VD" H 2850 3640 50  0000 C CNN
F 2 "" H 2850 3500 60  0000 C CNN
F 3 "" H 2850 3500 60  0000 C CNN
	1    2850 3500
	1    0    0    -1  
$EndComp
Wire Bus Line
	8450 2300 8450 5200
Wire Bus Line
	6200 2300 6200 5200
Wire Bus Line
	6850 1300 6850 3900
Wire Bus Line
	4600 1300 4600 3900
$EndSCHEMATC
