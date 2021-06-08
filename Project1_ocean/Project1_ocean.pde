Whale Timmy;

ArrayList<Krill> krills = new ArrayList<Krill>();
ArrayList<Trash> plastics = new ArrayList<Trash>();

float currentremainder, previousremainder;

void setup() {
  size(800, 600);


  Timmy = new Whale();




  for (int i=0; i<10; i=i+1) {
    krills.add(new Krill());
  }


  for (int i=0; i<1; i=i+1) {
    plastics.add(new Trash());
  }
}

void draw() {
  currentremainder = millis()%3000;
  if (currentremainder<previousremainder) {
    krills.add(new Krill());
  }
  println(Timmy.health);
  if (Timmy.health <= 0) {
    textSize(32);
    fill(255, 0, 0);
    text("Game Over", 100, 100);
  } else
  {

    background(0, 0, 153);
    Timmy.display();
    Timmy.swim();

    for (Krill k : krills) {
      k.display();
      k.swim();
    }

    for (Trash p : plastics) {
      p.display();

      if (p.isSelected) {
        p.x=mouseX ;
        p.y=mouseY;
        if (p.y < 5) {
          p.isDestroyed=true;
        }
      } else {
        p.swim();
      }
    }
    for (int i = plastics.size() - 1; i >= 0; i--) {
      Trash part = plastics.get(i);
      if (part.isDestroyed) {
        plastics.remove(i);
      }
    }
    for (int i = 0; i < plastics.size(); i++) {
      Timmy.checkTouchingTrash(plastics.get(i));
    }
    for (int i = 0; i < krills.size(); i++) {
      Timmy.checkTouchingKrill(krills.get(i));
    }
  }
  previousremainder=currentremainder;
}

void mouseReleased() {
  plastics.add(new Trash());
}

void mousePressed() {
  for (Trash p : plastics) {
    if (p.x<mouseX && p.x+p.sizex>mouseX && p.y<mouseY && p.y+p.sizex>mouseY) {
      //this is the event when the mouse clicked on a piece of trash
      p.tColor=color(255, 0, 0);
      p.isSelected= true;
    }
  }
}
