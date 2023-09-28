
float adaptX(float x) {
  return x;
}

float adaptY(float y) {
  return -y;
}

float adaptZ(float z) {
  return z;
}

float adaptXAngle(float xAngle) {
  return -xAngle + HALF_PI;
}

float adaptYAngle(float yAngle) {
  return yAngle + HALF_PI;
}
