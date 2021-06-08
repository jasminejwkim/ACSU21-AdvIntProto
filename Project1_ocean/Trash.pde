class Trash {
  color tColor;
  boolean isDestroyed=false;

  float velX, velY;
  float x, y, sizex;

  boolean isSelected=false;

  Trash() {
    tColor= color(76, 153, 0);

    sizex = 20;


    x = random(0, width-sizex);
    y = random(0, height-sizex);
    velX = random(-2, 2);
    velY = random(-2, 2);
  }

  void display() {

    fill(tColor);
    square(x, y, sizex);
  }

  void eat() {
    isDestroyed=true;
  }

  void swim() {


    if (x + sizex>= width || x  <=0) {
      velX *= -1;
    }
    if (y + sizex >= height || y <=0) {
      velY *= -1;
    }

    x = x + velX;
    y = y + velY;
  }
}
