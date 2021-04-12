
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
String data_flow = "On";

int menuCount =0;

const long interval = 1000;
unsigned long currentMillis = 0;
unsigned long previousMillis = 0;

void print_oled(String s, int x, int y, uint16_t color, int size_text){
  display.setTextSize(size_text);
  display.setTextColor(color);
  display.setCursor(x, y);
  display.println(s);   
}

void doEncoder(){
 
}

void staticMenu() {
  
  //---------------------------------
  print_oled("R2 : ", 10, 0, WHITE, 1);
  print_oled(R2, 60, 0, WHITE, 1);
  
  print_oled("Val ADC : ", 10, 10, WHITE, 1);
  print_oled(String(data), 60, 10, WHITE, 1);

  print_oled("Data_flow : ", 10, 20, WHITE, 1);
  print_oled(data_flow, 80, 20, WHITE, 1);

 
  display.setCursor(2, (menuCount * 10));
  display.println(">");

  display.display();
}



void setup() {
pinMode(rxpin, INPUT);
pinMode(txpin, OUTPUT);

pinMode(encoder0PinA, INPUT);

Serial.begin(baudrate);
BT_serial.begin(baudrate);

//Ecran de démarrage
display.begin(SSD1306_SWITCHCAPVCC, 0x3c);
display.display();

delay(2000);
display.clearDisplay();

print_oled("Bonjour !", 64, 16, WHITE, 1);

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
staticMenu();
display.clearDisplay();
}
