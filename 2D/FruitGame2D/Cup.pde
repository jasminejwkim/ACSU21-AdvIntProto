class Cup {

  color cColor;
  float velX, velY;
  float x, y, w, h;

  Cup() {
    cColor= color(255,255,255);
    x = 150;
    y =150;
    w= random (50,100);
    h=  w/2;
    velX = 0;
    velY = 0;
  }


  void display() {
    fill(cColor);
    rect(x, y+500, w, h+50);
  
  }
  
  }
 
