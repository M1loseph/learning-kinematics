Worm worm;

void setup() {
  size(640, 480);
  background(0);
  worm = new Worm(100, 100, 1, 20, 10, 50);
}

void draw() {
  if(!mousePressed) {
    return;
  }
  background(0);
  worm.follow(mouseX, mouseY);
  worm.draw();
}
