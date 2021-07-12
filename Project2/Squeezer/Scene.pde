Fruit f;
Squeeze s;
Cup c;

void setup() {
  size (800,800);
  f= new Fruit();
  s= new Squeeze();
  c= new Cup();
}

void draw(){
  background(255);
  f.display();
  c.display();
  s.display();
   
}
