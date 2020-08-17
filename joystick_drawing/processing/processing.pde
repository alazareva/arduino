import processing.serial.*;

Serial port;
String instruction;
int lf = 10;    // new line

int midValueX = 500;
int midValueY = 500;

Cursor cursor;
int pointSize = 20;

int currentColor = 8; // black
color[] colors;

ArrayList<Point> points;


void setupPort() {
  port = new Serial(this, Serial.list()[1], 9600);
  port.clear();
  port.readStringUntil(lf);
}

void setupColors() {
  colors = new color[10];
  for (int i = 0; i < 8; i ++) {
    colors[i] = color(45 * i, 100, 100);
  }
  colors[8] = color(0);
  colors[9]= color(360);
}

void setup() {

  size(1400, 800);
  colorMode(HSB, 360, 100, 100, 100);
  background(360);

  setupPort();
  setupColors();

  points = new ArrayList<Point>();
  cursor = new Cursor(width/2, height/2, pointSize);
  cursor.show();
}

void drawColors() {
  stroke(200);
  for (int i = 0; i < 10; i ++) { 
    if (i == currentColor) strokeWeight(2);
    else strokeWeight(0.5);
    fill(colors[i]);
    square(140 * i, 0, 140);
  }
  noStroke();
}


void changeColor() {
  currentColor = cursor.x / 140;
}


Boolean inColorArea() {
  return cursor.y < 100 && cursor.x > 0 && cursor.x < width;
}

void draw() {
  background(360);
  drawColors();
  while (port.available() > 0) instruction =  port.readStringUntil(lf);
  if (instruction != null) {
    String[] instructions = instruction.trim().split(" ");
    if (instructions.length == 3) {
      int xDir = int(instructions[0]) / 100 * 100;
      int yDir = int(instructions[1])/ 100 * 100;
      Boolean pressed = instructions[2].equals("0");      
      if (pressed) {
        if (inColorArea()) changeColor();
        else  points.add(new Point(cursor.x, cursor.y, colors[currentColor], pointSize));
      }
      cursor.move(xDir - midValueX, yDir - midValueY);
      for (Point point : points) {
        point.show();
      }
    }
  }
  cursor.show();
}
