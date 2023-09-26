class Segment {
  private static final float JOINT_RADIOUS = 9;
  private static final float WIDTH = 5;
  private static final byte COLOR = 0;
  private static final byte TEXT_SIZE = 40;
  private static final int TEXT_OFFSET = -10; 
  private static final float TEXT_POSITION = 0.5;
  
  char name;
  PVector a;
  final float length;
  float angle;

  Segment(char name, float x, float y, float length, float angle) {
    this.name = name;
    this.a = new PVector(x, y);
    this.length = length;
    this.angle = angle;
  }

  void draw() {
    pushMatrix();
    translate(a.x, a.y);
    rotate(angle);

    stroke(COLOR);
    fill(COLOR);
    textSize(TEXT_SIZE);
    text(name, length * TEXT_POSITION, TEXT_OFFSET);
    strokeWeight(WIDTH);
    line(0, 0, length, 0);
    circle(0, 0, JOINT_RADIOUS);
    circle(length, 0, JOINT_RADIOUS);
    noFill();
    
    popMatrix();
  }

  private PVector calculateB() {
    float xb = a.x + cos(angle) * length;
    float yb = a.y + sin(angle) * length;
    return new PVector(xb, yb);
  }
}
