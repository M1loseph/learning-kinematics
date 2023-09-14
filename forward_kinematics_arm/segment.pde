class Segment {
  private static final float WIDTH = 5; 
  private static final float JOINT_DIAMITER = 9;
  
  PVector a;
  float length;
  float angle;
  Segment next;
  
  Segment(float x, float y, float length, float angle, Segment next) {
    this.a = new PVector(x, y);
    this.length = length;
    this.angle = angle;
    this.next = next;
  }
  
  void rotareTorwards(float tx, float ty) {
    PVector target = new PVector(tx - a.x, ty - a.y);
    float diff = target.heading() - angle;
    angle = target.heading();
    if(next != null) {
      next.adjust(calculateB(), diff);
    }
  }
    
  void draw() {
    PVector b = calculateB();
    
    stroke(255);
    strokeWeight(WIDTH);
    line(a.x, a.y, b.x, b.y);
    
    circle(a.x, a.y, JOINT_DIAMITER);
    circle(b.x, b.y, JOINT_DIAMITER);
    
    if(next != null) {
      next.draw();
    }
  }
  
  Segment findClosest(float x, float y) {
    if(next == null) {
       return this;
    }
    
    Segment otherClosest = next.findClosest(x, y);
    PVector thisB = calculateB();
    PVector otherB = otherClosest.calculateB();
    
    float thisDistance = sqrt((thisB.x - x) * (thisB.x - x) + (thisB.y - y) * (thisB.y - y));
    float otherDistance = sqrt((otherB.x - x) * (otherB.x - x) + (otherB.y - y) * (otherB.y - y));
    
    if(thisDistance <= otherDistance) {
      return this;
    } 
    return otherClosest;
  } 
  
  private void adjust(PVector newA, float angleDiff) {
    this.a = newA;
    angle += angleDiff;
    if(next != null) {
      next.adjust(calculateB(), angleDiff);
    }
  }

  
  private PVector calculateB() {
    float x = a.x + length * cos(angle);
    float y = a.y + length * sin(angle);
    return new PVector(x, y);
  }
}
