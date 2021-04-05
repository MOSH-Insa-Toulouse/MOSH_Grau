EESchema Schematic File Version 4
LIBS:shield-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9350 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
A0
Text Label 8900 2600 0    60   ~ 0
A1
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 8900 2900 0    60   ~ 0
A4(SDA)
Text Label 8900 3000 0    60   ~ 0
A5(SCL)
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10650 2450 0    60   ~ 0
3(**)
Text Label 10550 2600 0    60   ~ 0
4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 9600 1900
F 0 "P1" H 9600 2350 50  0000 C CNN
F 1 "Power" V 9700 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1900 20  0000 C CNN
F 3 "" H 9600 1900 50  0000 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" V 9150 1700 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" V 9050 1550 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR03" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR04" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 9600 2700
F 0 "P2" H 9600 2300 50  0000 C CNN
F 1 "Analog" V 9700 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2750 20  0000 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 10000 2600
F 0 "P4" H 10000 2100 50  0000 C CNN
F 1 "Digital" V 10100 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2550 20  0000 C CNN
F 3 "" H 10000 2600 50  0000 C CNN
	1    10000 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9350 1450 9350 1700
Wire Wire Line
	9350 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 10000 1600
F 0 "P3" H 10000 2150 50  0000 C CNN
F 1 "Digital" V 10100 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1600 20  0000 C CNN
F 3 "" H 10000 1600 50  0000 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1600 10550 1600
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 2200
Wire Wire Line
	9300 2200 9300 3150
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	8500 3450 11200 3450
Wire Wire Line
	9400 1800 8650 1800
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
Connection ~ 3850 2050
Wire Wire Line
	4350 2050 4350 2300
Wire Wire Line
	3850 2050 4350 2050
Wire Wire Line
	3850 2750 3850 2950
Connection ~ 3850 2750
Wire Wire Line
	4350 2750 4350 2600
Wire Wire Line
	3850 2750 4350 2750
Wire Wire Line
	3850 2600 3850 2750
Wire Wire Line
	3850 2050 3850 2300
Wire Wire Line
	3500 2050 3850 2050
Wire Wire Line
	2900 2050 3200 2050
Wire Wire Line
	2900 1600 2900 2050
Wire Wire Line
	2900 1000 2900 1300
$Comp
L power:+5V #PWR0101
U 1 1 60363EE2
P 2900 1000
F 0 "#PWR0101" H 2900 850 50  0001 C CNN
F 1 "+5V" H 2915 1173 50  0000 C CNN
F 2 "" H 2900 1000 50  0001 C CNN
F 3 "" H 2900 1000 50  0001 C CNN
	1    2900 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6036397F
P 3850 2950
F 0 "#PWR0102" H 3850 2700 50  0001 C CNN
F 1 "GND" H 3855 2777 50  0000 C CNN
F 2 "" H 3850 2950 50  0001 C CNN
F 3 "" H 3850 2950 50  0001 C CNN
	1    3850 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 60362D78
P 3850 2450
F 0 "C1" H 3965 2496 50  0000 L CNN
F 1 "100n" H 3965 2405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 3888 2300 50  0001 C CNN
F 3 "~" H 3850 2450 50  0001 C CNN
	1    3850 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 603626EB
P 4350 2450
F 0 "R1" H 4280 2404 50  0000 R CNN
F 1 "100k" H 4280 2495 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 2450 50  0001 C CNN
F 3 "~" H 4350 2450 50  0001 C CNN
	1    4350 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 60361AAE
P 3350 2050
F 0 "R5" V 3143 2050 50  0000 C CNN
F 1 "10k" V 3234 2050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3280 2050 50  0001 C CNN
F 3 "~" H 3350 2050 50  0001 C CNN
	1    3350 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R0
U 1 1 60361684
P 2900 1450
F 0 "R0" H 2970 1496 50  0000 L CNN
F 1 "Rsensor" H 2970 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2830 1450 50  0001 C CNN
F 3 "~" H 2900 1450 50  0001 C CNN
	1    2900 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2050 4350 2050
Connection ~ 4350 2050
$Comp
L shield-rescue:LTC1050-lib_projet U1
U 1 1 60372D33
P 5700 1900
F 0 "U1" H 5700 2015 50  0000 C CNN
F 1 "LTC1050" H 5700 1924 50  0000 C CNN
F 2 "Socket_Arduino_Uno:emp_LTC_1050" H 5700 1900 50  0001 C CNN
F 3 "" H 5700 1900 50  0001 C CNN
	1    5700 1900
	1    0    0    -1  
