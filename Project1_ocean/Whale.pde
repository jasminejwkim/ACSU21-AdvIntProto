class Whale{
  color wColor;
  boolean alive;
  float posX, posY, velX, velY;
  float sizeX, sizeY;
  
  float healthIndex;//0-1 .5
  
  int numKrillEaten;
  int numTrashEaten;
  
  Whale(){
    wColor=color(70, 160, 30);
    alive = true;
    
    sizeX = 100;
    sizeY = 50;
    
    posX = sizeX/2 +10;
    posY = height/2;
    velX = random(3,5);
    velY = random(1,4);
    
    healthIndex = 0.75;
  }
  
  void display(){
    fill(wColor);
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
  
  void eat(){
  }
  
  void die(){
  }
  
}
