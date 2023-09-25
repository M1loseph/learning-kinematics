class Worm {
  ArrayList<Segment> segments = new ArrayList<Segment>();
  
  Worm(float x, float y, float minWidth, float maxWidth, float length, int segmentsCount) {
    colorMode(HSB, segmentsCount);
    for(int i = 0; i < segmentsCount; i++) {
      float width = maxWidth - (maxWidth - minWidth) * i / segmentsCount;
      Segment s = new Segment(x, y, width, length, i, color(i, 100, 100));
      segments.add(s);
      x += length;
    }
  }
  
  void follow(float tx, float ty) {
    float nextX = tx;
    float nextY = ty;
    for(int i = 0; i < segments.size(); i++) {
      Segment next = segments.get(i);
      next.follow(nextX, nextY);
      nextX = next.a.x;
      nextY = next.a.y;
    }
  }
  
  void draw() {
    for(int i = 0; i < segments.size(); i++) {
      segments.get(i).draw();
    }
  }
}
