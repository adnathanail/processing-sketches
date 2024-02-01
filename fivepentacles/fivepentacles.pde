PShape pentagram;

void setup() {
  size(818 / 2, 1419 / 2);
  pixelDensity(2); // For high-res output
  translate(width/2,height/2); // Work everything relative to the centre of the screen

  background(#1d013a);

  pentagon_spirals();

  pentagrams();
  
  save("five_of_pentacles.png");
}

void pentagon_spirals() {
  // How far above and below the centre line each spiral should appear
  float CENTER_OFFSET = 5 * height/16;
 
  pushMatrix(); // Save current settings so we can reset after drawing the spirals

  // Top spiral
  translate(0, -CENTER_OFFSET); // Offset
  pentagon_spiral();
  
  // Bottom spiral
  translate(0, CENTER_OFFSET); // Back to the middle
  rotate(TWO_PI/10); // Rotate the bottom spiral
  translate(CENTER_OFFSET*sin(TWO_PI/10), CENTER_OFFSET*cos(TWO_PI/10)); // Annoying translation because we rotated
  pentagon_spiral();

  popMatrix(); // Reset back to the checkpoint
}

void pentagon_spiral() {
  color c1 = #5b1978;
  color c2 = #1b0a65;

  fill(c1);
  noStroke();
  strokeWeight(0);

  pentagon(25);

  float av = (cos(TWO_PI / 5) + sin(TWO_PI / 5))/2;

  for(int i = 0; i < 5; i++) {
    pushMatrix();
    for(int j = 0; j < 4; j++) {
      fill(lerpColor(c1, c2, 0.1 + j * 0.1));
      translate(-(1 + av) * 25, 0);
      rotate(TWO_PI/10);
      pentagon(25);
    }
    
    fill(lerpColor(c1, c2, 0.5));

    rotate(3*TWO_PI/10);
    translate((1 + av) * 25, 0);
    pentagon(25);
    
    fill(lerpColor(c1, c2, 0.6));

    rotate(-1*TWO_PI/10);
    translate((1 + av) * 25, 0);
    pentagon(25);

    fill(lerpColor(c1, c2, 0.7));

    for(int j = 0; j < 2; j++) {
      fill(lerpColor(c1, c2, 0.8 + j*0.1));
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
  rotate(PI/10); // Make them demonic :))

  pushMatrix(); // Checkpoint

  // Outer circle
  fill(#1b0a65);
  circle(0, 0, 400);
  
  // Inner circle
  fill(#5b1978);
  circle(0, 0, 375);

  // Define pentagram
  pentagram = createShape();
  pentagram.beginShape();
  pentagram.stroke(255);
  pentagram.strokeWeight(2);
  for (int i=0; i<10; i+=2){
    pentagram.vertex(115*cos(i*2*PI/5), 115*sin(i*2*PI/5));
  }
  pentagram.endShape(CLOSE);

  // Big pentagram for calculating little pentagrams
  shape(pentagram);

  pushMatrix();
  // Little pentagram circles
  fill(#ae2a5f);
  for(int i = 0; i < pentagram.getVertexCount(); i++) {
    circle(pentagram.getVertex(i).x, pentagram.getVertex(i).y, 130);
  }
  popMatrix();
  
  // Big pentagram
  pentagram.setFill(#ae2a5f);
  shape(pentagram);
  
  // Little pentagrams
  pentagram.setFill(#ff005a);
  scale(0.5);
  for(int i = 0; i < pentagram.getVertexCount(); i++) {
    shape(pentagram, 2*pentagram.getVertex(i).x, 2*pentagram.getVertex(i).y);
  }

  popMatrix();
}
