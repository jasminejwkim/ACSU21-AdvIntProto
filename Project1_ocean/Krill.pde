class Krill{
  color kColor;
  boolean eaten;
  float posX, posY, velX, velY;
  float sizeX, sizeY; 
  
 Krill(){
    kColor= color(255,153,153);
      
    sizeX = 20;
    sizeY = 20;
    
    posX = sizeX/2 +10;
    posY = height/2;
    velX = random(3,5);
    velY = random(1,4);
    
 }
 
    void display(){
    fill(kColor);
    ellipse(posX, posY, sizeX, sizeY);
  }
  
    void swim(){
    
    if(posX + sizeX/2 >= width || posX - sizeX/2 <=0){
      velX *= -1;
    }
    if(posY + sizeY/2 >= height || posY- sizeY/2 <=0){
      velY *= -1;
    }
    posX = posX + velX;
    posY = posY + velY;
  }
 
}
