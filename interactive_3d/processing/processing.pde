import processing.serial.*;

Serial port;
String instruction;
int lf = 10;  // new line
float prev_d = 0;

void setupPort() {
  port = new Serial(this, Serial.list()[1], 9600);
  port.clear();
  port.readStringUntil(lf);
}

void setup() {
  size(1440, 900, P3D);
  colorMode(RGB);
  background(0);
  noStroke();
  setupPort();
}

void draw(){
    while (port.available() > 0) instruction =  port.readStringUntil(lf);
    if (instruction != null) {
      String[] instructions = instruction.trim().split(" ");
      if (instructions.length == 4) {
        float d = float(instructions[0].split("=")[1]);
        int r = int(instructions[1].split("=")[1]);
        int g = int(instructions[2].split("=")[1]);
        int b = int(instructions[3].split("=")[1]);
        pushMatrix();
        translate(width/2, height/2, 0);
        ambientLight(102, 102, 102);
        directionalLight(102, 102, 102, 0, 0, -20);
        lightSpecular(204, 204, 204);
        specular(255, 255, 255);
        rotateX(0.01 * frameCount);
        rotateY(0.01 * frameCount);
        background(0);
        shininess(5.0); 
        fill(r, g, b);
        println(d);
        d = min(d, 12);
        d = prev_d * 0.5 + d * 0.5;
        prev_d = d;
        box(map(d, 0, 12, 300, 50));
        popMatrix();
      }
    }
}
