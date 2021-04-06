
#include <SoftwareSerial.h>
#include <stdio.h>
#include <stdlib.h>
#define rxpin 10
#define txpin 11
#define baudrate 9600
SoftwareSerial mySerial (rxpin,txpin);

int ADC_pin = 0;
byte data;


void setup() {
pinMode(rxpin, INPUT);
pinMode(txpin, OUTPUT);

Serial.begin(baudrate);
mySerial.begin(baudrate);

}

void loop() {

data = map(analogRead(ADC_pin), 0, 1024, 0, 255);
mySerial.println(data);

}
