// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Star[] stars = new Star[3];
//Star[] statstars = new Star [300];

Center c;
Arm a;
boolean hitwally;
boolean hitwallx;

void setup() {

  size(1920, 1200);
  background(0);
 /* for (int i = 0; i < statstars.length; i++) {
    statstars[i] = new Star(random(0.1, .1), random(width), random(height), 125);
  }*/
  //float randheight = random(height);
  for (int i = 0; i < stars.length; i+=0) {
    
     int dist = 1000;
    
     float distx = random(0,dist);
     float disty = random(0,dist);
     
     float quadrantvar = random(-1,1);
     
     if (quadrantvar <= -0.5) {
       distx = width - distx;
       disty = height - disty;
     }
     else if (quadrantvar <= 0) {
       disty = height - disty;
     }
     else if (quadrantvar <= 0.5) {
       distx = width - distx;
     }
     
     //(dist(distx, disty, width/2, height/2) >= 350 && dist(distx, disty, width/2, height/2) <= 400) football shape
     //(dist(width/2, disty, width/2, height/2) >= 0 && dist(width/2, disty, width/2, height/2) <= 10) double spiral
     //(disty <= height/2 && dist(width/2, disty, width/2, height/2) <= 10) single spiral
     if (disty <= height/2 && dist(width/2, disty, width/2, height/2) <= 10) {
      stars[i] = new Star(random(0.1, .1), distx, disty);//stars[i] = new Star(random(0.1, .1), distx, disty);
      i++;
     }
  }
  c = new Center();
  a = new Arm();

}

void draw() {

  //background(0);
  /*if (c.location.x >= width + 5) {
    hitwallx = true;
  }
  else if (c.location.x <= -5) {
    hitwallx = false;
  }
  if (hitwallx == false) {
    c.location.x = c.location.x + 1;
  }
  else {
    c.location.x = c.location.x - 1;
  }*/
  //---------------------------------------------
  if (c.location.y >= height + 5) {
    hitwally = true;
  }
  else if (c.location.y <= -5) {
    hitwally = false;
  }
  if (hitwally == false) {
    c.location.y = c.location.y + 1;
  }
  else {
    c.location.y = c.location.y - 1;
  }
  
  c.display();
  //a.display();
  c.drag();
  c.hover(mouseX, mouseY);
  /*for (int i = 0; i < statstars.length; i++) {
    statstars[i].display();
  }*/

  for (int i = 0; i < stars.length; i++) {
    PVector force = c.attract(stars[i]);
    //PVector aforce = a.attract(stars[i]);
    //float dist = dist(stars[i].location.x, stars[i].location.y, a.location.x, a.location.y);
    //float distvar = 1 / ((dist/250) + 0.1);
    
    stars[i].applyForce(force);
    //stars[i].applyForce(aforce);
    stars[i].update();
    stars[i].display();
  }

  float cv = random(0,1);
  int var = 30;
  int r = 250; // ORANGE
  int g = 125; // ORANGE
  int b = 60; // ORANGE
  
  /*
  int r = 130; // PURPLE
  int g = 115; //PURPLE
  int b = 250; //PURPLE
  */
  
  
  stroke(random(r-var,r+var),random(g-var,g+var),random(b-var,b+var),50);
  strokeWeight(1);

  line(stars[0].location.x, stars[0].location.y, stars[1].location.x, stars[1].location.y);
  line(stars[1].location.x, stars[1].location.y, stars[2].location.x, stars[2].location.y);
  line(stars[2].location.x, stars[2].location.y, stars[0].location.x, stars[0].location.y);
  }
  
 /* for (int i = 0; i < stars.length; i++) {
    for (int j = 0; j < stars.length; j++) {
      float stardist = dist(stars[i].location.x, stars[i].location.y, stars[j].location.x, stars[j].location.y);
      float r = random(100);

      if (stardist >= 99 && stardist <= 100 && r <= .5) {
        
        strokeWeight(1);
        
        stroke(random(100,255), random(100,255), random(100,255));
        line(stars[i].location.x, stars[i].location.y, stars[j].location.x, stars[j].location.y);
        //line(stars[i].location.x, stars[i].location.y, width/2, height/2);
      }
    }
  }*/


void mousePressed() {
  c.clicked(mouseX, mouseY);
}

void mouseReleased() {
  c.stopDragging();
}