$EndComp
Wire Notes Line
	1850 750  8300 750 
Wire Notes Line
	8300 750  8300 3950
Wire Notes Line
	8300 3950 1850 3950
Wire Notes Line
	1850 3950 1850 750 
Text GLabel 4500 2050 2    50   Input ~ 0
IN+
Text GLabel 5100 2150 0    50   Input ~ 0
IN-
Text GLabel 5100 2250 0    50   Input ~ 0
IN+
$Comp
L power:GND #PWR0103
U 1 1 6037B51E
P 5000 2400
F 0 "#PWR0103" H 5000 2150 50  0001 C CNN
F 1 "GND" H 5005 2227 50  0000 C CNN
F 2 "" H 5000 2400 50  0001 C CNN
F 3 "" H 5000 2400 50  0001 C CNN
	1    5000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2150 5200 2150
Wire Wire Line
	5200 2250 5100 2250
Wire Wire Line
	5200 2350 5000 2350
Wire Wire Line
	5000 2350 5000 2400
$Comp
L power:+5V #PWR0104
U 1 1 6038010C
P 1500 900
F 0 "#PWR0104" H 1500 750 50  0001 C CNN
F 1 "+5V" H 1515 1073 50  0000 C CNN
F 2 "" H 1500 900 50  0001 C CNN
F 3 "" H 1500 900 50  0001 C CNN
	1    1500 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 603804BB
P 1150 1050
F 0 "#PWR0105" H 1150 800 50  0001 C CNN
F 1 "GND" H 1155 877 50  0000 C CNN
F 2 "" H 1150 1050 50  0001 C CNN
F 3 "" H 1150 1050 50  0001 C CNN
	1    1150 1050
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60380EB2
P 1150 900
F 0 "#FLG0101" H 1150 975 50  0001 C CNN
F 1 "PWR_FLAG" H 1150 1073 50  0000 C CNN
F 2 "" H 1150 900 50  0001 C CNN
F 3 "~" H 1150 900 50  0001 C CNN
	1    1150 900 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 603822E6
P 1500 1050
F 0 "#FLG0102" H 1500 1125 50  0001 C CNN
F 1 "PWR_FLAG" H 1500 1223 50  0000 C CNN
F 2 "" H 1500 1050 50  0001 C CNN
F 3 "~" H 1500 1050 50  0001 C CNN
	1    1500 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 900  1150 1050
Wire Wire Line
	1500 900  1500 1050
$Comp
L Device:C C3
U 1 1 603861F6
P 6600 1400
F 0 "C3" H 6715 1446 50  0000 L CNN
F 1 "100n" H 6715 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 6638 1250 50  0001 C CNN
F 3 "~" H 6600 1400 50  0001 C CNN
	1    6600 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 60386AF0
P 6850 2550
F 0 "C4" H 6965 2596 50  0000 L CNN
F 1 "1u" H 6965 2505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 6888 2400 50  0001 C CNN
F 3 "~" H 6850 2550 50  0001 C CNN
	1    6850 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 60386D3E
P 7600 2550
F 0 "C2" H 7715 2596 50  0000 L CNN
F 1 "100n" H 7715 2505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 7638 2400 50  0001 C CNN
F 3 "~" H 7600 2550 50  0001 C CNN
	1    7600 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60389667
P 6400 2550
F 0 "R3" H 6330 2504 50  0000 R CNN
F 1 "100k" H 6330 2595 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6330 2550 50  0001 C CNN
F 3 "~" H 6400 2550 50  0001 C CNN
	1    6400 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 60389B89
P 7300 2250
F 0 "R6" V 7093 2250 50  0000 C CNN
F 1 "1k" V 7184 2250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7230 2250 50  0001 C CNN
F 3 "~" H 7300 2250 50  0001 C CNN
	1    7300 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 6038C127
P 7250 2750
F 0 "R2" V 7043 2750 50  0000 C CNN
F 1 "1k" V 7134 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7180 2750 50  0001 C CNN
F 3 "~" H 7250 2750 50  0001 C CNN
	1    7250 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 2250 6400 2250
Wire Wire Line
	6400 2250 6400 2400
Connection ~ 6400 2250
Wire Wire Line
	6400 2250 6850 2250
Wire Wire Line
	6850 2250 6850 2400
Connection ~ 6850 2250
Wire Wire Line
	6850 2250 7150 2250
Wire Wire Line
	7450 2250 7600 2250
Wire Wire Line
	7600 2250 7600 2400
Wire Wire Line
	6850 2700 6850 2750
Wire Wire Line
	6850 2750 7100 2750
