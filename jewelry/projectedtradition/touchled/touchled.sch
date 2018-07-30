EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L touch:TPP223-BA6 U1
U 1 1 5B1035E1
P 4450 2200
F 0 "U1" H 4500 1750 50  0000 C CNN
F 1 "TPP223-BA6" H 4700 1650 50  0000 C CNN
F 2 "touchled:SOT-223-6-extraspace" H 4150 2300 50  0001 C CNN
F 3 "" H 4150 2300 50  0001 C CNN
	1    4450 2200
	1    0    0    -1  
$EndComp
$Comp
L device:C C1
U 1 1 5B1039DE
P 3750 2450
F 0 "C1" H 3865 2496 50  0000 L CNN
F 1 "47pF" H 3865 2405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3788 2300 50  0001 C CNN
F 3 "" H 3750 2450 50  0001 C CNN
	1    3750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2200 3750 2200
Wire Wire Line
	3750 2200 3750 2300
$Comp
L power:GND #PWR0101
U 1 1 5B103A78
P 3750 2800
F 0 "#PWR0101" H 3750 2550 50  0001 C CNN
F 1 "GND" H 3755 2627 50  0000 C CNN
F 2 "" H 3750 2800 50  0001 C CNN
F 3 "" H 3750 2800 50  0001 C CNN
	1    3750 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2800 3750 2700
Wire Wire Line
	4350 2600 4350 2700
Wire Wire Line
	4350 2700 3750 2700
Connection ~ 3750 2700
Wire Wire Line
	3750 2700 3750 2600
$Comp
L power:VDD #PWR0102
U 1 1 5B103B7B
P 4350 1550
F 0 "#PWR0102" H 4350 1400 50  0001 C CNN
F 1 "VDD" H 4367 1723 50  0000 C CNN
F 2 "" H 4350 1550 50  0001 C CNN
F 3 "" H 4350 1550 50  0001 C CNN
	1    4350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1550 4350 1650
Wire Wire Line
	4750 2250 4950 2250
Wire Wire Line
	4950 2250 4950 1650
Wire Wire Line
	4950 1650 4350 1650
Connection ~ 4350 1650
Wire Wire Line
	4350 1650 4350 1750
Connection ~ 3750 2200
$Comp
L power:GND #PWR0104
U 1 1 5B107743
P 1350 2450
F 0 "#PWR0104" H 1350 2200 50  0001 C CNN
F 1 "GND" H 1355 2277 50  0000 C CNN
F 2 "" H 1350 2450 50  0001 C CNN
F 3 "" H 1350 2450 50  0001 C CNN
	1    1350 2450
	1    0    0    -1  
$EndComp
Text Notes 2600 2500 0    50   ~ 0
Touch sensitivity\n0-50 pF recommended\n200 pF tested
$Comp
L conn:Conn_01x01 J3
U 1 1 5B12E8EB
P 3350 2200
F 0 "J3" H 3270 1975 50  0000 C CNN
F 1 "SENSE" H 3270 2066 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch1.27mm" H 3350 2200 50  0001 C CNN
F 3 "~" H 3350 2200 50  0001 C CNN
	1    3350 2200
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR0103
U 1 1 5B12F0ED
P 1350 1650
F 0 "#PWR0103" H 1350 1500 50  0001 C CNN
F 1 "VDD" H 1367 1823 50  0000 C CNN
F 2 "" H 1350 1650 50  0001 C CNN
F 3 "" H 1350 1650 50  0001 C CNN
	1    1350 1650
	1    0    0    -1  
$EndComp
Connection ~ 1350 2300
Wire Wire Line
	1350 2300 1350 2450
Wire Wire Line
	1350 1650 1350 1850
Connection ~ 1350 1850
Wire Wire Line
	3550 2200 3750 2200
Text Notes 4550 1600 0    50   ~ 0
For instantious, cut TOG trace\n
Text Label 3800 2200 0    50   ~ 0
sensor
$Comp
L device:Battery_Cell BT1
U 1 1 5B13A4CA
P 1800 2150
F 0 "BT1" H 1918 2246 50  0000 L CNN
F 1 "CR2032" H 1918 2155 50  0000 L CNN
F 2 "touchled:BK-913" V 1800 2210 50  0001 C CNN
F 3 "" V 1800 2210 50  0001 C CNN
	1    1800 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1950 1800 1850
Wire Wire Line
	1800 1850 1350 1850
Wire Wire Line
	1800 2250 1800 2300
