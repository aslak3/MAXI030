EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 14
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
L Connector_Generic:Conn_02x20_Odd_Even P?
U 1 1 82779248
P 6650 3750
AR Path="/7DF01BC3/82779248" Ref="P?"  Part="1" 
AR Path="/82769150/82779248" Ref="P2"  Part="1" 
F 0 "P2" H 6700 2650 50  0000 C CNN
F 1 "CONN_02X20_IDE" H 6700 4800 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x20_P2.54mm_Vertical" H 6650 2800 60  0001 C CNN
F 3 "" H 6650 2800 60  0000 C CNN
	1    6650 3750
	1    0    0    -1  
$EndComp
Text GLabel 5550 2850 0    39   Input ~ 0
~RESET
Text GLabel 7100 4650 2    39   Input ~ 0
~IDE3CS
NoConn ~ 6950 4350
NoConn ~ 6950 4450
NoConn ~ 6950 4150
Wire Wire Line
	6450 2850 5550 2850
Wire Wire Line
	7650 3750 7650 3700
Wire Wire Line
	6450 3950 6300 3950
Wire Wire Line
	6450 4050 6300 4050
Wire Wire Line
	6450 4650 6300 4650
Wire Wire Line
	6950 3850 7100 3850
Wire Wire Line
	6950 3950 7100 3950
Wire Wire Line
	7100 4050 6950 4050
Wire Wire Line
	7100 3850 7100 3950
Connection ~ 7100 3950
Wire Wire Line
	7300 3850 7300 3900
Connection ~ 7100 3850
Wire Wire Line
	6950 4650 7100 4650
Wire Wire Line
	7150 4750 7150 5050
Wire Wire Line
	6950 4250 7100 4250
Wire Wire Line
	7100 4250 7100 4300
Wire Wire Line
	6950 4750 7150 4750
Wire Wire Line
	7050 4950 7300 4950
Wire Wire Line
	7300 4950 7300 4900
$Comp
L power:+5VD #PWR?
U 1 1 8277929B
P 7300 4900
AR Path="/7DF01BC3/8277929B" Ref="#PWR?"  Part="1" 
AR Path="/82769150/8277929B" Ref="#PWR048"  Part="1" 
AR Path="/8277929B" Ref="#PWR?"  Part="1" 
F 0 "#PWR048" H 7300 4750 50  0001 C CNN
F 1 "+5VD" H 7300 5040 50  0000 C CNN
F 2 "" H 7300 4900 60  0000 C CNN
F 3 "" H 7300 4900 60  0000 C CNN
	1    7300 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3950 7100 4050
Wire Wire Line
	7100 3850 7300 3850
Wire Wire Line
	6600 4950 6750 4950
Wire Wire Line
	6950 3750 7650 3750
Entry Wire Line
	7350 2950 7450 2850
Entry Wire Line
	7350 3050 7450 2950
Entry Wire Line
	7350 3150 7450 3050
Entry Wire Line
	7350 3250 7450 3150
Entry Wire Line
	7350 3350 7450 3250
Entry Wire Line
	7350 3450 7450 3350
Entry Wire Line
	7350 3550 7450 3450
Entry Wire Line
	7350 3650 7450 3550
Wire Wire Line
	6200 4750 6450 4750
$Comp
L Device:R R?
U 1 1 827792C2
P 6900 4950
AR Path="/7DF01BC3/827792C2" Ref="R?"  Part="1" 
AR Path="/82769150/827792C2" Ref="R7"  Part="1" 
F 0 "R7" V 6980 4950 50  0000 C CNN
F 1 "1K" V 6800 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6830 4950 30  0001 C CNN
F 3 "" H 6900 4950 30  0000 C CNN
	1    6900 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 4950 6200 4750
Wire Wire Line
	6200 4950 6300 4950
