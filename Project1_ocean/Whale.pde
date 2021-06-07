class Whale{
  color wColor;
  float velX, velY;  
 
  float x, y, sizex, sizey;
 int health;
  
  
  Whale(){
    wColor=color(40, 180, 246);    
    sizex = 100;
    sizey = 50;
    
    x = sizex/2 +10;
    y = sizey/2;
    velX = random(3,5);
    velY = random(1,4);
    
    health = 5;
  }
  
    void checkTouchingTrash(Trash other) {
      Boolean isOverlapping = ((x + sizex >= other.x && x <= other.x) || (other.x + other.sizex >= x && other.x <= x)) &&
                              ((y + sizey >= other.y && y <= other.y) || (other.y + other.sizex >= y && other.y <= y))
  ;
  
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
      other.eat();
      health++;
      
      }
 }
 
  void display(){
    fill(wColor);
    rect(x, y, sizex, sizey);
     
    
}

  
  void swim(){
    
    
    if(x + sizex>= width || x <=0){
      velX *= -1;
    }
    if(y + sizey>= height || y <=0){
      velY *= -1;
    }
    
    x = x + velX;
    y = y + velY;
  }
}
