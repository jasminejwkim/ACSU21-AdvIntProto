import processing.serial.*;

Serial myConnection;

float posX, posY, posZ, pressure;
String serial;

Ball Lemon;
Obstacle Brick;
Cup Juice;

void setup() {
  size(800, 800);
  Lemon = new Ball();
  Brick = new Obstacle();
  Juice = new Cup();
  printArray(Serial.list());
  myConnection = new Serial(this, Serial.list()[2], 115200);
  myConnection.bufferUntil('\n');
}

void serialEvent(Serial conn) {
  serial= conn.readString();
 
  String[]values = split(serial,'+');
  //String[] values = split(position,'+');
  if(values.length==4){
    posX= map(float(values[0]), -10, 10, 0, width);
    posY= map(float(values[1]), -10, 10, 0, width);
    posZ= map(float(values[2]), -10, 10, 0, width);
    pressure = map(float(values[3]), 0, 4095, 0, height);
  }
}

void draw() {
  background(0);
  Lemon.display();
  Lemon.move();
  Brick.display();
  Brick.squeeze();
  Juice.display();
  fill(posZ,0,0);
  circle(posX, posY, 10);
}


void SerialEvent(Serial conn) {
  float(conn.readString());
  //float serReadout = float(conn.readString() );
}
