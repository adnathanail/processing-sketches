PShape pentagram;

void setup() {
  size(818 / 2, 1419 / 2);
  pixelDensity(2);
  translate(width/2,height/2);
  background(#1d013a);

  pentagon_spirals();

  pentagrams();
}

void draw() {
//translate(width/2,height/2);
}

void pentagon_spirals() {
  float CENTER_OFFSET = 5 * height/16;
  
  pushMatrix();
  translate(0, -CENTER_OFFSET);
  pentagon_spiral();
  
  translate(0, CENTER_OFFSET);
  rotate(TWO_PI/10);
  translate(CENTER_OFFSET*sin(TWO_PI/10), CENTER_OFFSET*cos(TWO_PI/10));
  pentagon_spiral();
  popMatrix();
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

void pentagrams() {
  rotate(PI/10);
  
  pushMatrix();

  fill(#1b0a65);
  circle(0, 0, 400);
  
  fill(#5b1978);
  circle(0, 0, 350);

  pentagram = createShape();
  pentagram.beginShape();
  pentagram.fill(#ae2a5f);
  pentagram.stroke(255);
  pentagram.strokeWeight(2);
  for (int i=0; i<10; i+=2){
    pentagram.vertex(100*cos(i*2*PI/5), 100*sin(i*2*PI/5));
  }
  pentagram.endShape(CLOSE);

  shape(pentagram);

  pentagram.setFill(#ff005a);
  scale(0.5);
  for(int i = 0; i < pentagram.getVertexCount(); i++) {
    shape(pentagram, 2*pentagram.getVertex(i).x, 2*pentagram.getVertex(i).y);
  }
  
  popMatrix();
}
