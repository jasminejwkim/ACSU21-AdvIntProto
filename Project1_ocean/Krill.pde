class Krill{
  color kColor;
  boolean isEaten;
  float velX, velY;
  float x, y, sizex; 
  
  
 Krill(){
    kColor= color(255,153,153);
    isEaten=false;
    sizex = 20;
    x = random(0,width-sizex);
    y = random(0,height-sizex);
    velX = random(-2,2);
    velY = random(-2,2);
    
 }
 
  void display(){
    if (!isEaten){
    fill(kColor);
    circle(x,y, sizex);
    }
  }
  
  void eat() {
      isEaten=true;
    }
    
  void swim(){
    
    if(x + sizex>= width || x  <=0){
      velX *= -1;
    }
    if(y + sizex >= height || y <=0){
      velY *= -1;
    }
    x = x + velX;
    y = y + velY;
  }
 
}
