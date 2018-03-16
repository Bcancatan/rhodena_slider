import controlP5.*;
import processing.pdf.*;
boolean record;

ControlP5 cp5;

float r = 250;
float petalLen;
int resolution = 300;
float theta;
float x;
float y;
float k;
float n = 10;
float d = 30;
float c = 0;

int index = 0;
float animationVal1;

void setup() {
  //fullScreen();
  size(600, 600);

  cp5 = new ControlP5(this);



  cp5.addSlider("resolution")
    .setLabel("Piksel Sayisi")
    .setPosition(20, 20)
    .setRange(20, 360*2)
    ;

cp5.addSlider("r")
    .setLabel("Boyut")
    .setPosition(20, 35)
    .setRange(20, 300)
    ;
cp5.addSlider("n")
    .setLabel("n Degeri")
    .setPosition(20, 50)
    .setRange(0, 50)
    .setNumberOfTickMarks(51);
  cp5.addSlider("d")
    .setLabel("d Degeri")
    .setPosition(20, 65)
    .setRange(0, 100)
    .setNumberOfTickMarks(51);
}

void draw() {
  
  animationVal1 = d;
  

  background(255);
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  //fill(255);
  noFill();
  stroke(0);

  k = n / d;

  beginShape();
  for (int i = 0; i < resolution; i++) {

    theta = map(i*ceil(animationVal1), 0, resolution, 0, TWO_PI);
   
    petalLen = sin(n*theta);

    x = r * petalLen * sin(theta);
    y = r * petalLen * cos(theta);

    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();

  if (record == true) {
    endRecord();
    record = false;
  }
  
  if(frameCount % 25 == 0) {
     
      index = index + 1;
  }
}


void mousePressed() {
  record = true;
}