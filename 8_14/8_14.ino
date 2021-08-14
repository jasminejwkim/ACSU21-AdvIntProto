#include "config.h"

#define BUTTON_PIN 15
#define DISTANCE_PIN 27
#define SWITCH_PIN A1
#define LED_PIN 13
#define BUZZER_PIN 12

bool notify = false;
bool alarm = false;

bool currentButton = false;
bool prevButton = false;

bool currentDisReading = false;
bool prevDisReading = false;

bool switchState = false;
bool prevSwitchState = false;

AdafruitIO_Feed *digital1 = io.feed("digitaltest"); //name of your feed
AdafruitIO_Feed *digital2 = io.feed("digitaltest-distance");
AdafruitIO_Feed *digital3 = io.feed("switch");
AdafruitIO_Feed *digital4 = io.feed("notify");
AdafruitIO_Feed *digital5 = io.feed("alarm");

void setup() {
  // put your setup code here, to run once:
  pinMode(BUTTON_PIN, INPUT);
  pinMode(DISTANCE_PIN, INPUT);
  pinMode(SWITCH_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUZZER_PIN, OUTPUT);
  Serial.begin(115200);

  while (! Serial); //hang on

  Serial.print("Connecting to Adafruit IO");
  io.connect();

  while (io.status() < AIO_CONNECTED) {
    Serial.print("."); //wait
    delay(500);
  }

  Serial.println();
  Serial.println(io.statusText());
}

void loop() {

  io.run();

  switchState = digitalRead(SWITCH_PIN);

  if (switchState != prevSwitchState) {
    Serial.print("sending home status ->");
    Serial.println(switchState);
  }

  currentButton = digitalRead(BUTTON_PIN);

  if (currentButton != prevButton) {
    Serial.print("sending button -> ");
    Serial.println(currentButton);
    digital1->save(currentButton); //saving to the cloud
  }

  currentDisReading = digitalRead(DISTANCE_PIN);


  if (currentDisReading != prevDisReading) {
    Serial.print("sending distance -> ");
    Serial.println(currentDisReading);
    digital2->save(currentDisReading); //saving to the cloud
  }

  
  //if we don't have a product detected:
  if (!notify) {
    //check if there is one = BOTH sensors are TRUE
    if (currentButton != prevButton && currentButton == true && currentDisReading != prevDisReading && currentDisReading == true) {
      notify = true;
      //TODO: record "TRUE" to the Adafruit IO NOTIFY channel
      
    }
  }
  //if the product is there
  else {
    // if the switch is on       and the button changed     and became unpressed       or  the proximity sensor changed         and became false  (EITHER of the sensors is FALSE)
    if(switchState == true && ((currentButton != prevButton && currentButton == false) || (currentDisReading != prevDisReading && currentDisReading == false) ) ){
      alarm = true;
      //TODO: record "TRUE" to the Adafruit IO ALARM channel

      //the package is gone, no need to notify any more
      notify = false;
      //TODO: record "FALSE" to the Adafruit IO NOTIFY channel
    }

    if(switchState == false){
      alarm = false;
      //TODO: record "FALSE" to the Adafruit IO ALARM channel

      //someone picked up the package
      //TODO: decide wether BOTH or EITHER need to go FALSE ????, right now it's EITHER
      if((currentButton != prevButton && currentButton == false) || (currentDisReading != prevDisReading && currentDisReading == false) ) {
        notify = false;
        //TODO: record "FALSE" to the Adafruit IO NOTIFY channel
      }
    }
  }
  
  prevButton = currentButton;
  prevDisReading = currentDisReading;
  prevSwitchState = switchState;

  delay(2000);
}


//TODO:
// create Adafruit IO channels for notify and alarm
// add housekeeping code
// TEST
