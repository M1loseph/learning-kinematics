Segment s;

void setup() {
  size(1280, 960);
  background(0);
  for(int i = 0; i < 5; i++) {
    s = new Segment(800 - i * 100, 200, 100, 0, s);
  } 
  s.draw();
}


void draw() {
  if(!mousePressed) {
    return;
  }
  clear();
  s.findClosest(mouseX, mouseY).rotareTorwards(mouseX, mouseY);
  s.draw();
  saveFrame("./images/line-#####.tif");
}
