
float x = 0.;
float y = 0.;
float r1 = 50.;
float r2 = 15.;
float t = 0.;
float w1 = 2.*PI*.5/60.;
float w2 = 2.*PI*.05/60.;

void setup(){
  size(200,200);
  background(#FFFFFF);
  fill(#00FF00);
  noStroke();
}

void draw(){
  t+=1;
  fill(#FFFFFF);
  rect(0,0,width, height);
  x = r1*cos(w2*t) - r2*cos(w1*t);
  y = r1*sin(w2*t) - r2*sin(w1*t);
  
  fill(#00FF00);
  ellipse(x+width/2,-y+height/2,5,5);
  ellipse(-x+width/2,y+height/2,5,5);
  ellipse(x+width/2,y+height/2,5,5);
  ellipse(-x+width/2,-y+height/2,5,5);
}