Wire Wire Line
	1800 2300 1350 2300
$Comp
L device:C C2
U 1 1 5B3E150B
P 1350 2100
F 0 "C2" H 1465 2146 50  0000 L CNN
F 1 "1uF" H 1465 2055 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 1388 1950 50  0001 C CNN
F 3 "" H 1350 2100 50  0001 C CNN
	1    1350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2250 1350 2300
Wire Wire Line
	1350 1950 1350 1850
$Comp
L touch:AP3019A U2
U 1 1 5B3E3AAA
P 7950 2300
F 0 "U2" H 7600 2000 50  0000 L CNN
F 1 "AP3019A" H 8100 2000 50  0000 L CNN
F 2 "touchled:SOT-223-6-extraspace" H 7700 2350 50  0001 C CNN
F 3 "" H 7700 2350 50  0001 C CNN
	1    7950 2300
	1    0    0    -1  
$EndComp
Text Notes 9600 2700 0    50   ~ 0
Iout=200mV/R
$Comp
L device:R R1
U 1 1 5B3E3C95
P 9300 2700
F 0 "R1" H 9370 2746 50  0000 L CNN
F 1 "12R" H 9370 2655 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9230 2700 50  0001 C CNN
F 3 "" H 9300 2700 50  0001 C CNN
	1    9300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2950 7950 2700
Wire Wire Line
	8150 1400 8150 1850
$Comp
L device:C C4
U 1 1 5B3E6D65
P 8700 2700
F 0 "C4" H 8815 2746 50  0000 L CNN
F 1 "1uF" H 8815 2655 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 8738 2550 50  0001 C CNN
F 3 "" H 8700 2700 50  0001 C CNN
	1    8700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2950 8700 2950
Wire Wire Line
	8700 2850 8700 2950
Connection ~ 8700 2950
Text Label 9300 1400 2    50   ~ 0
LED+
Text Label 9300 1800 2    50   ~ 0
LED-
$Comp
L device:C C3
U 1 1 5B3EE104
P 7150 2700
F 0 "C3" H 7265 2746 50  0000 L CNN
F 1 "1uF" H 7265 2655 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7188 2550 50  0001 C CNN
F 3 "" H 7150 2700 50  0001 C CNN
	1    7150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2850 7150 2950
Wire Wire Line
	7150 2950 7950 2950
Connection ~ 7950 2950
Wire Wire Line
	7150 2550 7150 2200
$Comp
L device:L_Core_Ferrite L1
U 1 1 5B3EF485
P 7500 1500
F 0 "L1" H 7459 1454 50  0000 R CNN
F 1 "L" H 7459 1545 50  0000 R CNN
F 2 "Inductors:Inductor_1212" H 7500 1500 50  0001 C CNN
F 3 "" H 7500 1500 50  0001 C CNN
	1    7500 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 1500 7800 1500
Wire Wire Line
	7800 1500 7800 1850
Wire Wire Line
	7350 1500 7150 1500
Wire Wire Line
	7350 2200 7150 2200
Connection ~ 7150 2200
Wire Wire Line
	7150 2200 7150 1500
Text Notes 7700 1200 0    50   ~ 0
Vin=2.5-16V
$Comp
L power:GND #PWR0105
U 1 1 5B3F2F42
P 7950 3100
F 0 "#PWR0105" H 7950 2850 50  0001 C CNN
F 1 "GND" H 7955 2927 50  0000 C CNN
F 2 "" H 7950 3100 50  0001 C CNN
F 3 "" H 7950 3100 50  0001 C CNN
	1    7950 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3100 7950 2950
Text Notes 700  1050 0    118  ~ 0
Battery holder
Text Notes 3300 1050 0    118  ~ 0
Touch on/off controller
Text Notes 7500 1050 0    118  ~ 0
LED driver
Text Notes 6150 2850 0    50   ~ 0
Shutdown\nCTRL: 0v \nIoff=4uA typ 
Text GLabel 5150 2050 2    50   Input ~ 0
touchon
Text GLabel 6500 2400 0    50   Input ~ 0
touchon
Wire Wire Line
	6500 2400 6650 2400
$Comp
L power:VDD #PWR0106
U 1 1 5B3FA6A4
P 7150 1350
F 0 "#PWR0106" H 7150 1200 50  0001 C CNN
F 1 "VDD" H 7167 1523 50  0000 C CNN
F 2 "" H 7150 1350 50  0001 C CNN
F 3 "" H 7150 1350 50  0001 C CNN
	1    7150 1350
	1    0    0    -1  
