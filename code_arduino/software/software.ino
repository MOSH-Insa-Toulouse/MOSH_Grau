
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

//Résistance de calibration
String R2 = "1000";

byte MainMenuCount =0;
byte R2MenuCount=0;
byte MeasuresMenuCount=0;
byte StressMenuCount=0;

int contrainte = 0;
int tension = 0;
int deformation=0;
int Rsensor=0;

const long interval = 1000;
unsigned long currentMillis = 0;
unsigned long previousMillis = 0;

//Afficher un texte sur l'écran OLED
void print_oled(String s, int x, int y, uint16_t color, int size_text){
  display.setTextSize(size_text);
  display.setTextColor(color);
  display.setCursor(x, y);
  display.println(s);   
}

void doEncoder(){
 
}

void mainMenu() {
  
  //---------------------------------
  print_oled("R2 : ", 10, 0, WHITE, 1);
  print_oled(R2, 60, 0, WHITE, 1);
  
  print_oled("Val ADC : ", 10, 10, WHITE, 1);
  print_oled(String(data), 60, 10, WHITE, 1);

  print_oled("Contrainte : ", 10, 20, WHITE, 1);
  print_oled(String(contrainte), 80, 20, WHITE, 1);

 
  display.setCursor(2, (MainMenuCount * 10));
  display.println(">");

  display.display();
}

void R2Menu() {
  
  //---------------------------------
  print_oled("100", 10, 0, WHITE, 1);
  
  print_oled("1000", 10, 10, WHITE, 1);

  print_oled("10000", 10, 20, WHITE, 1);
 
  display.setCursor(2, (R2MenuCount * 10));
  display.println(">");

  display.display();
}

void MeasuresMenu() {
  
  //---------------------------------
  print_oled("Résistance : ", 10, 0, WHITE, 1);
  print_oled(String(Rsensor), 60, 0, WHITE, 1);
  
  print_oled("Tension : ", 10, 10, WHITE, 1);
  print_oled(String(tension), 60, 10, WHITE, 1);

  print_oled("Déformation : ", 10, 20, WHITE, 1);
  print_oled(String(deformation), 80, 20, WHITE, 1);
 
  display.setCursor(2, (MeasuresMenuCount * 10));
  display.println(">");

  display.display();
}


void StressMenu() {
  
  //---------------------------------
  print_oled("Acier", 10, 0, WHITE, 1);
  
  print_oled("Aluminium", 10, 10, WHITE, 1);

  print_oled("Fer", 10, 20, WHITE, 1);
 
  display.setCursor(2, (StressMenuCount * 10));
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
mainMenu();
display.clearDisplay();
}
