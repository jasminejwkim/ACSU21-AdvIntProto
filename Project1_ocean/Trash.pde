class Trash{
  color tColor;
  boolean isEaten=false;
  
  float velX, velY;
  float x, y, sizex;
  
   Trash(){
    tColor= color(76,153,0);
      
    sizex = 20;

    
    x = random(0,width-sizex);
    y = random(0,height-sizex);
    velX = random(3,5);
    velY = random(1,4);
    
 }
 
    void display(){
    
    fill(tColor);
    
    if (!isEaten) {
    // only draw the squre if it is not eaten
    square(x, y, sizex);
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
