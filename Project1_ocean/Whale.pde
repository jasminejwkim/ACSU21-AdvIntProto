class Whale {
  color wColor;
  float velX, velY;  

  float x, y, sizex, sizey;
  int health;


  Whale() {
    wColor=color(210);    
    sizex = 100;
    sizey = 50;

    health=5;
    
    x = sizex/2 +10;
    y = sizey/2;
    velX = health;
    velY = health;

  
  }

  void checkTouchingTrash(Trash other) {
    Boolean isOverlapping = ((x + sizex >= other.x && x <= other.x) || (other.x + other.sizex >= x && other.x <= x)) && ((y + sizey >= other.y && y <= other.y) || (other.y + other.sizex >= y && other.y <= y));

    if (isOverlapping) {
      // eat other
      other.eat();
      health--;
    } else {
      // do nothing
    }
  }

  void checkTouchingKrill(Krill other) {
    Boolean isOverlapping = ((x + sizex >= other.x && x <= other.x) || (other.x + other.sizex >= x && other.x <= x)) &&
      ((y + sizey >= other.y && y <= other.y) || (other.y + other.sizex >= y && other.y <= y))
      ;
    if (isOverlapping) {
      println("triggered");
      other.eat();
      health++;
    }
  }
 
  void display() {
    wColor=color(map(health, 0, 5, 30, 210));
    fill(wColor);
    rect(x, y, sizex, sizey);
  }


  void swim() {
    //if (velX>0) {
    //  velX=health;
    //} else {
    //  velX= health*-1;
    //}
    //if (velY>0) {
    //  velY=health;
    //} else {
    //  velY= health*-1;
    //}
    if (x + sizex>= width || x <=0) {
      velX *= -1;
    }
    if (y + sizey>= height || y <=0) {
      velY *= -1;
    }

    x = x + velX;
    y = y + velY;
  }
}
