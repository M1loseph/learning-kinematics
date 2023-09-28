class Segment3D {
  private static final float FILL_COLOR = 200; 
  private static final float WIDTH = 10; 
  private static final float END_JOINT_RADIUS = 10;

  PVector a;
  final float length;
  float xAngle; // angle from the X axis
  float yAngle; // angle from the Y axis

  Segment3D(float x, float y, float z, float length, float xAngle, float yAngle) {
    this.a = new PVector(x, y, z);
    this.length = length;
    this.xAngle = xAngle;
    this.yAngle = yAngle;
  }

  void draw() {
    pushMatrix();
    translate(adaptX(a.x), adaptY(a.y), adaptZ(a.z));
    rotateY(adaptXAngle(xAngle));
    rotateX(adaptYAngle(yAngle));
    stroke(0);
    fill(FILL_COLOR);
    sphere(END_JOINT_RADIUS);
    translate(0, length / 2, 0);
    box(WIDTH, length, WIDTH);
    translate(0, length / 2, 0);
    stroke(255, 0, 0);
    sphere(END_JOINT_RADIUS);
    popMatrix();
  }

  PVector calculateB() {
    float bx = a.x + length * cos(xAngle) * cos(yAngle);
    float by = a.y + length * sin(yAngle);
    float bz = a.z + length * cos(yAngle) * sin(xAngle);
    return new PVector(bx, by, bz);
  }
}
