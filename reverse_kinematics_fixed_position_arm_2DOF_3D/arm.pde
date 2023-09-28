class Arm {
  Segment3D first;
  Segment3D second;
  Segment3D third;


  Arm(float l1, float l2, float l3) {
    first = new Segment3D(0, 0, 0, l1, 0, 0);
    second = new Segment3D(l1, 0, 0, l2, 0, HALF_PI);
    third  = new Segment3D(l1, l2, 0, l3, 0, 0);
  }

  void draw() {
    first.draw();
    second.draw();
    third.draw();
  }


  void moveTo(float x, float y, float z) {
    float xAngle = atan2(z, x);
    first.xAngle = xAngle;
    second.a = first.calculateB();
    second.xAngle = xAngle;
    third.a = second.calculateB();
    third.xAngle = xAngle;

    float a = second.length;
    float b = third.length;
    float c = sqrt(pow(sqrt(pow(x, 2) + pow(z, 2)) - first.length, 2) + pow(y, 2));

    float alpha = acos((pow(c, 2) - pow(a, 2) - pow(b, 2)) / (-2 * a * b));
    float beta = acos((pow(b, 2) - pow(a, 2) - pow(c, 2)) / (-2 * a * c));

    float offset =  atan2(y, sqrt(pow(x, 2) + pow(z, 2)) - first.length);

    second.yAngle = beta + offset;
    third.a = second.calculateB();
    third.yAngle = -PI + second.yAngle + alpha;
  }
}