$Comp
L Device:LED D?
U 1 1 827792CA
P 6450 4950
AR Path="/7DF01BC3/827792CA" Ref="D?"  Part="1" 
AR Path="/82769150/827792CA" Ref="D2"  Part="1" 
F 0 "D2" H 6450 5050 50  0000 C CNN
F 1 "IDELED" H 6450 4850 50  0000 C CNN
F 2 "LED_SMD:LED_1210_3225Metric" H 6450 4950 60  0001 C CNN
F 3 "" H 6450 4950 60  0000 C CNN
	1    6450 4950
	1    0    0    1   
$EndComp
Entry Wire Line
	5800 3550 5700 3650
Entry Wire Line
	5800 3450 5700 3550
Entry Wire Line
	5800 3350 5700 3450
Entry Wire Line
	5800 3250 5700 3350
Entry Wire Line
	5800 3150 5700 3250
Entry Wire Line
	5800 3050 5700 3150
Entry Wire Line
	5800 2950 5700 3050
Entry Wire Line
	5800 3650 5700 3750
Wire Wire Line
	5900 3750 6450 3750
$Comp
L Device:R R?
U 1 1 827792E1
P 5600 4600
AR Path="/7DF01BC3/827792E1" Ref="R?"  Part="1" 
AR Path="/82769150/827792E1" Ref="R6"  Part="1" 
F 0 "R6" H 5450 4700 50  0000 C CNN
F 1 "4.7K" H 5750 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5530 4600 30  0001 C CNN
F 3 "" H 5600 4600 30  0000 C CNN
	1    5600 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 4350 6450 4350
Wire Wire Line
	5600 4450 5600 4350
Connection ~ 5600 4350
Wire Wire Line
	5500 4350 5600 4350
Text GLabel 5500 4350 0    39   Output ~ 0
IDEIRQ
Text GLabel 6300 4650 0    39   Input ~ 0
~IDE1CS
Text GLabel 6300 3950 0    39   Input ~ 0
~IDEWRITE
Text GLabel 6300 4050 0    39   Input ~ 0
~IDEREAD
Wire Wire Line
	7600 2800 7600 2700
Wire Wire Line
	7600 2700 7250 2700
Wire Wire Line
	7250 2700 7250 2850
Wire Wire Line
	7250 2850 6950 2850
$Comp
L 74xx:74HC245 U?
U 1 1 82779321
P 3800 2650
AR Path="/7DF01BC3/82779321" Ref="U?"  Part="1" 
AR Path="/82769150/82779321" Ref="U7"  Part="1" 
F 0 "U7" H 3550 3300 50  0000 C CNN
F 1 "74HCT245" H 4000 3300 50  0000 C CNN
F 2 "SOs:SO-20_5.3x12.6mm_P1.27mm" H 3800 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 3800 2650 50  0001 C CNN
	1    3800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1850 3800 1750
Wire Wire Line
	4300 2150 4500 2150
Wire Wire Line
	4300 2250 4500 2250
Wire Wire Line
	4300 2350 4500 2350
Wire Wire Line
	4300 2450 4500 2450
Wire Wire Line
	4300 2550 4500 2550
Wire Wire Line
	4300 2650 4500 2650
Wire Wire Line
	4300 2750 4500 2750
Wire Wire Line
	4300 2850 4500 2850
Wire Wire Line
	3300 3050 2750 3050
Wire Wire Line
	3300 3150 2750 3150
Entry Wire Line
	4500 2150 4600 2050
Entry Wire Line
	4500 2250 4600 2150
Entry Wire Line
	4500 2350 4600 2250
Entry Wire Line
	4500 2450 4600 2350
Entry Wire Line
	4500 2550 4600 2450
Entry Wire Line
	4500 2650 4600 2550
Entry Wire Line
	4500 2750 4600 2650
Entry Wire Line
	4500 2850 4600 2750
Entry Wire Line
	2950 2150 2850 2050
Entry Wire Line
	2950 2250 2850 2150
Entry Wire Line
	2950 2350 2850 2250
Entry Wire Line
	2950 2450 2850 2350
