class Segment {
  private static final float WIDTH = 5; 
  private static final float JOINT_DIAMITER = 9;
  private static final float SEGMENT_COLOR = 0;
  private static final float CIRCLE_COLOR = 200;

  PVector a;
  final float length;
  float angle;
  Segment next;

  Segment(float x, float y, float length, float angle) {
    this.a = new PVector(x, y);
    this.length = length;
    this.angle = angle;
  }

  void rotareTorwards(float tx, float ty) {
    var target = new PVector(tx - a.x, ty - a.y);
    float diff = target.heading() - angle;
    angle = target.heading();
    if (next != null) {
      next.adjust(calculateB(), diff);
    }
  }

  void draw() {
    var b = calculateB();

    fill(SEGMENT_COLOR);
    stroke(SEGMENT_COLOR);
    strokeWeight(WIDTH);
    line(a.x, a.y, b.x, b.y);

    circle(a.x, a.y, JOINT_DIAMITER);
    circle(b.x, b.y, JOINT_DIAMITER);

    if (next != null) {
      next.draw();
    }
  }

  void drawCircles() {
    drawCircles(a.x, a.y);
  }


  Segment findEndJoint(float x, float y) {
    var found = next == null ? null : next.findEndJoint(x, y);
    if (found != null) {
      return found;
    }

    var thisB = calculateB();
    float distance = sqrt(pow(thisB.x - x, 2) + pow(thisB.y - y, 2));

    if (distance > JOINT_DIAMITER / 2) {
      return null;
    }

    return this;
  } 

  void adjust(PVector newA, float angleDiff) {
    this.a = newA;
    angle += angleDiff;
    if (next != null) {
      next.adjust(calculateB(), angleDiff);
    }
  }

  private void drawCircles(float rootX, float rootY) {
    var b = calculateB();
    float radius = sqrt(pow(b.x - rootX, 2) + pow(b.y - rootY, 2));

    noFill();
    stroke(CIRCLE_COLOR);
    strokeWeight(1);
    circle(rootX, rootY, radius * 2);

    if (next == null) {
      return;
    }
    next.drawCircles(rootX, rootY);
  }

  private PVector calculateB() {
    float x = a.x + length * cos(angle);
    float y = a.y + length * sin(angle);
    return new PVector(x, y);
  }
}
