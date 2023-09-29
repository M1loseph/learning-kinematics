class Arm {
  private static final float ANGLE_RADIUS = 80;

  Segment first;
  Segment second;

  Arm(float firstLength, float secondLength) {
    first = new Segment('A', 0, 0, firstLength, 0);
    second = new Segment('B', firstLength, 0, secondLength, PI / 2);
  }


  void draw() {
    pushMatrix();
    translate(width / 2, height / 2);

    drawResultant();
    drawAngles();
    drawLetters();
    first.draw();
    second.draw();

    popMatrix();
  }

  private void drawResultant() {
    pushMatrix();  
    var end = second.calculateB();
    rotate(atan2(end.y, end.x));
    stroke(200);
    strokeWeight(3);
    line(0, 0, end.mag(), 0);
    textSize(30);
    fill(200);
    text('C', end.mag() / 2, -10);
    popMatrix();
  }

  private void drawAngles() {
    var end = second.calculateB();    
    var elbow = second.a;

    noFill();
    stroke(200);

    arc(0, 0, ANGLE_RADIUS, ANGLE_RADIUS, first.angle, end.heading());
    arc(end.x, end.y, ANGLE_RADIUS, ANGLE_RADIUS, end.heading() + PI, second.angle + PI);
    arc(elbow.x, elbow.y, ANGLE_RADIUS, ANGLE_RADIUS, second.angle, first.angle + PI);
  }

  private void drawLetters() {
    var end = second.calculateB();    
    textSize(20);

    pushMatrix();
    rotate((first.angle + end.heading()) / 2 + HALF_PI);
    text("α", 0, -ANGLE_RADIUS * 0.6);
    popMatrix();
    pushMatrix();
    translate(second.a.x, second.a.y);
    rotate((first.angle + PI + second.angle) / 2 + HALF_PI);
    text("β", 0, -ANGLE_RADIUS * 0.6);
    popMatrix();
    pushMatrix();
    translate(end.x, end.y);
    rotate((second.angle + PI + end.heading() + PI) / 2 + HALF_PI);
    text("γ", 0, -ANGLE_RADIUS * 0.6);
    popMatrix();
  }


  void moveTo(float tx, float ty) {  
    float a = first.length;
    float b = second.length;
    float c = sqrt(pow(tx, 2) + pow(ty, 2));

    float alpha = acos((pow(c, 2) - pow(a, 2) - pow(b, 2)) / (-2 * a * b)); 
    float beta = acos((pow(b, 2) - pow(a, 2) - pow(c, 2)) / (-2 * a * c));
    float gamma = acos((pow(a, 2) - pow(b, 2) - pow(c, 2)) / (-2 * b * c));

    float initialAngle = atan2(ty, tx);

    println(degrees(alpha), degrees(beta), degrees(gamma), degrees(alpha + beta + gamma));

    first.angle = - beta - initialAngle; 
    second.a = first.calculateB();
    second.angle = PI - alpha - beta - initialAngle;
  }
}