Entry Wire Line
	2950 2550 2850 2450
Entry Wire Line
	2950 2650 2850 2550
Entry Wire Line
	2950 2750 2850 2650
Entry Wire Line
	2950 2850 2850 2750
$Comp
L power:+5VD #PWR?
U 1 1 82779342
P 3800 1750
AR Path="/7DF01BC3/82779342" Ref="#PWR?"  Part="1" 
AR Path="/82769150/82779342" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 3800 1600 50  0001 C CNN
F 1 "+5VD" H 3800 1890 50  0000 C CNN
F 2 "" H 3800 1750 60  0000 C CNN
F 3 "" H 3800 1750 60  0000 C CNN
	1    3800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3550 3800 3450
$Comp
L 74xx:74HC245 U?
U 1 1 8277934F
P 3800 4900
AR Path="/7DF01BC3/8277934F" Ref="U?"  Part="1" 
AR Path="/82769150/8277934F" Ref="U8"  Part="1" 
F 0 "U8" H 3550 5550 50  0000 C CNN
F 1 "74HCT245" H 4000 5550 50  0000 C CNN
F 2 "SOs:SO-20_5.3x12.6mm_P1.27mm" H 3800 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 3800 4900 50  0001 C CNN
	1    3800 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4100 3800 4000
Wire Wire Line
	4300 4400 4500 4400
Wire Wire Line
	4300 4500 4500 4500
Wire Wire Line
	4300 4600 4500 4600
Wire Wire Line
	4300 4700 4500 4700
Wire Wire Line
	4300 4800 4500 4800
Wire Wire Line
	4300 4900 4500 4900
Wire Wire Line
	4300 5000 4500 5000
Wire Wire Line
	4300 5100 4500 5100
Wire Wire Line
	3300 5300 2750 5300
Wire Wire Line
	3300 5400 2750 5400
Text GLabel 2750 5400 0    39   Input ~ 0
~IDECS
Entry Wire Line
	4500 4400 4600 4300
Entry Wire Line
	4500 4500 4600 4400
Entry Wire Line
	4500 4600 4600 4500
Entry Wire Line
	4500 4700 4600 4600
Entry Wire Line
	4500 4800 4600 4700
Entry Wire Line
	4500 4900 4600 4800
Entry Wire Line
	4500 5000 4600 4900
Entry Wire Line
	4500 5100 4600 5000
Entry Wire Line
	2950 4400 2850 4300
Entry Wire Line
	2950 4500 2850 4400
Entry Wire Line
	2950 4600 2850 4500
Entry Wire Line
	2950 4700 2850 4600
Entry Wire Line
	2950 4800 2850 4700
Entry Wire Line
	2950 4900 2850 4800
Entry Wire Line
	2950 5000 2850 4900
Entry Wire Line
	2950 5100 2850 5000
$Comp
L power:+5VD #PWR?
U 1 1 82779372
P 3800 4000
AR Path="/7DF01BC3/82779372" Ref="#PWR?"  Part="1" 
AR Path="/82769150/82779372" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 3800 3850 50  0001 C CNN
F 1 "+5VD" H 3800 4140 50  0000 C CNN
F 2 "" H 3800 4000 60  0000 C CNN
F 3 "" H 3800 4000 60  0000 C CNN
	1    3800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5800 3800 5700
Wire Wire Line
	2950 2150 3300 2150
Wire Wire Line
	2950 2250 3300 2250
Wire Wire Line
	2950 2350 3300 2350
Wire Wire Line
	2950 2450 3300 2450
Wire Wire Line
	2950 2550 3300 2550
Wire Wire Line
	2950 2650 3300 2650
Wire Wire Line
	2950 2750 3300 2750
Wire Wire Line
	2950 2850 3300 2850
Wire Wire Line
	2950 4500 3300 4500
Wire Wire Line
	2950 4600 3300 4600
Wire Wire Line
	2950 4700 3300 4700
Wire Wire Line
	2950 4800 3300 4800
