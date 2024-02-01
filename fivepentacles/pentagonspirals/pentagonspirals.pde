void setup() {
  size(818 / 2, 1419 / 2);
  pixelDensity(2);
  translate(width/2, height/2);
  background(#1d013a);
  
  translate(0, -height/4);
  pentagon_spiral();
  
  translate(0, height/4);
  rotate(TWO_PI/10);
  translate((height/4)*sin(TWO_PI/10), (height/4)*cos(TWO_PI/10));
  pentagon_spiral();
}

void draw() {
  //translate(width/2,height/2);
}

void pentagon_spiral() {
  fill(#1b0a65);
  noStroke();
  strokeWeight(0);

  pentagon(25);

  fill(#5b1978);

  float av = (cos(TWO_PI / 5) + sin(TWO_PI / 5))/2;

  for(int i = 0; i < 5; i++) {
    pushMatrix();
    for(int j = 0; j < 4; j++) {
      translate(-(1 + av) * 25, 0);
      rotate(TWO_PI/10);
      pentagon(25);
    }

    rotate(3*TWO_PI/10);
    translate((1 + av) * 25, 0);
    pentagon(25);

    rotate(-1*TWO_PI/10);
    translate((1 + av) * 25, 0);
    pentagon(25);

    for(int j = 0; j < 2; j++) {
      rotate(TWO_PI/10);
      translate((1 + av) * 25, 0);
      pentagon(25);
    }

    popMatrix();
  
    rotate(TWO_PI/5);
  }
}

void pentagon(float radius) {
  float angle = TWO_PI / 5;
  beginShape();
  //println(screenX(0,0));
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = cos(a) * radius;
    float sy = sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
