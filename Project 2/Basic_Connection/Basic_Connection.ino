const int knobPin=A0;

void setup() {
  // put your setup code here, to run once:
  pinMode(knobPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  float voltage=analogRead(knobPin);
  Serial.println(voltage);
  delay(10);
}  
