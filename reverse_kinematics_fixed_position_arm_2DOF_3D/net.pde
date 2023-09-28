class Net {

  void draw() {
    pushMatrix();

    stroke(255, 0, 0);
    fill(255, 0, 0);
    text("X", 20, 20);
    line(-1000, 0, 1000, 0);

    rotateY(-HALF_PI);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    line(-1000, 0, 1000, 0);
    text("Z", 20, 20);


    rotateZ(HALF_PI);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    line(-1000, 0, 1000, 0);
    text("Y", 20, 20);

    popMatrix();
  }
}
