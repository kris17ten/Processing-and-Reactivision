int counter = 0;

void setup() {
  size(720, 500);
  frame.setTitle("Week1 Robot");
  background(255);
}

void draw() {
  background(255);
  createMouseTrail();
  drawLoadingBox();
  
  drawArms();
  drawBody();
  drawHead();
  
  if(counter > 380) {
    drawHappyEyes();
    drawTextBox();
  } else if(counter % 100 > 47 && counter % 100 < 53) {
    drawClosedEyes();
  } else {
    drawOpenEyes();
  }
  
  //increment counter
  counter++;
  println(counter);
}

void drawHead() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  arc(350, 100, 80, 70, PI+0.5, TWO_PI-0.5);
  arc(350, 130, 110, 50, 0, PI);
  curve(300, 140, 295, 130, 314, 83, 330, 95);
  curve(400, 140, 405, 130, 385, 83, 380, 95);
  
  drawFace();
}

void drawFace() {
  stroke(0);
  strokeWeight(1);
  fill(0);
  arc(350, 130, 80, 50, PI, TWO_PI);
  arc(350, 130, 80, 20, 0, PI);
}

void drawBody() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  //body
  arc(350, 155, 120, 280, 0, PI);
  
  //neck
  ellipse(350, 155, 120, 10);
}

//ARMS
void drawArms() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  //left
  ellipse(290, 210, 20, 100);
  //right
  ellipse(410, 210, 20, 100);
}

void drawHappyArms() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  //left
  ellipse(290, 210, 20, 100);
  //right
  ellipseMode(CORNERS);
  ellipse(410, 210, 360, 160);
}


//EYES
void drawOpenEyes() {
  //eyes
  fill(0, 0, 255);
  ellipse(340, 125, 10, 15);
  ellipse(360, 125, 10, 15);
}

void drawClosedEyes() {
  //eyes
  stroke(0, 0, 255);
  strokeWeight(3);
  line(335, 125, 345, 125);
  line(355, 125, 365, 125);
}

void drawHappyEyes() {
  stroke(0, 0, 255);
  strokeWeight(4);
  arc(340, 125, 10, 15, PI, TWO_PI);
  arc(360, 125, 10, 15, PI, TWO_PI);
}


//EXTRA
void drawLoadingBox() {
  if(counter < 380) {
    //text
    textSize(15);
    fill(150);
    text("Loading...", 20, 332);
    
    //box
    stroke(150, 50, 50, 120);
    strokeWeight(8);
    fill(255);
    if(counter < 340) {
      rect(20, 340, counter*2, 5);
    } else {
      rect(20, 340, 680, 5);
    }
  }
}

void drawTextBox() {
  //outer
  stroke(0);
  strokeWeight(2);
  fill(255);
  rect(20, 350, 680, 140);
  
  //inner
  stroke(0);
  strokeWeight(4);
  fill(255);
  rect(25, 355, 670, 130);
  
  //triangle
  blinkTriangle();
  
  //text animation
  if(counter > 360) {
    drawLetter("H", 40, 390);
  }
  if(counter > 370) {
    drawLetter("e", 65, 390);
  }
  if(counter > 380) {
    drawLetter("l", 82, 390);
  }
  if(counter > 390) {
    drawLetter("l", 95, 390);
  }
  if(counter > 400) {
    drawLetter("o", 105, 390);
  }
  if(counter > 410) {
    drawLetter("W", 150, 390);
  }
  if(counter > 420) {
    drawLetter("o", 178, 390);
  }
  if(counter > 430) {
    drawLetter("r", 195, 390);
  }
  if(counter > 440) {
    drawLetter("l", 210, 390);
  }
  if(counter > 450) {
    drawLetter("d", 220, 390);
  }
  if(counter > 460) {
    drawLetter("!", 238, 390);
  }
}

void drawLetter(String n, float x, float y) {
  textSize(32);
  fill(0);
  text(n, x, y);
}

void blinkTriangle() {
  if(counter > 500) {
    if(counter % 30 > 15) {
      triangle(680, 370, 670, 370, 675, 375);
    }
  }
}

float[] xm = new float[36]; 
float[] ym = new float[36];
void createMouseTrail() {
  for(int i = 0; i<xm.length-1; i++) {
    //reset points
    xm[i] = xm[i+1];
    ym[i] = ym[i+1]; 
    
    //draw points
    stroke(255, 0, 0, 255/(xm.length-i));
    strokeWeight(i/3);
    point(xm[i], ym[i]); 
  }
  
  //set last point to current mouse point
  xm[xm.length-1] = mouseX; 
  ym[ym.length-1] = mouseY;
}
