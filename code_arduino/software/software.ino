
//###################### Libraries import #############

#include <SoftwareSerial.h>
#include <stdio.h>
#include <stdlib.h>
#include<SPI.h>
#include<Wire.h>
#include<Adafruit_GFX.h>
#include<Adafruit_SSD1306.h>

//################## constant BT ##################
#define rxpin 10
#define txpin 11
#define baudrate 9600
SoftwareSerial BT_serial (rxpin,txpin);


//################ constant OLED ############
#define OLED_RESET -1 
#define DELAY 200 

//############# constant rotatory encoder  #########
#define encoder0PinA 3 //clk
#define encoder0PinB 4 // DT
#define Switch 2 //switch

Adafruit_SSD1306 display(OLED_RESET); 



int ADC_pin = 0;
int data = 0;

String R2 = "1000";

const long interval = 1000;
unsigned long currentMillis = 0;
unsigned long previousMillis = 0;

void write_txt_oled(String s, int x, int y, String color){



  
}


void setup() {
pinMode(rxpin, INPUT);
pinMode(txpin, OUTPUT);

Serial.begin(baudrate);
BT_serial.begin(baudrate);

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

currentMillis=millis();
if((currentMillis-previousMillis) >= interval){
  data=analogRead(ADC_pin);
  data = map(data, 0, 1024, 0, 255);
  BT_serial.write(data);
}
if(BT_serial.available()){
  R2 = (BT_serial.readString());
  Serial.println(R2);


}

display.clearDisplay();
display.setCursor (10, 10);
display.setTextSize(1);
display.setTextColor(WHITE);
display.println(R2); 
display.display();

;

}