Wire Wire Line
	2950 4900 3300 4900
Wire Wire Line
	2950 5000 3300 5000
Wire Wire Line
	2950 5100 3300 5100
Text Label 3050 2150 0    39   ~ 0
IDED0
Text Label 3050 2250 0    39   ~ 0
IDED1
Text Label 3050 2350 0    39   ~ 0
IDED2
Text Label 3050 2450 0    39   ~ 0
IDED3
Text Label 3050 2550 0    39   ~ 0
IDED4
Text Label 3050 2650 0    39   ~ 0
IDED5
Text Label 3050 2750 0    39   ~ 0
IDED6
Text Label 3050 2850 0    39   ~ 0
IDED7
Wire Wire Line
	2950 4400 3300 4400
Text GLabel 2750 3150 0    39   Input ~ 0
~IDECS
Text Label 5850 3150 0    39   ~ 0
IDED13
Text Label 5850 3250 0    39   ~ 0
IDED12
Text Label 5850 3350 0    39   ~ 0
IDED11
Text Label 5850 3450 0    39   ~ 0
IDED10
Text Label 5850 3550 0    39   ~ 0
IDED9
Text Label 5850 3650 0    39   ~ 0
IDED8
Text Label 7100 2950 0    39   ~ 0
IDED0
Text Label 7100 3050 0    39   ~ 0
IDED1
Text Label 7100 3150 0    39   ~ 0
IDED2
Text Label 7100 3250 0    39   ~ 0
IDED3
Text Label 7100 3350 0    39   ~ 0
IDED4
Text Label 7100 3450 0    39   ~ 0
IDED5
Text Label 7100 3550 0    39   ~ 0
IDED6
Text Label 7100 3650 0    39   ~ 0
IDED7
Text Label 5850 3050 0    39   ~ 0
IDED14
Text Label 5850 2950 0    39   ~ 0
IDED15
Text Label 3050 4400 0    39   ~ 0
IDED8
Text Label 3050 4500 0    39   ~ 0
IDED9
Text Label 3050 4600 0    39   ~ 0
IDED10
Text Label 3050 4700 0    39   ~ 0
IDED11
Text Label 3050 4800 0    39   ~ 0
IDED12
Text Label 3050 4900 0    39   ~ 0
IDED13
Text Label 3050 5000 0    39   ~ 0
IDED14
Text Label 3050 5100 0    39   ~ 0
IDED15
Text Label 4350 2150 0    50   ~ 0
D16
Text Label 4350 2250 0    50   ~ 0
D17
Text Label 4350 2350 0    50   ~ 0
D18
Text Label 4350 2450 0    50   ~ 0
D19
Text Label 4350 2550 0    50   ~ 0
D20
Text Label 4350 2650 0    50   ~ 0
D21
Text Label 4350 2750 0    50   ~ 0
D22
Text Label 4350 2850 0    50   ~ 0
D23
Text Label 4300 4400 0    50   ~ 0
D24
Text Label 4300 4500 0    50   ~ 0
D25
Text Label 4300 4600 0    50   ~ 0
D26
Text Label 4300 4700 0    50   ~ 0
D27
Text Label 4300 4800 0    50   ~ 0
D28
Text Label 4300 4900 0    50   ~ 0
D29
Text Label 4300 5000 0    50   ~ 0
D30
Text Label 4300 5100 0    50   ~ 0
D31
Wire Bus Line
	6750 5850 7150 5850
Text Label 7000 5850 2    39   ~ 0
D[0..31]
Text GLabel 7150 5850 2    39   BiDi ~ 0
D[0..31]
Wire Bus Line
	6750 5950 7150 5950
Text GLabel 7150 5950 2    39   Input ~ 0
A[0..31]
Text Label 7000 5950 2    39   ~ 0
A[0..31]
Wire Wire Line
	5600 4850 5900 4850
Wire Wire Line
	5600 4750 5600 4850
