class Net {
  private static final float WIDTH = 1;
  private static final float PRIMARY_COLOR = 150;
  private static final float SECONDARY_COLOR = 220;
  float dx;
  float dy;

  Net(float dx, float dy) {
    this.dx = dx;
    this.dy = dy;
  }
  
  void draw() {
    strokeWeight(WIDTH);
    
    stroke(SECONDARY_COLOR);
    for(float i = dx; i < width / 2; i += dx) {
      line(width / 2 + i, 0, width / 2 + i, height);
      line(width / 2 - i, 0, width / 2 - i, height);
    }
    
    for(float i = dy; i < height / 2; i += dy) {
      line(0, height / 2 + i, width, height / 2 + i);
      line(0, height / 2 - i, width, height / 2 - i);
    }
    
    stroke(PRIMARY_COLOR);
    line(0, height / 2, width, height / 2);
    line(width / 2, 0, width / 2, height);
  }
}
