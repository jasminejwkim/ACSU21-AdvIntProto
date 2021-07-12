class Obstacle {

  color oColor;
  float velX, velY;
  float x, y, w, h;

  Obstacle() {
    oColor= color(79, 255, 226);
    x = 150;
    y =150;
    w= random (50,100);
    h=  w/2;
    velX = 0;
    velY = 0;
  }


  void display() {
    fill(oColor);
    rect(x, y, w, h);
  }
  }