Wire Wire Line
	5900 3750 5900 4850
$Comp
L power:GNDD #PWR039
U 1 1 6085CD75
P 3800 3550
F 0 "#PWR039" H 3800 3300 50  0001 C CNN
F 1 "GNDD" H 3804 3395 50  0000 C CNN
F 2 "" H 3800 3550 50  0001 C CNN
F 3 "" H 3800 3550 50  0001 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR041
U 1 1 6085D423
P 3800 5800
F 0 "#PWR041" H 3800 5550 50  0001 C CNN
F 1 "GNDD" H 3804 5645 50  0000 C CNN
F 2 "" H 3800 5800 50  0001 C CNN
F 3 "" H 3800 5800 50  0001 C CNN
	1    3800 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR046
U 1 1 6085E3E8
P 7150 5050
F 0 "#PWR046" H 7150 4800 50  0001 C CNN
F 1 "GNDD" H 7154 4895 50  0000 C CNN
F 2 "" H 7150 5050 50  0001 C CNN
F 3 "" H 7150 5050 50  0001 C CNN
	1    7150 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR045
U 1 1 608683DE
P 7100 4300
F 0 "#PWR045" H 7100 4050 50  0001 C CNN
F 1 "GNDD" H 7104 4145 50  0000 C CNN
F 2 "" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0001 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR047
U 1 1 6086947F
P 7300 3900
F 0 "#PWR047" H 7300 3650 50  0001 C CNN
F 1 "GNDD" H 7304 3745 50  0000 C CNN
F 2 "" H 7300 3900 50  0001 C CNN
F 3 "" H 7300 3900 50  0001 C CNN
	1    7300 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR049
U 1 1 6086A785
P 7600 2800
F 0 "#PWR049" H 7600 2550 50  0001 C CNN
F 1 "GNDD" H 7604 2645 50  0000 C CNN
F 2 "" H 7600 2800 50  0001 C CNN
F 3 "" H 7600 2800 50  0001 C CNN
	1    7600 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR044
U 1 1 61F49F80
P 5900 5100
F 0 "#PWR044" H 5900 4850 50  0001 C CNN
F 1 "GNDD" H 5904 4945 50  0000 C CNN
F 2 "" H 5900 5100 50  0001 C CNN
F 3 "" H 5900 5100 50  0001 C CNN
	1    5900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4850 5900 5100
Connection ~ 5900 4850
Text GLabel 2750 3050 0    39   Input ~ 0
~IDEWRITE
$Comp
L power:+5VD #PWR?
U 1 1 60DFA8C7
P 7650 3700
AR Path="/7DF01BC3/60DFA8C7" Ref="#PWR?"  Part="1" 
AR Path="/82769150/60DFA8C7" Ref="#PWR050"  Part="1" 
AR Path="/60DFA8C7" Ref="#PWR?"  Part="1" 
F 0 "#PWR050" H 7650 3550 50  0001 C CNN
F 1 "+5VD" H 7650 3840 50  0000 C CNN
F 2 "" H 7650 3700 60  0000 C CNN
F 3 "" H 7650 3700 60  0000 C CNN
	1    7650 3700
	1    0    0    -1  
$EndComp
Text GLabel 2750 5300 0    39   Input ~ 0
~IDEWRITE
$Comp
L Device:C C?
U 1 1 614BFCFB
P 1900 3850
AR Path="/83909542/614BFCFB" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/614BFCFB" Ref="C?"  Part="1" 
AR Path="/838A565C/614BFCFB" Ref="C?"  Part="1" 
AR Path="/82769150/614BFCFB" Ref="C22"  Part="1" 
F 0 "C22" H 1925 3950 50  0000 L CNN
F 1 "0.1u" H 1925 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1938 3700 30  0001 C CNN
F 3 "" H 1900 3850 60  0000 C CNN
	1    1900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3500 1900 3600
Wire Wire Line
	1900 4000 1900 4100
