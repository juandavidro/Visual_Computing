import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
ControlDevice device; 

// frames stuff:
Scene scene;
boolean snPicking;

int flockWidth = 6280;
int flockHeight = 5720;
int flockDepth = 4600;
boolean avoidWalls = true;

void setup() {
  size(1400, 700, P3D);
  openSpaceNavigator();
  scene = new Scene(this);
  scene.setFieldOfView(PI/3);
  //scene.setType(Graph.Type.ORTHOGRAPHIC);
  scene.setRadius(5500);
  scene.fitBallInterpolation();
  Shape plane = new Shape(scene, loadShape("rocket.obj"));
  smooth();
}

void draw() {
  background(255);
  //scene.drawAxes();
  walls();
  rings();
  scene.traverse();
  
  if (snPicking)
    spaceNavigatorPicking();
  else
    spaceNavigatorInteraction();
}

void rings() {
  pushMatrix();
  noFill();
  //  stroke(100,200,200);
  strokeWeight(3);
  rotateZ(radians(45));
  rotateY(radians(-frameCount*0.5));
  //rotateZ(radians(frameCount*2));
  translate(200, 700);
  ellipse(0, 0, 250, 550);
  popMatrix();
}

void spaceNavigatorPicking() {
  float x = map(0, -.8f, .8f, 0, width);
  float y = map(0, -.8f, .8f, 0, height);
  // update the space navigator tracked frame:
  scene.cast("SPCNAV", x, y);
  // draw picking visual hint
  pushStyle();
  strokeWeight(3);
  stroke(0, 255, 0);
  scene.drawCross(x, y, 30);
  popStyle();
}

void spaceNavigatorInteraction() {
  scene.translate("SPCNAV", 10 * device.getSlider("xPos").getValue(), 10 * device.getSlider("yPos").getValue(), 10 * device.getSlider("yRot").getValue());
  //scene.rotate("SPCNAV", -device.getSlider("xRot").getValue() * 20 * PI / width, device.getSlider("yRot").getValue() * 20 * PI / width, device.getSlider("zRot").getValue() * 20 * PI / width);
}

void mouseMoved() {
  scene.cast();
}

void mouseDragged() {
  if (mouseButton == LEFT)
    scene.spin();
  else if (mouseButton == RIGHT)
    scene.translate();
  else
    scene.scale(scene.mouseDX());
}

void mouseWheel(MouseEvent event) {
  scene.zoom(event.getCount() * 20);
}

void keyPressed() {
  if (key == ' ')
    snPicking = !snPicking;
}

void walls() {
  pushStyle();

  noFill();
  stroke(255, 255, 0);

   
  line(flockHeight/2, -flockHeight/2, -17000, flockHeight/2, flockHeight/2, -9000);
  line(-flockHeight/2, -flockHeight/2, 0, -flockHeight/2, flockHeight/2, 0);

  //line(0, 0, flockDepth, 0, flockHeight, flockDepth);
  //line(0, 0, 0, flockWidth, 0, 0);
  //line(0, 0, flockDepth, flockWidth, 0, flockDepth);

  //line(flockWidth, 0, 0, flockWidth, flockHeight, 0);
  //line(flockWidth, 0, flockDepth, flockWidth, flockHeight, flockDepth);
  //line(0, flockHeight, 0, flockWidth, flockHeight, 0);
  //line(0, flockHeight, flockDepth, flockWidth, flockHeight, flockDepth);

  //line(0, 0, 0, 0, 0, flockDepth);
  //line(0, flockHeight, 0, 0, flockHeight, flockDepth);
  //line(flockWidth, 0, 0, flockWidth, 0, flockDepth);
  //line(flockWidth, flockHeight, 0, flockWidth, flockHeight, flockDepth);
  popStyle();
}

void openSpaceNavigator() {
  control = ControlIO.getInstance(this);  
  device = control.getMatchedDevice("xbox1");//magic name, for windows
  if (device == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
}
