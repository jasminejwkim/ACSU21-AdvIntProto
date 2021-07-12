import processing.serial.*;

Serial myConnection;



float posX, posY;
float circRadius;

color circColor;

void setup(){
  size(800,800);
  posX =width/2;
  posY =height/2;
  
  circRadius = 200;
  
  circColor=color(255,0,0);
  
  myConnection = new Serial(this, Serial.list()[2], 9600);
  myConnection.bufferUntil('\n'); 

}
void serialEvent(Serial conn){
  circRadius= float(conn.readString() );
  
}

void draw(){
  background(0);
  fill(circColor);
  circle(posX, posY, circRadius);
}

void SerialEvent(Serial conn){
  float serReadout = float(conn.readString() );
  circRadius = map(serReadout, 0,4095,0,800);
}
