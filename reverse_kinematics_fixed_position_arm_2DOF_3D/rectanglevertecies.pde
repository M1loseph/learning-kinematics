enum Direction {
  L, R, U, D
}


class RectangleVerteciesIterator {
  final int y;
  final int maxX;
  final int maxY;
  int x;
  int z;
  int delta;
  Direction direction = Direction.U;

  RectangleVerteciesIterator(int maxX, int maxY, int maxZ, int delta) {
    this.maxX = maxX;
    this.maxY = maxY;
    this.x = maxX;
    this.y = maxY;
    this.z = maxZ;
    this.delta = delta;
  }

  void draw() {
    pushMatrix();
    rotateX(HALF_PI);
    translate(0, 0, y);
    rectMode(CENTER);
    noFill();
    rect(0, 0, 200, 200);
    popMatrix();
  }

  PVector next() {
    if (x == 100 && z == 100) {
      direction = Direction.D;
    } else if (x == 100 && z == -100) {
      direction = Direction.L;
    } else if (x == -100 && z == -100) {
      direction = Direction.U;
    } else if (x == -100 && z == 100) {
      direction = Direction.R;
    }

    switch(direction) {
    case U:
      z += delta;
      break;
    case R:
      x += delta;
      break;
    case D:
      z -= delta;
      break;
    case L:
      x -= delta;
      break;
    }
    return new PVector(x, y, z);
  }
}
