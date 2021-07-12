import processing.serial.*;

Serial myConnection;

float posX, posY, posZ, pressure;
String position;
String press;

Ball Lemon;
Obstacle Brick;
Cup Juice;

void setup() {
  size(800, 800);
  Lemon = new Ball();
  Brick = new Obstacle();
  Juice = new Cup();
  
  myConnection = new Serial(this, Serial.list()[1], 115200);
  myConnection.bufferUntil('\n');
}

void serialEvent(Serial conn) {
  position= conn.readString();
  press = conn.readString();
  println(position);
  println(press);
  String[]values = split(press,'=');
  //String[] values = split(position,'+');
  if(values.length==3){
    posX= map(float(values[0]), -10, 10, 0, width);
    posY= map(float(values[1]), -10, 10, 0, width);
    posZ= map(float(values[2]), -10, 10, 0, width);
    //pressure = map(float(values[3]), 0, 4095, 0, height);
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