$Comp
L Device:C C?
U 1 1 614BFD03
P 2150 3850
AR Path="/83909542/614BFD03" Ref="C?"  Part="1" 
AR Path="/7DF01BC3/614BFD03" Ref="C?"  Part="1" 
AR Path="/838A565C/614BFD03" Ref="C?"  Part="1" 
AR Path="/82769150/614BFD03" Ref="C23"  Part="1" 
F 0 "C23" H 2175 3950 50  0000 L CNN
F 1 "0.1u" H 2175 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2188 3700 30  0001 C CNN
F 3 "" H 2150 3850 60  0000 C CNN
	1    2150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3600 2150 3600
Connection ~ 1900 3600
Wire Wire Line
	1900 3600 1900 3700
Connection ~ 1900 4100
Wire Wire Line
	1900 4100 1900 4200
Wire Wire Line
	2150 4000 2150 4100
Wire Wire Line
	2150 4100 1900 4100
Wire Wire Line
	2150 3700 2150 3600
$Comp
L power:GNDD #PWR?
U 1 1 614BFD11
P 1900 4200
AR Path="/814D61C4/614BFD11" Ref="#PWR?"  Part="1" 
AR Path="/7DF01BC3/614BFD11" Ref="#PWR?"  Part="1" 
AR Path="/838A565C/614BFD11" Ref="#PWR?"  Part="1" 
AR Path="/82769150/614BFD11" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 1900 3950 50  0001 C CNN
F 1 "GNDD" H 1904 4045 50  0000 C CNN
F 2 "" H 1900 4200 50  0001 C CNN
F 3 "" H 1900 4200 50  0001 C CNN
	1    1900 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR?
U 1 1 614BFD17
P 1900 3500
AR Path="/838A565C/614BFD17" Ref="#PWR?"  Part="1" 
AR Path="/82769150/614BFD17" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 1900 3350 50  0001 C CNN
F 1 "+5VD" H 1900 3640 50  0000 C CNN
F 2 "" H 1900 3500 60  0000 C CNN
F 3 "" H 1900 3500 60  0000 C CNN
	1    1900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2950 6450 2950
Wire Wire Line
	5800 3050 6450 3050
Wire Wire Line
	5800 3150 6450 3150
Wire Wire Line
	5800 3250 6450 3250
Wire Wire Line
	5800 3350 6450 3350
Wire Wire Line
	5800 3450 6450 3450
Wire Wire Line
	5800 3550 6450 3550
Wire Wire Line
	5800 3650 6450 3650
Wire Wire Line
	6950 2950 7350 2950
Wire Wire Line
	6950 3050 7350 3050
Wire Wire Line
	6950 3150 7350 3150
Wire Wire Line
	6950 3250 7350 3250
Wire Wire Line
	6950 3350 7350 3350
Wire Wire Line
	6950 3450 7350 3450
Wire Wire Line
	6950 3550 7350 3550
Wire Wire Line
	6950 3650 7350 3650
Wire Wire Line
	6950 4550 7450 4550
Text Label 7350 4550 0    50   ~ 0
A4
Text Label 6150 4550 0    50   ~ 0
A2
Text Label 6150 4450 0    50   ~ 0
A3
Wire Wire Line
	6150 4450 6450 4450
Wire Wire Line
	6150 4550 6450 4550
Wire Wire Line
	6450 3850 6300 3850
Text GLabel 6300 3850 0    39   Output ~ 0
~IDEDMAREQ
Wire Wire Line
	6450 4250 6300 4250
Text GLabel 6300 4250 0    39   Input ~ 0
~IDEDMAACK
Wire Wire Line
	6450 4150 6300 4150
Text GLabel 6300 4150 0    39   Output ~ 0
~IDEREADY
Wire Bus Line
	5700 3050 5700 3800
Wire Bus Line
	7450 2800 7450 3550
Wire Bus Line
	4600 2050 4600 5000
Wire Bus Line
	2850 2050 2850 5000
$EndSCHEMATC