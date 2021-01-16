EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2850 1900 0    50   Input ~ 0
X0
Text HLabel 2850 2000 0    50   Input ~ 0
X1
Text HLabel 2850 2100 0    50   Input ~ 0
X2
Text HLabel 2850 2200 0    50   Input ~ 0
X3
Text HLabel 2850 2300 0    50   Input ~ 0
X4
Text HLabel 2850 2400 0    50   Input ~ 0
X5
Text HLabel 2850 2500 0    50   Input ~ 0
X6
Text HLabel 2850 2600 0    50   Input ~ 0
X7
Text HLabel 2850 2700 0    50   Input ~ 0
X8
Text HLabel 2850 2800 0    50   Input ~ 0
Y0
Text HLabel 2850 2900 0    50   Input ~ 0
Y1
Text HLabel 2850 3000 0    50   Input ~ 0
Y2
Text HLabel 2850 3100 0    50   Input ~ 0
Y3
Text HLabel 2850 3200 0    50   Input ~ 0
Y4
Text HLabel 2850 3300 0    50   Input ~ 0
Y5
Text HLabel 2850 3400 0    50   Input ~ 0
Y6
Text HLabel 2850 3500 0    50   Input ~ 0
Y7
Text HLabel 2850 3600 0    50   Input ~ 0
Y8
Text HLabel 4600 2400 2    50   Output ~ 0
R0
Text HLabel 4600 2500 2    50   Output ~ 0
R1
Text HLabel 4600 2600 2    50   Output ~ 0
R2
Text HLabel 4600 2100 2    50   Output ~ 0
G0
Text HLabel 4600 2200 2    50   Output ~ 0
G1
Text HLabel 4600 2300 2    50   Output ~ 0
G2
Text HLabel 4600 1900 2    50   Output ~ 0
B0
Text HLabel 4600 2000 2    50   Output ~ 0
B1
Text HLabel 2850 1150 0    50   Input ~ 0
CLK
Text HLabel 2850 4200 0    50   Input ~ 0
~OE~
$Comp
L Memory_Flash:SST39SF040 U13
U 1 1 601C3946
P 3700 3100
F 0 "U13" H 3700 4581 50  0001 C CNN
F 1 "SST39SF040" H 3700 4489 50  0000 C CNN
F 2 "" H 3700 3400 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25022B.pdf" H 3700 3400 50  0001 C CNN
	1    3700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1900 4600 1900
Wire Wire Line
	4600 2000 4300 2000
Wire Wire Line
	4300 2100 4600 2100
Wire Wire Line
	4600 2200 4300 2200
Wire Wire Line
	4300 2300 4600 2300
Wire Wire Line
	4600 2400 4300 2400
Wire Wire Line
	4300 2500 4600 2500
Wire Wire Line
	4600 2600 4300 2600
$Comp
L power:GND #PWR?
U 1 1 601C73F7
P 3700 4400
F 0 "#PWR?" H 3700 4150 50  0001 C CNN
F 1 "GND" H 3705 4227 50  0000 C CNN
F 2 "" H 3700 4400 50  0001 C CNN
F 3 "" H 3700 4400 50  0001 C CNN
	1    3700 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 601C7DB6
P 3700 1600
F 0 "#PWR?" H 3700 1450 50  0001 C CNN
F 1 "+5V" H 3715 1773 50  0000 C CNN
F 2 "" H 3700 1600 50  0001 C CNN
F 3 "" H 3700 1600 50  0001 C CNN
	1    3700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1800 3700 1750
Wire Wire Line
	3700 4300 3700 4350
Wire Wire Line
	3100 1900 2850 1900
Wire Wire Line
	2850 2000 3100 2000
Wire Wire Line
	3100 2100 2850 2100
Wire Wire Line
	2850 2200 3100 2200
Wire Wire Line
	3100 2300 2850 2300
Wire Wire Line
	2850 2400 3100 2400
Wire Wire Line
	3100 2500 2850 2500
Wire Wire Line
	2850 2600 3100 2600
Wire Wire Line
	3100 2700 2850 2700
Wire Wire Line
	3100 2800 2850 2800
Wire Wire Line
	2850 2900 3100 2900
Wire Wire Line
	3100 3000 2850 3000
Wire Wire Line
	2850 3100 3100 3100
Wire Wire Line
	3100 3200 2850 3200
Wire Wire Line
	2850 3300 3100 3300
Wire Wire Line
	3100 3400 2850 3400
Wire Wire Line
	2850 3500 3100 3500
Wire Wire Line
	3100 3600 2850 3600
Wire Wire Line
	3100 4200 2850 4200
NoConn ~ 2850 1150
Wire Wire Line
	3100 3700 3050 3700
Wire Wire Line
	3050 3700 3050 4100
Wire Wire Line
	3050 4350 3700 4350
Connection ~ 3700 4350
Wire Wire Line
	3700 4350 3700 4400
Wire Wire Line
	2500 3900 2500 1750
Wire Wire Line
	2500 1750 3700 1750
Connection ~ 3700 1750
Wire Wire Line
	3700 1750 3700 1600
Wire Wire Line
	2500 3900 3100 3900
Wire Wire Line
	3100 4100 3050 4100
Connection ~ 3050 4100
Wire Wire Line
	3050 4100 3050 4350
$EndSCHEMATC
