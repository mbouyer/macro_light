EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
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
L LED_Small_ALT D1
U 1 1 5C07B2BB
P 4000 2850
F 0 "D1" H 3950 2975 50  0000 L CNN
F 1 "JE2835AWT" H 3825 2750 50  0000 L CNN
F 2 "LEDs:LED_PLCC_2835_Handsoldering" V 4000 2850 50  0001 C CNN
F 3 "" V 4000 2850 50  0001 C CNN
F 4 "JE2835AWT-00-0000-000A0HG940E" H 4000 2850 60  0001 C CNN "P/N"
	1    4000 2850
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x01 J1
U 1 1 5C07B6C1
P 3400 2850
F 0 "J1" H 3400 2950 50  0000 C CNN
F 1 "Conn_01x01" H 3400 2750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 3400 2850 50  0001 C CNN
F 3 "" H 3400 2850 50  0001 C CNN
	1    3400 2850
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x01 J2
U 1 1 5C07B7CA
P 4500 2850
F 0 "J2" H 4500 2950 50  0000 C CNN
F 1 "Conn_01x01" H 4500 2750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4500 2850 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2850 3900 2850
Wire Wire Line
	4100 2850 4300 2850
$EndSCHEMATC
