
class CircleStepper {
  float radius;
  float x;
  float y;
  float currentX;
  float step;


  CircleStepper(float radius, float x, float y, float step) {
    this.radius = radius;
    this.x = x;
    this.y = y;
    this.currentX = x - radius;
    this.step = step;
  }

  PVector next() {
    currentX += step;

    if (currentX < x- radius || currentX > x + radius) {
      step = -step;
      currentX += step;
    }
    float currentY = y;
    float delta = sqrt(pow(radius, 2) - pow(currentX - x, 2));
    if (step < 0) {
      currentY -= delta;
    } else {
      currentY += delta;
    };
    return new PVector(currentX, currentY);
  }

  void draw() {
    pushMatrix();
    translate(width / 2, height / 2);
    noFill();
    strokeWeight(2);
    stroke(200);
    circle(x, -y, radius * 2);
    popMatrix();
  }
}
