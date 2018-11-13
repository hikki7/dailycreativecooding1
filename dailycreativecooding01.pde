float[]x;
float[]y;
int resolution;
float radius=100;
float angle;
float lengthNoise=0;
float hue;

void setup() {
  fullScreen();
  background(21);
  noCursor();
  pixelDensity(displayDensity());
  noFill();
  blendMode(ADD);
  //colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount%10);
  resolution=3;

  //init
  x=new float[resolution];
  y=new float[resolution];

  angle=TWO_PI/resolution;

  //座標の更新
  for (int i=0; i<resolution; i++) {
    x[i]=cos(i*angle)*radius;
    y[i]=sin(i*angle)*radius;
  }
  radius+=map(noise(lengthNoise), 0, 1, -0.5, 1);
  lengthNoise+=0.05;
  stroke(0, 80, 80, 80);
  beginShape();
  //づらすと滑らかになる
  curveVertex(x[resolution-1], y[resolution-1]);
  for (int i=0; i<resolution; i++) {
    stroke(hue*i%360, 80, 80, 50);
    curveVertex(x[i], y[i]);
  }
  curveVertex(x[0], y[0]);
  curveVertex(x[1], y[1]);
  endShape();
  popMatrix();
}
