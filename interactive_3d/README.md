## Drawing with Arduino
This project uses a [color sensor](https://www.sunfounder.com/product-tcs3200-color-sensor-module.html) and a [distance sensor](https://www.sunfounder.com/ultrasonic-module-hc-sr04-distance-sensor.html) to control
a Processing animation.

![demo](https://github.com/alazareva/arduino/tree/master/interactive_3d/demo.gif)

## Wiring it up
Color Sensor
S0 => 3
S1 => 4
S2 => 5
S3 => 6
OUT => 2

Distance Sensor
Trig => 8
Echo => 9

Upload the Arduino sketch.
Run the processing sketch.
Move your hand close to the distance sensor to zoom in, put a colored object in front of the color sensor to change image color.
