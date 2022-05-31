import TUIO.*;
TuioProcessing tuioClient;

// Store a mapping from TUIO symbol IDs to corresponding TrackedObject instances.
HashMap<Integer, TrackedObject> objs= new HashMap<Integer, TrackedObject>();
int counter = 0;

float rotateLShoulder = 0.0;
float rotateLElbow = 0.0;
float rotateLWrist = 0.0;
float rotateRShoulder = 0.0;
float rotateRElbow = 0.0;
float rotateRWrist = 0.0;

float rotateLHip = 0.0;
float rotateLKnee = 0.0;
float rotateLAnkle = 0.0;
float rotateRHip = 0.0;
float rotateRKnee = 0.0;
float rotateRAnkle = 0.0;



void setup() {
  size(800, 800);
  surface.setTitle("Rubix");
  tuioClient  = new TuioProcessing(this);
}


void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  
  drawMan();
  
  drawTextBox();
  
  counter++;
  //println(counter);
  
  synchronized(objs) {
  print("{ ");
  for (TrackedObject o : objs.values()) {
      print(o.fiducialID + " ");
    } println("} ");
  }
  
  box1();
  box2();
  box3();
  
  action();
}//close for draw

void action() {
  if(containsID(0) && containsID(7)) {
    rotateLShoulder+= 0.01;
  }
  if(containsID(1) && containsID(7)) {
    rotateLElbow+= 0.01;
  }
  if(containsID(2) && containsID(7)) {
    rotateLWrist+= 0.01;
  }
  if(containsID(0) && containsID(8)) {
    rotateLShoulder-= 0.01;
  }
  if(containsID(1) && containsID(8)) {
    rotateLElbow-= 0.01;
  }
  if(containsID(2) && containsID(8)) {
    rotateLWrist-= 0.01;
  }
}

void drawMan() {
  ellipse(400, 400, 100, 90); //head
  push();
  fill(0);
  ellipse(385, 405, 4, 15); //left eye
  ellipse(415, 405, 4, 15); //right eye
  arc(400, 425, 10, 15, 0, PI); //mouth
  pop();
  
  line(400, 445, 400, 560); //body
  line(390, 560, 410, 560); //pelvis
  
  push();//LEFT ARM
  translate(400, 445);
  rotate(rotateLShoulder);
  translate(-400, -445);
  line(400, 445, 350, 445); //upper arm
  push();//LEFT
  translate(350, 445);
  rotate(rotateLElbow);
  translate(-350, -445);
  line(350, 445, 300, 445); //lower arm
  push();//LEFT
  //translate(30, 0);
  translate(300, 445);
  rotate(rotateLWrist);
  translate(-300, -445);
  //translate(30, 0);
  ellipse(300, 445, 20, 10); //hand
  pop();
  pop();
  pop();
  
  push();//RIGHT ARM
  translate(400, 445);
  rotate(rotateRShoulder);
  translate(-400, -445);
  line(400, 445, 450, 445); //upper arm
  push();//RIGHT
  translate(450, 445);
  rotate(rotateRElbow);
  translate(-450, -445);
  line(450, 445, 500, 445); //lower arm
  push();//RIGHT
  translate(500, 445);
  rotate(rotateRWrist);
  translate(-500, -445);
  ellipse(500, 445, 20, 10); //hand
  pop();
  pop();
  pop();
  
  //TO DO//
  
  push();//LEFT LEG
  translate(390, 560);
  rotate(rotateLHip);
  translate(-390, -560);
  line(390, 560, 390, 620); //thigh
  push();//LEFT
  translate(390, 610);
  rotate(rotateLKnee);
  translate(-390, -610);
  line(390, 610, 390, 680); //shin
  push();//LEFT
  translate(380, 680);
  rotate(rotateLAnkle);
  translate(-380, -680);
  ellipse(380, 680, 20, 10); //foot
  pop();
  pop();
  pop();
  
  push();//RIGHT LEG
  translate(410, 560);
  rotate(rotateRHip);
  translate(-410, -560);
  line(410, 560, 410, 620); //thigh
  push();//RIGHT
  translate(410, 610);
  rotate(rotateRKnee);
  translate(-410, -610);
  line(410, 610, 410, 680); //shin
  push();//RIGHT
  translate(420, 680);
  rotate(rotateRAnkle);
  translate(-420, -680);
  ellipse(420, 680, 20, 10); //foot
  pop();
  pop();
  pop();
}

