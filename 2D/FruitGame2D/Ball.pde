class Ball {
  color kColor;
  float velX, velY;
  float x, y, sizex;

  Ball() {
    kColor= color(255, 153, 153);
    sizex = 20;
    x = 100;
    y = 100;
  //    x = random(0, width-sizex);
   //   y = random(0, height-siazex);
      velX = 0;
      velY = 0;
  }

  void display() {
    fill(kColor);
    circle(x, y, sizex);
  }

  void move() {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        x=x-1;      
      }
      if (key == 'd' || key == 'D') {
        x=x+1;
        
      }
      if (key == 'w' || key == 'W') {
        y=y-1;
      }
      if (key == 's' || key == 'S') {
        y=y+1;
      }
    }
  }
}
