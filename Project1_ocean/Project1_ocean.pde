Whale Timmy;
Krill[] krills;
Trash[] plastics;


void setup(){
  size(800,600);
  
  
  Timmy = new Whale();

  
  krills= new Krill[15];
  
  for (int i=0; i<15; i=i+1) {
    krills[i] = new Krill();
  }
  
  plastics = new Trash[15];
  
  for (int i=0; i<15; i=i+1) {
    plastics[i] = new Trash();
  }
  
  
}

void draw(){
  if (Timmy.health <= 0) {
    textSize(32);
    fill(255,0,0);
    text("Game Over", 100, 100);
  } else
  {
  
    background(0, 0, 153);
    Timmy.display();
    Timmy.swim();
    
    for (int i=0; i<15; i=i+1){
      krills[i].display();
      krills[i].swim();
    }
    
    for (int i=0; i<15; i=i+1) {
      plastics[i].display();
      plastics[i].swim();
    }
    
    for (int i = 0; i < plastics.length; i++) {
      Timmy.checkTouchingTrash(plastics[i]);
    }
    for (int i = 0; i < krills.length; i++) {
      Timmy.checkTouchingKrill(krills[i]);
    }
  }
}
