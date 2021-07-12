class Squeeze{
  color sColor;
  boolean isClosed;
  float velX, velY;
  float x, y, sizex;  
  
Squeeze(){
  sColor= color(227,3,252);
  isClosed = false;
  x=400;
  y=300;

}


void display(){
  fill(sColor); 
  noStroke();
  ellipse(400,400,40,30);

}

void squeeze(){
}

}
