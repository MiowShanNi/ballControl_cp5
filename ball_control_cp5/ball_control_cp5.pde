import controlP5.*;
ControlP5 cp5;
Slider slider;
ColorPicker c;
ColorPicker c1;

int myColor;
int a1,a2;
int dragX, dragY,moveX,moveY;

float x;
float y;
float n,n1;
float easing = 0.05;
boolean toggleValue = true;


void setup() {
    size(500,500);
    smooth();
    
    cp5 = new ControlP5(this);
    slider = cp5.addSlider("Set Size");
    slider.setPosition(10,30).setSize(300,30).setMax(500).moveTo("Size");
    cp5.addToggle("toggleValue").setPosition(10,30).setSize(50,50).moveTo("Shape");
    c = cp5.addColorPicker("picker").setPosition(10,30).setColorValue(color(255,0,0,128)).moveTo("Color");
    c1 = cp5.addColorPicker("picker1").setPosition(10,30).setColorValue(color(0)).moveTo("Strokecolor");
    
    
    }

void draw() {
  background(255);
  strokeWeight(18);
  stroke(c1.getColorValue());
  myColor = lerpColor(a1,a2,n);
  n += (1-n)* 0.1;
  
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
        
    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;
  
    ellipse(mouseX, mouseY, 33, 33);
    
     
  if ((mouseX <= 250) && (mouseY <= 250)) {
    rect(0, 0, 250, 250); 
  } else if ((mouseX <= 250) && (mouseY > 250)) {
    rect(0, 250, 250, 250); 
  } else if ((mouseX > 250) && (mouseY <= 250)) {
    rect(250, 0, 250, 250); 
  } else {
    rect(250, 250, 250, 250); 
  }
    
       
     if(toggleValue==false){
       
     rect(x,y,slider.getValue(),slider.getValue());
     fill(c.getColorValue()); 
     }
     
     else {
       
     ellipse(x,y,slider.getValue(),slider.getValue());
     fill(c.getColorValue());
    }
}

public void colorC(int theValue) {
  a1 = a2;
}