void box1() {
  //0-2: LeftArm //3-5: RightArm
  if(containsID(0)) {
      textSize(30);
      push();
      fill(255, 0, 0);
      text("Left Shoulder", 30, 56);
      pop();
  }
  if(containsID(1)) {
      textSize(30);
      push();
      fill(255, 0, 0);
      text("Left Elbow", 30, 56);
      pop();
  }
  if(containsID(2)) {
      textSize(30);
      push();
      fill(255, 0, 0);
      text("Left Wrist", 30, 56);
      pop();
  }
  if(containsID(3)) {
      textSize(30);
      push();
      fill(255, 0, 0);
      text("Right Shoulder", 30, 56);
      pop();
  }
  if(containsID(4)) {
      textSize(30);
      push();
      fill(255, 0, 0);
      text("Right Elbow", 30, 56);
      pop();
  }
  if(containsID(5)) {
      textSize(30);
      push();
      fill(255, 0, 0);
      text("Right Wrist", 30, 56);
      pop();
  }
}

void box2() {
  if(containsID(6)) {
      textSize(30);
      push();
      fill(0, 255, 0);
      text("Translate", 270, 56);
      pop();
  }
  if(containsID(7)) {
      textSize(30);
      push();
      fill(0, 255, 0);
      text("Rotate+", 270, 56);
      pop();
  }
  if(containsID(8)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("Rotate-", 520, 56);
      pop();
  }
}

void box3() {
  if(containsID(9)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("X Axis +", 520, 56);
      pop();
  }
  if(containsID(10)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("Y Axis +", 645, 56);
      pop();
  }
  if(containsID(11)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("X Axis", 520, 56);
      pop();
  }
  if(containsID(12)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("Y Axis", 645, 56);
      pop();
  }
  if(containsID(13)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("X Axis -", 520, 56);
      pop();
  }
  if(containsID(14)) {
      textSize(30);
      push();
      fill(0, 0, 255);
      text("Y Axis -", 645, 56);
      pop();
  }
}

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  // Create a new TrackedObject, with  (x, y) location corresponding to the
  // TUIO object, random fill colour.
  // Add it to objs, mapped to the TUIO symbol ID.

  TrackedObject o= new TrackedObject(tobj.getScreenX(width), tobj.getScreenY(height), 50, 50, tobj.getSymbolID());
  o.fillCol=color(random(0, 255), random(0, 255), random(0, 255));
  synchronized(objs) {
    objs.put(new Integer(tobj.getSymbolID()), o);
  }
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  // Remove object corresponding to symbol ID from objs
  synchronized(objs) {
    objs.remove(new Integer(tobj.getSymbolID()));
  }
}


// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  // Get the object from objs corresponding to symbol ID;
  // update its x, y position using values from the TUIO object.
  synchronized(objs) {
    TrackedObject o= objs.get(new Integer(tobj.getSymbolID()));
    o.x=tobj.getScreenX(width);
    o.y=tobj.getScreenY(height);
  }
}

//----------

void drawTextBox() {
  //outer
  stroke(0);
  strokeWeight(2);
  fill(255);
  rect(25, 20, 750, 50);
  
  line(250, 20, 250, 70);
  line(500, 20, 500, 70);
}

void drawLetter(String n, float x, float y) {
  textSize(32);
  fill(0);
  text(n, x, y);
}






//-----------------------------------------------------------//



class TrackedObject {
  /* TrackedObjects are things that're displayed
   on screen and created & moved around - e.g. 
   by the movement of TUIO objects
   */

  int x, y, xSize, ySize, fiducialID;
  color fillCol, strokeCol;

  TrackedObject(int xx, int yy, int sx, int sy, int id) {
    x=xx; 
    y=yy; 
    xSize=sx; 
    ySize=sy;
    fillCol=color(100);
    strokeCol=color(200);
    fiducialID=id;
  }

  void draw() {
    /* basic draw method - just draws a circle
     */
    pushStyle();
    fill(fillCol);
    stroke(strokeCol);
    ellipse(x, y, xSize, ySize);
    popStyle();
  }
}

//contains function
boolean containsID(int id) {
  boolean c = false;
  synchronized(objs) {
    for (TrackedObject o : objs.values()) {
      if(o.fiducialID == id) {
         c = true;
         break;
      }
    }
  }
  
  return c;
}
