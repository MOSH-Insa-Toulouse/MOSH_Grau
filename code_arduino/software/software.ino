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
float deformation = 0;
float Rsensor = 0;

String temp="";

//Sensibilité du capteur en %(dR/R_0)/eps. Cette valeur est à déterminer par calibration et à renseigner par l'utilisateur 
//à partir de l'APK
//Avec 205g, HB, l=4cm, e=??
float sensi=156416.0;

//R_0 en ohm
float R_0=7.2*pow(10,6);

//Pour encodeur
int current_pos_enc=0;
int previous_pos_enc=0;

//Timing de la boucle de l'Arduino
const long interval = 200;
unsigned long currentMillis = 0;
unsigned long previousMillis = 0;

//Pour le sens de rotation de l'encodeur
boolean dir = true;
int current_state_pinA = 0;
int previous_state_pinA = 0;

String getValue(String data, char separator, int index)
{
  int found = 0;
  int strIndex[] = {0, -1};
  int maxIndex = data.length()-1;

  for(int i=0; i<=maxIndex && found<=index; i++){
    if(data.charAt(i)==separator || i==maxIndex){
        found++;
        strIndex[0] = strIndex[1]+1;
        strIndex[1] = (i == maxIndex) ? i+1 : i;
    }
  }

  return found>index ? data.substring(strIndex[0], strIndex[1]) : "";
}

//Afficher un texte sur l'écran OLED
void print_oled(String s, int x, int y, uint16_t color, int size_text) {
  display.setTextSize(size_text);
  display.setTextColor(color);
  display.setCursor(x, y);
  display.println(s);
}

//Maj de la position de l'encodeur lorsqu'on le fait tourner
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


//
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

//Calcule de la résistance du capteur en fonction de la tension sur la pin analogique 0 et de la résistance de calibration 
float computeRsensor(float Vadc, float Rcal){
  float R=0;
  R=(1+(pow(10, 5)/Rcal))*pow(10,5)*5/((Vadc/1024)*5)-pow(10,5)-pow(10,4);
  return R;
}

//Calcule de la déformation en fonction de al sensibilité (% (dr/R_0) / eps)
float computeEps(float R_0, float sensi, float R){
  float dR=((R_0-R)/R_0)*100;
  return (dR/sensi);
}


//Afiichage du menu principal
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

//Afiichage du menu du choix de la résistance de calibration 
void R2Menu() {

  //---------------------------------
  print_oled("100", 10, 0, WHITE, 1);

  print_oled("1000", 10, 10, WHITE, 1);

  print_oled("10000", 10, 20, WHITE, 1);

  display.setCursor(2, (countMenus[0] * 10));
  display.println(">");

  display.display();
}

//Affichage du menu des choix de mesures
void MeasuresMenu() {

  //---------------------------------
  print_oled("Resistance : ", 10, 0, WHITE, 1);
  print_oled(String(Rsensor,0), 80, 0, WHITE, 1);

  print_oled("Val ADC : ", 10, 10, WHITE, 1);
  print_oled(String(data), 80, 10, WHITE, 1);

  print_oled("Deformation : ", 10, 20, WHITE, 1);
  print_oled(String(deformation*pow(10,3), 5), 80, 20, WHITE, 1);

  display.setCursor(2, (countMenus[1] * 10));
  display.println(">");

  display.display();
}

//Affichage du menu du calcule de contraintes
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

  //Pin du bus Serie
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
  //On boucle en fonction de l'interval défini
  if ((currentMillis - previousMillis) >= interval) {

    //Lecture de la valeur de la tension sur la pin analogique 0
    data = analogRead(ADC_pin);

    //Nettoyage des buffers
    BT_serial.flush();
    Rsensor=computeRsensor(data, R2.toInt());
    deformation=computeEps(R_0, sensi, Rsensor);

    //Récupération de l'état du système
    system_state=String(data)+","+String(Rsensor)+","+R2;
    //Etat du système envoyé sur l'APK
    BT_serial.println(system_state);
    //Serial.println(Rsensor);
    previousMillis=currentMillis;
  }
  if (BT_serial.available()) {
    //Lecture des données envoyées par l'APK (pour l'instant que la résistance de calibration 

    temp=(BT_serial.readString());
    R2=getValue(temp, ',', 0).toInt();
    sensi=getValue(temp, ',', 1).toInt();
    R_0=getValue(temp, ',', 2).toInt();
  }

  //Gestion de l'afichage des différents menus
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
