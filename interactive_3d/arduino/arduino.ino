#include <NewPing.h>
#include <TimerOne.h>


#define TRIGGER_PIN  8
#define ECHO_PIN     9
#define MAX_DISTANCE 400

#define S0     3
#define S1     4
#define S2     5
#define S3     6  
#define OUT    2  


NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);

int frequency = 0;

void setup() {
  Serial.begin(9600);

  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(OUT, INPUT);
  
  digitalWrite(S0,HIGH);
  digitalWrite(S1,LOW);
}

void loop() {
  unsigned int uS = sonar.ping();
  Serial.print("D=");
  Serial.print(uS / US_ROUNDTRIP_CM);

  // Red
  digitalWrite(S2,LOW);
  digitalWrite(S3,LOW);
  frequency = pulseIn(OUT, LOW);
  int r = map(frequency, 40, 150, 255, 0);

  Serial.print(" R=");
  Serial.print(r);

  // Green
  digitalWrite(S2,HIGH);
  digitalWrite(S3,HIGH);
  frequency = pulseIn(OUT, LOW);
  int g = map(frequency, 60, 160, 255, 0);
  Serial.print(" G=");
  Serial.print(g);

  // Blue
  digitalWrite(S2,LOW);
  digitalWrite(S3,HIGH);
  frequency = pulseIn(OUT, LOW);
  int b = map(frequency, 50, 130, 255, 0);
  Serial.print(" B=");
  Serial.println(b);

  delay(100);
}
