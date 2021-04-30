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
SoftwareSerial BT_serial (rxpin, txpin);


//################ constant OLED ############
#define OLED_RESET -1
#define DELAY 100

//############# constant rotatory encoder  #########
#define encoder0PinA 3 //clk
#define encoder0PinB 4 // DT
#define Switch 2 //switch

Adafruit_SSD1306 display(OLED_RESET);


int ADC_pin = 0;

int data = 0;

//chaîne de caractère décrivant l'état du système : ADC,R2
String system_state="";



//Résistance de calibration
String R2 = "1000";

//Les choix de résistances disponibles sur l'OLED
String tabRes [3]={"100", "1000", "10000"};

//La position de l'incrémentation dans chaque menu
byte countMenus [4]={0,0,0,0};

//byte MainMenuCount = 0;
//byte R2MenuCount = 0;
//byte MeasuresMenuCount = 0;
//byte StressMenuCount = 0;

//Le menu courant
byte currentMenu=3;

//Les différentes mesures
int contrainte = 0;
int tension = 0;
int deformation = 0;
float Rsensor = 0;


int current_pos_enc=0;
int previous_pos_enc=0;

const long interval = 1000;
unsigned long currentMillis = 0;
unsigned long previousMillis = 0;

boolean dir = true;
int current_state_pinA = 0;
int previous_state_pinA = 0;

//Afficher un texte sur l'écran OLED
void print_oled(String s, int x, int y, uint16_t color, int size_text) {
  display.setTextSize(size_text);
  display.setTextColor(color);
  display.setCursor(x, y);
  display.println(s);
}

void doEncoder(){
  current_state_pinA = digitalRead(encoder0PinA);
  if (current_state_pinA != previous_state_pinA) {
    if (digitalRead(encoder0PinB != current_state_pinA)) {
    current_pos_enc++;
  }
  else {
    current_pos_enc--;
  }

}
previous_state_pinA = current_state_pinA;
}



void doEncoderSwitch(){
  if(currentMenu==3){
  currentMenu=countMenus[3];
  }
  else{
    if(currentMenu==0){
      R2=tabRes[countMenus[0]];
    }

    currentMenu=3;
  }
}

float computeRsensor(float Vadc, float Rcal){
  float R=0;
  R=(1+(pow(10, 5)/Rcal))*pow(10,5)*5/((Vadc/1024)*5)-pow(10,5)-pow(10,4);
  return R;
}



void mainMenu() {

  //---------------------------------
  print_oled("R2 : ", 10, 0, WHITE, 1);
  print_oled(R2, 90, 0, WHITE, 1);

  print_oled("Val ADC : ", 10, 10, WHITE, 1);
  print_oled(String(data), 90, 10, WHITE, 1);

  print_oled("Contrainte : ", 10, 20, WHITE, 1);
  print_oled(String(contrainte), 90, 20, WHITE, 1);


  display.setCursor(2, (countMenus[3] * 10));
  display.println(">");

  display.display();
}

void R2Menu() {

  //---------------------------------
  print_oled("100", 10, 0, WHITE, 1);

  print_oled("1000", 10, 10, WHITE, 1);

  print_oled("10000", 10, 20, WHITE, 1);

  display.setCursor(2, (countMenus[0] * 10));
  display.println(">");

  display.display();
}

void MeasuresMenu() {

  //---------------------------------
  print_oled("Resistance : ", 10, 0, WHITE, 1);
  print_oled(String(Rsensor), 80, 0, WHITE, 1);

  print_oled("Tension : ", 10, 10, WHITE, 1);
  print_oled(String(tension), 80, 10, WHITE, 1);

  print_oled("Deformation : ", 10, 20, WHITE, 1);
  print_oled(String(deformation), 80, 20, WHITE, 1);

  display.setCursor(2, (countMenus[1] * 10));
  display.println(">");

  display.display();
}


void StressMenu() {

  //---------------------------------
  print_oled("Acier", 10, 0, WHITE, 1);

  print_oled("Aluminium", 10, 10, WHITE, 1);

  print_oled("Fer", 10, 20, WHITE, 1);

  display.setCursor(2, (countMenus[2] * 10));
  display.println(">");

  display.display();
}



void setup() {
  pinMode(rxpin, INPUT);
  pinMode(txpin, OUTPUT);

  //Initialyse Input for rotatory encoder
  pinMode(encoder0PinA, INPUT);
  pinMode(encoder0PinB, INPUT);
  pinMode(Switch, INPUT);

  //turn on pullup resistor
  digitalWrite(encoder0PinA, HIGH);
  digitalWrite(encoder0PinB, HIGH);
  digitalWrite(Switch, HIGH);

  previous_state_pinA = digitalRead(encoder0PinA);


  Serial.begin(baudrate);
  BT_serial.begin(baudrate);

  attachInterrupt(1, doEncoder, RISING);
  attachInterrupt(digitalPinToInterrupt(2), doEncoderSwitch, FALLING);

  //Ecran de démarrage
  display.begin(SSD1306_SWITCHCAPVCC, 0x3c);
  display.display();

  delay(2000);
  display.clearDisplay();

  print_oled("Bonjour !", 64, 16, WHITE, 1);

  display.display();

  delay(3000);

}

void loop() {

  currentMillis = millis();
  if ((currentMillis - previousMillis) >= interval) {
    data = analogRead(ADC_pin);
    BT_serial.flush();
    Rsensor=computeRsensor(data, R2.toInt());
    system_state=String(data)+","+String(Rsensor)+","+R2;
    BT_serial.println(system_state);
    Serial.println(Rsensor);
    previousMillis=currentMillis;
  }
  if (BT_serial.available()) {
    R2 = (BT_serial.readString());
  }

  switch(currentMenu){
    case 0:
      display.clearDisplay();
      R2Menu();
      break;
    case 1:
      display.clearDisplay();
      MeasuresMenu();
      break;
    case 2:
      display.clearDisplay();
      StressMenu();
      break;
    case 3:
      display.clearDisplay();
      mainMenu();
      break;
  }
 
  

  if((current_pos_enc-previous_pos_enc) >= 4){

    //MainMenuCount++;
    //MainMenuCount=MainMenuCount%3;
    //previous_pos_enc=current_pos_enc;

    countMenus[currentMenu]++;
    countMenus[currentMenu]=countMenus[currentMenu]%3;
    previous_pos_enc=current_pos_enc;


    
  }
   if((current_pos_enc-previous_pos_enc) <= -4){

    countMenus[currentMenu]--;
    countMenus[currentMenu]=countMenus[currentMenu]%3;
    previous_pos_enc=current_pos_enc;
  }
  
}