$EndComp
Text Notes 4450 2900 0    50   ~ 0
Ioff=2uA typ
Wire Wire Line
	7150 1350 7150 1500
Connection ~ 7150 1500
$Comp
L device:TEST TP1
U 1 1 5B3FE27F
P 1150 1850
F 0 "TP1" V 1365 1944 50  0000 C CNN
F 1 "VDD" V 1274 1944 50  0000 C CNN
F 2 "touchuc:progpin" H 1150 1850 50  0001 C CNN
F 3 "" H 1150 1850 50  0001 C CNN
	1    1150 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 1850 1350 1850
$Comp
L device:TEST TP2
U 1 1 5B400D69
P 1150 2300
F 0 "TP2" V 1365 2394 50  0000 C CNN
F 1 "GND" V 1274 2394 50  0000 C CNN
F 2 "touchuc:progpin" H 1150 2300 50  0001 C CNN
F 3 "" H 1150 2300 50  0001 C CNN
	1    1150 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 2300 1350 2300
Text Notes 3950 1250 0    50   ~ 0
Vdd=2.0-5.5V
$Comp
L device:TEST TP4
U 1 1 5B406B15
P 6450 2250
F 0 "TP4" V 6665 2344 50  0000 C CNN
F 1 "ON" V 6574 2344 50  0000 C CNN
F 2 "touchuc:progpin" H 6450 2250 50  0001 C CNN
F 3 "" H 6450 2250 50  0001 C CNN
	1    6450 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 2250 6650 2250
Wire Wire Line
	6650 2250 6650 2400
Connection ~ 6650 2400
Wire Wire Line
	6650 2400 6800 2400
Wire Wire Line
	4750 2050 5150 2050
$Comp
L device:R R2
U 1 1 5B410C87
P 6800 2700
F 0 "R2" H 6870 2746 50  0000 L CNN
F 1 "100k" H 6870 2655 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6730 2700 50  0001 C CNN
F 3 "" H 6800 2700 50  0001 C CNN
	1    6800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2550 6800 2400
Connection ~ 6800 2400
Wire Wire Line
	6800 2400 7350 2400
Wire Wire Line
	6800 2850 6800 2950
Wire Wire Line
	6800 2950 7150 2950
Connection ~ 7150 2950
$Comp
L conn:Conn_01x01 J1
U 1 1 5B423762
P 3350 2700
F 0 "J1" H 3270 2475 50  0000 C CNN
F 1 "SENSEGND" H 3270 2566 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch1.27mm" H 3350 2700 50  0001 C CNN
F 3 "~" H 3350 2700 50  0001 C CNN
	1    3350 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3550 2700 3750 2700
$Comp
L device:LED D1
U 1 1 5B5F6A35
P 9300 1600
F 0 "D1" V 9338 1483 50  0000 R CNN
F 1 "LED" V 9247 1483 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 9300 1600 50  0001 C CNN
F 3 "" H 9300 1600 50  0001 C CNN
	1    9300 1600
	0    -1   -1   0   
$EndComp
$Comp
L device:Q_NMOS_GDS Q1
U 1 1 5B5F9569
P 9200 2050
F 0 "Q1" H 9405 2096 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 9405 2005 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9400 2150 50  0001 C CNN
F 3 "" H 9200 2050 50  0001 C CNN
	1    9200 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1400 8700 1400
Wire Wire Line
	9300 2400 8550 2400
Wire Wire Line
	8700 2550 8700 1400
Wire Wire Line
	9300 2950 9300 2850
Wire Wire Line
	8700 2950 9300 2950
Wire Wire Line
	9300 2550 9300 2400
Wire Wire Line
	9300 1450 9300 1400
Wire Wire Line
	9300 1400 8700 1400
Connection ~ 8700 1400
Wire Wire Line
	9300 1850 9300 1750
Wire Wire Line
	9300 2250 9300 2400
Connection ~ 9300 2400
Text Notes 9600 2000 0    50   ~ 0
VIN is passed to VOUT when CTRL=off\nFor *single LED* need switch to avoid\nLED turning on in this case.
Wire Wire Line
	9000 2050 8550 2050
Wire Wire Line
	8550 2050 8550 1750
Wire Wire Line
	8550 1750 6800 1750
Wire Wire Line
	6800 1750 6800 2400
$EndSCHEMATC
