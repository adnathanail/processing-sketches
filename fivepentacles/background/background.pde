int[][] points = {{400, 400}, {600, 300}, {800, 400}, {700, 600}, {500, 600}};
int[] holder = {0, 0};
int col;

void setup() {
  size(1000, 1000);
  pixelDensity(2);
  background(255);
  col = 100;
}

void draw() {
  fill(col);
  strokeWeight(1);
  beginShape();
  vertex(points[0][0], points[0][1]);
  vertex(points[1][0], points[1][1]);
  vertex(points[2][0], points[2][1]);
  vertex(points[3][0], points[3][1]);
  vertex(points[4][0], points[4][1]);
  endShape(CLOSE);

  holder[0] = points[0][0];
  holder[1] = points[0][1];
  points[0][0] = (points[0][0] + points[1][0])/2;
  points[0][1] = (points[0][1] + points[1][1])/2;
  points[1][0] = (points[1][0] + points[2][0])/2;
  points[1][1] = (points[1][1] + points[2][1])/2;
  points[2][0] = (points[2][0] + points[3][0])/2;
  points[2][1] = (points[2][1] + points[3][1])/2;
  points[3][0] = (points[3][0] + points[4][0])/2;
  points[3][1] = (points[3][1] + points[4][1])/2;
  points[4][0] = (points[4][0] + holder[0])/2;
  points[4][1] = (points[4][1] + holder[1])/2;
  
  col+=10;
}
