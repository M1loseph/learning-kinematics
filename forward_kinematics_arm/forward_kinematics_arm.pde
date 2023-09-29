Segment root;
Segment rotating;

void setup() {
  int SEGMENT_LENGTH = 50;
  
  size(800, 600);
  background(255);
  for(int i = 0; i < 5; i++) {
    var next = root;
    root = new Segment(-i * SEGMENT_LENGTH, 0, SEGMENT_LENGTH, 0);
    root.next = next;
  } 
  root.adjust(new PVector(width/2, height/2), 0);
  root.draw();
}


void draw() {
  if(rotating == null) {
    rotating = root.findEndJoint(mouseX, mouseY);
  }
  
  if(rotating != null) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  
  if(!mousePressed) {
    rotating = null;
    return;
  }
  
  if(rotating == null) {
    return;
  }
  
  rotating.rotareTorwards(mouseX, mouseY);
  background(255);
  rotating.drawCircles();
  root.draw();
  saveFrame("images/####.tif");
}
