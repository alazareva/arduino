class Point {
  
  int x;
  int y;
  color c;
  int d;
  
  Point(int x, int y, color c, int d) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.d = d;
  }

  void show() {
    fill(c);
    circle(this.x, this.y, this.d);
  }
}

class Cursor {
  
  Boolean pressed;
  int x;
  int y;
  int d;
  color c;

  Cursor(int x, int y, int d) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.c = color(0, 80);
  }
  
  void move(int dx, int dy) {
    PVector dp = new PVector(dx, dy);
    dp.limit(this.d);
    this.x += dp.x;
    this.y += dp.y;
  }
  
  void show() {
    fill(this.c);
    circle(this.x, this.y, this.d);
  }
}
