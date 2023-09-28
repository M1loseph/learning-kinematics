Arm arm;
Net net;
RectangleVerteciesIterator iter;

void setup() {
  size(600, 400, P3D);

  arm = new Arm(50, 100, 150);
  net = new Net();
  iter = new RectangleVerteciesIterator(100, 100, 100, 1);
}

float xc;
float yc;
float zc = 1;

void draw() {

  camera();
  translate(width / 2, height / 2);
  rotateX(xc);
  rotateY(yc);
  scale(zc);

  clear();
  background(255);

  PVector nextPosition = iter.next();

  arm.moveTo(nextPosition.x, nextPosition.y, nextPosition.z);

  iter.draw();
  net.draw();
  arm.draw();

  saveFrame("images/####.tif");
}

void mouseDragged() {
  if (mouseButton != CENTER) {
    return;
  }
  float scale = 0.01;

  yc += (mouseX - pmouseX) * scale;
  xc += (pmouseY - mouseY) * scale;

  xc = min(xc, HALF_PI);
  xc = max(xc, -HALF_PI);
}

void mouseWheel(MouseEvent event) {
  float scale = 0.1;
  float count = event.getCount();
  zc -= count * scale;
}