Wire Wire Line
	7400 2750 7600 2750
Wire Wire Line
	7600 2750 7600 2700
Wire Wire Line
	6400 2700 6400 2750
Wire Wire Line
	6400 2750 6850 2750
Connection ~ 6850 2750
Wire Wire Line
	6850 2750 6850 3100
Wire Wire Line
	7600 2750 7600 3100
Connection ~ 7600 2750
Wire Wire Line
	7600 2250 7950 2250
Connection ~ 7600 2250
Wire Wire Line
	6200 2150 6400 2150
Wire Wire Line
	6400 2150 6400 1150
Wire Wire Line
	6400 1150 6600 1150
Wire Wire Line
	6600 1150 6600 1250
Wire Wire Line
	6600 1150 6700 1150
Connection ~ 6600 1150
$Comp
L power:+5V #PWR0106
U 1 1 603A8B67
P 6700 1150
F 0 "#PWR0106" H 6700 1000 50  0001 C CNN
F 1 "+5V" H 6715 1323 50  0000 C CNN
F 2 "" H 6700 1150 50  0001 C CNN
F 3 "" H 6700 1150 50  0001 C CNN
	1    6700 1150
	1    0    0    -1  
$EndComp
Text GLabel 7950 2250 2    50   Input ~ 0
ADC
$Comp
L power:GND #PWR0107
U 1 1 603A9307
P 7600 3100
F 0 "#PWR0107" H 7600 2850 50  0001 C CNN
F 1 "GND" H 7605 2927 50  0000 C CNN
F 2 "" H 7600 3100 50  0001 C CNN
F 3 "" H 7600 3100 50  0001 C CNN
	1    7600 3100
	1    0    0    -1  
$EndComp
Text GLabel 6850 3100 3    50   Input ~ 0
IN-
Wire Notes Line
	1850 4200 8300 4200
Wire Notes Line
	8300 4200 8300 6250
Wire Notes Line
	8300 6250 1850 6250
Wire Notes Line
	1850 6250 1850 4200
$Comp
L shield-rescue:OLED_0.91-lib_projet U2
U 1 1 603AEE35
P 3150 4850
F 0 "U2" H 3100 5000 50  0000 L CNN
F 1 "OLED_0.91" H 2950 4900 50  0000 L CNN
F 2 "Socket_Arduino_Uno:emp_bluetooth_HC05" H 3154 4948 50  0001 C CNN
F 3 "" H 3154 4948 50  0001 C CNN
	1    3150 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 603B46F6
P 2550 5300
F 0 "#PWR0108" H 2550 5050 50  0001 C CNN
F 1 "GND" H 2555 5127 50  0000 C CNN
F 2 "" H 2550 5300 50  0001 C CNN
F 3 "" H 2550 5300 50  0001 C CNN
	1    2550 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 603B4B68
P 2250 5100
F 0 "#PWR0109" H 2250 4950 50  0001 C CNN
F 1 "+5V" H 2265 5273 50  0000 C CNN
F 2 "" H 2250 5100 50  0001 C CNN
F 3 "" H 2250 5100 50  0001 C CNN
	1    2250 5100
	1    0    0    -1  
$EndComp
Text GLabel 2600 4900 0    50   Input ~ 0
SDA
Text GLabel 2600 5000 0    50   Input ~ 0
SCK
Wire Wire Line
	2600 4900 2700 4900
Wire Wire Line
	2600 5000 2700 5000
Wire Wire Line
	2250 5100 2700 5100
Wire Wire Line
	2700 5200 2550 5200
Wire Wire Line
	2550 5200 2550 5300
$Comp
L shield-rescue:Bluetooth_HC05-lib_projet U3
U 1 1 603C7C4E
P 4600 4800
F 0 "U3" H 4550 4900 50  0000 L CNN
F 1 "Bluetooth_HC05" H 4300 4800 50  0000 L CNN
F 2 "Socket_Arduino_Uno:emp_bluetooth_HC05" H 4600 4800 50  0001 C CNN
F 3 "" H 4600 4800 50  0001 C CNN
	1    4600 4800
	1    0    0    -1  
$EndComp
$Comp
L shield-rescue:KY_040-lib_projet U4
U 1 1 603C9A75
P 6400 4750
F 0 "U4" H 6350 4900 50  0000 L CNN
F 1 "KY_040" H 6250 4750 50  0000 L CNN
F 2 "Socket_Arduino_Uno:KY_040" H 6400 4750 50  0001 C CNN
F 3 "" H 6400 4750 50  0001 C CNN
	1    6400 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 603CAA8C
