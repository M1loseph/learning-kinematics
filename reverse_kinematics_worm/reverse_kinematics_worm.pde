Worm worm;

final int SEGMENTS = 50;
final float DELTA = 0.05;

void setup() {
  size(640, 480);
  background(255);
  worm = new Worm(100, 100, 1, 20, 10, SEGMENTS);
}

int iterations = 0;
boolean forward = true;
float x = -PI;

void draw() {  
  float y;
  
  if(x > PI) {
    forward = false;
  } 
  if(x < -PI) {
    forward = true;
    iterations += 1;
  }
  
  if(iterations == 2) {
    noLoop();
    return;
  }
  
  if(forward) {
    x += DELTA;
    y = sin(x);
  } else {
    x -= DELTA;
    y = -sin(x);
  }

  worm.follow(x / (2 * PI) * width + width / 2, y * height / 2 + height / 2);  
  background(SEGMENTS);
  worm.draw();
  
  if(iterations > 0) {
    saveFrame("images/####.tif");
  }
}
