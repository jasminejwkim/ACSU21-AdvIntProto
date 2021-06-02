Whale Timmy;
Krill Krill;
Trash Trash;

void setup(){
  size(800,600);
  
  Timmy = new Whale();
  Krill = new Krill();
  Trash = new Trash();
}

void draw(){
  background(50, 50, 200);
  Timmy.display();
  Timmy.swim();
  Krill.display();
  Krill.swim();
}
