Arm arm;
Net net;
CircleStepper circleStepper;

void setup() {
  size(700, 600);
  arm = new Arm(200, 200);
  net = new Net(20, 20);
  circleStepper = new CircleStepper(70, 170, 170, 1); 
}

int iteration = 0;
final int MAX_ITERATIONS = 500;

void draw() {
  clear();
  background(255);
 
  PVector next = circleStepper.next();
  arm.moveTo(next.x, next.y);
 
  net.draw();
  circleStepper.draw();
  arm.draw();
  
  if(iteration > MAX_ITERATIONS) {
    noLoop();
    return;
  }
  iteration++;
  
  saveFrame("images/####.tif");
}
