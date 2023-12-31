class Segment {
  PVector a;
  float length;
  float angle;
  float width;
  color segmentColor;
  
  Segment(float x, float y, float width, float length, float angle, color segmentColor) {
    this.a = new PVector(x, y);
    this.length = length;
    this.angle = angle;
    this.width = width;
    this.segmentColor = segmentColor;
  }
  
  void follow(float tx, float ty) {
    changeAngle(tx, ty);
    step(tx, ty);
  }
  
  void draw() {
    strokeWeight(width);
    stroke(segmentColor);
    PVector b = calculateB();
    line(a.x, a.y, b.x, b.y);
  }
  
  PVector calculateB() {
    float bx = length * cos(angle) + a.x;
    float by = length * sin(angle) + a.y;
   
    return new PVector(bx, by);
  }
  
  void changeAngle(float tx, float ty) {
    var pointing = new PVector(tx - a.x, ty - a.y);
    angle = pointing.heading();
  }
  
  void step(float tx, float ty) {
    var b = calculateB();
    a.add(tx - b.x, ty - b.y);
  }
}
