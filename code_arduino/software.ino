
#include <SoftwareSerial.h>
#include <stdio.h>
#include <stdlib.h>
#include<SPI.h>
#include<Wire.h>
#include<Adafruit_GFX.h>
#include<Adafruit_SSD1306.h>


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

data=analogRead(ADC_pin);
data = map(data, 0, 1024, 0, 255);
Serial.println(data);
mySerial.write(data);
delay(1000);

}