P 5550 5350
F 0 "#PWR0110" H 5550 5100 50  0001 C CNN
F 1 "GND" H 5555 5177 50  0000 C CNN
F 2 "" H 5550 5350 50  0001 C CNN
F 3 "" H 5550 5350 50  0001 C CNN
	1    5550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 603CAF14
P 5250 5150
F 0 "#PWR0111" H 5250 5000 50  0001 C CNN
F 1 "+5V" H 5265 5323 50  0000 C CNN
F 2 "" H 5250 5150 50  0001 C CNN
F 3 "" H 5250 5150 50  0001 C CNN
	1    5250 5150
	1    0    0    -1  
$EndComp
Text GLabel 5700 5050 0    50   Input ~ 0
SWITCH
Text GLabel 5700 4950 0    50   Input ~ 0
DATA
Text GLabel 5700 4850 0    50   Input ~ 0
CLK
$Comp
L power:+5V #PWR0112
U 1 1 603CE4B5
P 3700 4850
F 0 "#PWR0112" H 3700 4700 50  0001 C CNN
F 1 "+5V" H 3715 5023 50  0000 C CNN
F 2 "" H 3700 4850 50  0001 C CNN
F 3 "" H 3700 4850 50  0001 C CNN
	1    3700 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 603CE859
P 3650 5000
F 0 "#PWR0113" H 3650 4750 50  0001 C CNN
F 1 "GND" H 3655 4827 50  0000 C CNN
F 2 "" H 3650 5000 50  0001 C CNN
F 3 "" H 3650 5000 50  0001 C CNN
	1    3650 5000
	1    0    0    -1  
$EndComp
Text GLabel 3950 5100 0    50   Input ~ 0
RX
Text GLabel 3950 5200 0    50   Input ~ 0
TX
Wire Wire Line
	3700 4850 3700 4900
Wire Wire Line
	3700 4900 4100 4900
Wire Wire Line
	3650 5000 4100 5000
Wire Wire Line
	3950 5100 4100 5100
Wire Wire Line
	3950 5200 4100 5200
Wire Wire Line
	5550 5350 5550 5250
Wire Wire Line
	5550 5250 5850 5250
Wire Wire Line
	5250 5150 5850 5150
Wire Wire Line
	5700 5050 5850 5050
Wire Wire Line
	5700 4950 5850 4950
Wire Wire Line
	5700 4850 5850 4850
$Comp
L power:GND #PWR0114
U 1 1 603F3828
P 6600 1650
F 0 "#PWR0114" H 6600 1400 50  0001 C CNN
F 1 "GND" H 6605 1477 50  0000 C CNN
F 2 "" H 6600 1650 50  0001 C CNN
F 3 "" H 6600 1650 50  0001 C CNN
	1    6600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1550 6600 1650
NoConn ~ 8650 1800
Text GLabel 8800 2500 0    50   Input ~ 0
ADC
Text GLabel 8800 2900 0    50   Input ~ 0
SDA
Text GLabel 8800 3000 0    50   Input ~ 0
SCK
NoConn ~ 8900 2600
NoConn ~ 8900 2700
NoConn ~ 8900 2800
Wire Wire Line
	8800 2500 9400 2500
Wire Wire Line
	8800 2900 9400 2900
Wire Wire Line
	8800 3000 9400 3000
NoConn ~ 10550 1200
NoConn ~ 10550 1300
NoConn ~ 10550 1400
NoConn ~ 10550 1600
NoConn ~ 10550 1700
Text GLabel 10700 1800 2    50   Input ~ 0
TX
Text GLabel 10700 1900 2    50   Input ~ 0
RX
NoConn ~ 10550 2000
NoConn ~ 10550 2100
NoConn ~ 10550 2300
NoConn ~ 10550 2400
NoConn ~ 10550 2500
Text GLabel 10700 2800 2    50   Input ~ 0
SWITCH
Text GLabel 10700 2700 2    50   Input ~ 0
DATA
Text GLabel 10700 2600 2    50   Input ~ 0
CLK
Wire Wire Line
	10200 2600 10700 2600
Wire Wire Line
	10200 2700 10700 2700
Wire Wire Line
	10200 2800 10700 2800
NoConn ~ 10550 2900
NoConn ~ 10550 3000
Wire Wire Line
	10200 1800 10700 1800
Wire Wire Line
	10200 1900 10700 1900
NoConn ~ 9350 1450
NoConn ~ 8950 1450
NoConn ~ 9150 1450
NoConn ~ 6200 2350
$EndSCHEMATC
