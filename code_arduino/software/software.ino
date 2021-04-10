
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

#define OLED_RESET -1 
#define DELAY 200 

Adafruit_SSD1306 display(OLED_RESET); 


SoftwareSerial mySerial (rxpin,txpin);

int ADC_pin = 0;
int data;


void setup() {
pinMode(rxpin, INPUT);
pinMode(txpin, OUTPUT);

Serial.begin(baudrate);
mySerial.begin(baudrate);

display.begin(SSD1306_SWITCHCAPVCC, 0x3c);

//Ecrand de démarrage
display.display();
delay(2000);
display.clearDisplay();
display.setTextSize(1);
display.setTextColor(WHITE);
display.println("Bonjour !");
display.display();
delay(3000);

}

void loop() {

data=analogRead(ADC_pin);
data = map(data, 0, 1024, 0, 255);
Serial.println(data);
mySerial.write(data);
display.clearDisplay(); 

delay(1000);

}
